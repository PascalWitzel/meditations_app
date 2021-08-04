import 'package:flutter/material.dart';
import 'package:meditations_app/themes/theme_notifier.dart';
import 'package:provider/provider.dart';

class CurvePainter extends CustomPainter {
  var themeNotifier = null;
  double a, b;
  Color color = null;

  CurvePainter(double a, double b, context) {
    this.a = a;
    this.b = b;
    this.themeNotifier = Provider.of<ThemeNotifier>(context);
    color = Theme.of(context).primaryColor;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = color;
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