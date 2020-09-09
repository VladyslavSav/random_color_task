import 'package:flutter/material.dart';

class WaveFromTap extends StatelessWidget {
  final Animation<double> animation;
  final Offset tapPoint;
  final Color color;

  WaveFromTap({this.animation, this.tapPoint, this.color});

  @override
  Widget build(BuildContext context) =>
      _WaveTransition(animation: animation, tapPoint: tapPoint, color: color);
}

class _WaveTransition extends StatelessWidget {
  final Animation<double> animation;
  final Offset tapPoint;
  final Color color;

  _WaveTransition({this.animation, this.tapPoint, this.color});

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: animation,
        builder: (context, _) => CustomPaint(
          painter: _WavePainter(
              radius: animation.value, tapPoint: tapPoint, color: color),
        ),
      );
}

class _WavePainter extends CustomPainter {
  final color;
  final Offset tapPoint;
  final double radius;

  var wavePaint = Paint();

  _WavePainter({this.tapPoint, this.radius, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    wavePaint.color = color;
    canvas.drawCircle(tapPoint, radius, wavePaint);
  }

  @override
  bool shouldRepaint(_WavePainter oldDelegate) {
    return true;
  }
}
