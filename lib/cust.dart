import 'dart:math';

import 'package:flutter/material.dart';

class Cust extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      padding: EdgeInsets.all(20),
      child: CustomPaint(painter: CustomColor()),
    );
  }
}

class CustomColor extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    print(size);
    // 绘制3个圆
    canvas.drawCircle(
        Offset(0, 0), 18, Paint()..color = Color.fromARGB(155, 11, 133, 1));
    canvas.drawCircle(
        Offset(150, 150), 18, Paint()..color = Color.fromARGB(155, 11, 133, 1));
    canvas.drawCircle(
        Offset(300, 300), 18, Paint()..color = Color.fromARGB(155, 11, 133, 1));

    // 绘制直线
    canvas.drawLine(
        Offset(0, 0), Offset(150, 11), Paint()..color = Color(0xFF0A5F4C));

    // 绘制路劲
    canvas.drawPath(
        Path()
          ..moveTo(0, 15)
          ..lineTo(15, 11)
          ..lineTo(150, 150)
          ..close(),
        Paint()
          ..color = Colors.red
          ..style = PaintingStyle.fill);

    // 绘制椭圆
    // fromLTRB 左上右下
    canvas.drawOval(
        Rect.fromLTRB(0, 0, 220, 120), Paint()..color = Color(0xFF222222));

    // 绘制弧
    canvas.drawArc(
        Rect.fromLTRB(50, 100, 250, 220),
        10,
        pi / 2,
        true,
        Paint()
          ..color = Color(0xFF22FF11)
          ..style = PaintingStyle.stroke);


    // 绘制圆角矩形
    canvas.drawRRect(RRect.fromLTRBR(0, 0, 120, 120, Radius.circular(10)), Paint()..color = Color(0xFF122FFF));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
