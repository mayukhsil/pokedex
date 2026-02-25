import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:pokedex/models/pokemon_detail.dart';
import 'package:pokedex/models/pokemon_list_response.dart';

/// Raw HTTP client for the [PokéAPI](https://pokeapi.co/api/v2).
///
/// **Do not call this class directly from UI code or Riverpod providers.**
/// Use [PokemonRepository] instead — it owns the cache strategy and is the
/// only permitted caller of [NetworkService].
///
/// Internally uses [Dio] with a 15-second connect + receive timeout.
/// All errors are logged and re-thrown so the repository / notifier layer
/// can decide how to surface them to the user.
class NetworkService {
  static const String _baseUrl = 'https://pokeapi.co/api/v2';

  /// Number of results per page. Matches the API's default page size.
  static const int _pageSize = 20;

  final Dio _dio;
  final Logger _logger;

  NetworkService()
    : _dio = Dio(
        BaseOptions(
          baseUrl: _baseUrl,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
        ),
      ),
      _logger = Logger();

  /// Fetches a single page from `GET /pokemon`.
  ///
  /// [offset] is zero-based. Pass `0` for the first page, `20` for the
  /// second, etc. The response includes a [PokemonListResponse.next] URL
  /// that indicates whether more pages exist.
  ///
  /// Throws a [DioException] on network failure (logged before re-throw).
  Future<PokemonListResponse> fetchPokemonList({int offset = 0}) async {
    try {
      final response = await _dio.get(
        '/pokemon',
        queryParameters: {'limit': _pageSize, 'offset': offset},
      );
      return PokemonListResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      _logger.e('Error fetching Pokémon list', error: e);
      rethrow;
    }
  }

  /// Fetches full detail from `GET /pokemon/{nameOrId}`.
  ///
  /// [nameOrId] may be either the numeric ID (as a string) or the lowercase
  /// English name. Prefer numeric IDs for reliability across API versions.
  ///
  /// Throws a [DioException] on network failure (logged before re-throw).
  Future<PokemonDetail> fetchPokemonDetail(String nameOrId) async {
    try {
      final response = await _dio.get('/pokemon/$nameOrId');
      return PokemonDetail.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      _logger.e('Error fetching Pokémon detail for $nameOrId', error: e);
      rethrow;
    }
  }
}
