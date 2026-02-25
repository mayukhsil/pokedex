import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

/// Wraps [child] with a smooth, gyro-driven 3D tilt effect.
///
/// Listens to the device accelerometer and applies a subtle [Matrix4] perspective
/// transform so the sprite appears to float and react as the user tilts their
/// phone — like a holographic trading card effect.
///
/// **Behaviour**:
/// - Tilt range is clamped to ±[maxTiltDeg] degrees (default 18°).
/// - The transform is low-pass filtered ([smoothing] ∈ 0..1) to prevent jitter.
/// - On devices without a sensor the widget renders the [child] as-is.
///
/// **Usage**: drop it around any widget that should tilt:
/// ```dart
/// TiltSprite(child: CachedNetworkImage(...));
/// ```
class TiltSprite extends StatefulWidget {
  final Widget child;

  /// Maximum tilt in **degrees** in each axis. Default: 18°.
  final double maxTiltDeg;

  /// How aggressively to smooth sensor data (0 = no smoothing, 1 = frozen).
  /// Default: 0.15 — feels snappy but not jittery.
  final double smoothing;

  const TiltSprite({
    super.key,
    required this.child,
    this.maxTiltDeg = 18.0,
    this.smoothing = 0.15,
  });

  @override
  State<TiltSprite> createState() => _TiltSpriteState();
}

class _TiltSpriteState extends State<TiltSprite>
    with SingleTickerProviderStateMixin {
  StreamSubscription<AccelerometerEvent>? _sub;

  // Smoothed normalised tilt values (−1 … +1 each axis).
  double _tiltX = 0.0; // left/right
  double _tiltY = 0.0; // forward/back

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Drive repaints at 60 fps via an always-running ticker.
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    try {
      _sub = accelerometerEventStream(
        samplingPeriod: SensorInterval.gameInterval, // ~50 Hz
      ).listen((AccelerometerEvent e) {
        // Gravity vector: x ≈ left/right, y ≈ up/down, z ≈ toward user.
        // Normalise to ±1 using a ±10 m/s² window (approx ±g).
        final rawX = (e.x / 10.0).clamp(-1.0, 1.0);
        final rawY = (e.y / 10.0).clamp(-1.0, 1.0);

        // Low-pass filter to smooth jitter.
        _tiltX += (rawX - _tiltX) * widget.smoothing;
        _tiltY += (rawY - _tiltY) * widget.smoothing;
      });
    } catch (_) {
      // Sensor unavailable (simulator, desktop) — no-op.
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        final maxRad = widget.maxTiltDeg * math.pi / 180.0;
        final rotX =
            -_tiltY * maxRad; // pitch  (forward/back tilt → X rotation)
        final rotY = _tiltX * maxRad; // yaw    (side tilt → Y rotation)

        final m =
            Matrix4.identity()
              ..setEntry(
                3,
                2,
                0.0012,
              ) // perspective — feel distance from camera
              ..rotateX(rotX)
              ..rotateY(rotY);

        return Transform(
          transform: m,
          alignment: Alignment.center,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
