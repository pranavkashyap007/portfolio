import 'dart:math';
import 'package:flutter/material.dart';
import '../../../configs/configs.dart'; // for kSecondary color constant

/// A full-screen ripple effect background using CustomPainter
class RippleEffect extends StatefulWidget {
  static const kSecondary = Color(0xFFC7D3B6);

  /// Width and height of the ripple area (defaults to full screen)
  final double? width;
  final double? height;

  /// Color of the ripple waves
  final Color color;

  /// Number of simultaneous ripples
  final int waveCount;

  /// Duration of one ripple cycle
  final Duration duration;

  const RippleEffect({
    Key? key,
    this.width,
    this.height,
    Color? color, // make it nullable
    this.waveCount = 3,
    this.duration = const Duration(seconds: 5),
  })  : color = color ?? kSecondary, // assign fallback here
        super(key: key);

  @override
  _RippleEffectState createState() => _RippleEffectState();
}

class _RippleEffectState extends State<RippleEffect>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: widget.width ?? size.width,
      height: widget.height ?? size.height,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _DotRipplePainter(
              progress: _controller.value,
              color: widget.color,
              waveCount: widget.waveCount,
            ),
          );
          // return CustomPaint(
          //   painter: _RipplePainter(
          //     progress: _controller.value,
          //     color: widget.color,
          //     waveCount: widget.waveCount,
          //   ),
          // );
        },
      ),
    );
  }
}

class _RipplePainter extends CustomPainter {
  final double progress;
  final Color color;
  final int waveCount;

  _RipplePainter({
    required this.progress,
    required this.color,
    required this.waveCount,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = sqrt(size.width * size.width + size.height * size.height);

    for (int i = 0; i < waveCount; i++) {
      final double t = (progress + i / waveCount) % 1.0;
      final double radius = t * maxRadius;
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6 * (1 - t)
        ..color = color.withOpacity(1 - t);
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _RipplePainter old) => old.progress != progress;
}

class _DotRipplePainter extends CustomPainter {
  final double progress;
  final Color color;
  final int waveCount;
  final int dotsPerWave;

  _DotRipplePainter({
    required this.progress,
    required this.color,
    required this.waveCount,
    this.dotsPerWave = 12, // how many dots per ring
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = sqrt(size.width * size.width + size.height * size.height);

    for (int wave = 0; wave < waveCount; wave++) {
      final double t = (progress + wave / waveCount) % 1.0;
      final double radius = t * maxRadius;
      final double dotRadius = 8 * (1 - t); // max dot size = 8px
      final double opacity = (1 - t).clamp(0.0, 1.0);

      final paint = Paint()
        ..style = PaintingStyle.fill
        ..color = color.withOpacity(opacity);

      for (int i = 0; i < dotsPerWave; i++) {
        final angle = (2 * pi / dotsPerWave) * i;
        final offset = Offset(
          center.dx + cos(angle) * radius,
          center.dy + sin(angle) * radius,
        );
        canvas.drawCircle(offset, dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DotRipplePainter old) =>
      old.progress != progress;
}
