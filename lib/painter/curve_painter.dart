import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  double a, b;

  CurvePainter(double a, double b) {
    this.a = a;
    this.b = b;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.lightBlue;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * this.b);
    path.quadraticBezierTo(size.width / 2, size.height * this.a, size.width, size.height * this.b);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}