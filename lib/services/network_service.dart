import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:pokedex/models/pokemon_detail.dart';
import 'package:pokedex/models/pokemon_list_response.dart';

class NetworkService {
  static const String _baseUrl = 'https://pokeapi.co/api/v2';
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

  /// Fetches a page of Pokémon from the list endpoint.
  /// [offset] defaults to 0 (first page).
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

  /// Fetches detailed data for a single Pokémon by name or ID.
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
