import 'dart:math';

import 'package:flutter/material.dart';

class Cust extends StatefulWidget {
  @override
  _CustState createState() => _CustState();
}

class _CustState extends State<Cust> with TickerProviderStateMixin {
  var _sides = 3.0;

  Animation<double> animation;
  AnimationController controller;

  Animation<double> animation2;
  AnimationController controller2;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    Tween<double> _radiusTween = Tween(begin: 0.0, end: 200);
    Tween<double> _rotationTween = Tween(begin: -pi, end: pi);

    animation = _rotationTween.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    animation2 = _radiusTween.animate(controller2)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });

    controller.forward();
    controller2.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, snapshot) {
              return CustomPaint(
                painter: CustomColor(
                  sides: _sides,
                  radius: animation2.value,
                  radians: animation.value,
                ),
                child: Container(),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text('Sides'),
        ),
        Slider(
          value: _sides,
          min: 3.0,
          max: 10.0,
          label: _sides.toInt().toString(),
          divisions: 7,
          onChanged: (val) {
            setState(() {
              _sides = val;
            });
          },
        ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 16.0),
        //   child: Text('大小'),
        // ),
        // Slider(
        //   value: _radius,
        //   min: 10.0,
        //   max: MediaQuery.of(context).size.width / 2,
        //   onChanged: (val) {
        //     setState(() {
        //       _radius = val;
        //     });
        //   },
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 16.0),
        //   child: Text('旋转角度'),
        // ),
        // Slider(
        //   value: _radians,
        //   min: 0.0,
        //   max: pi,
        //   onChanged: (val) {
        //     setState(() {
        //       _radians = val;
        //     });
        //   },
        // ),
      ],
    );
  }
}

class CustomColor extends CustomPainter {
  final double sides;
  final double radius;
  final double radians;

  CustomColor({this.sides, this.radius, this.radians});

  @override
  void paint(Canvas canvas, Size size) {
    // 绘制3个圆
    // canvas.drawCircle(
    //     Offset(0, 0), 18, Paint()..color = Color.fromARGB(155, 11, 133, 1));
    // canvas.drawCircle(
    //     Offset(150, 150), 18, Paint()..color = Color.fromARGB(155, 11, 133, 1));
    // canvas.drawCircle(
    //     Offset(300, 300), 18, Paint()..color = Color.fromARGB(155, 11, 133, 1));

    // // 绘制直线
    // canvas.drawLine(
    //     Offset(0, 0), Offset(150, 11), Paint()..color = Color(0xFF0A5F4C));

    // // 绘制路劲
    // canvas.drawPath(
    //     Path()
    //       ..moveTo(0, 15)
    //       ..lineTo(15, 11)
    //       ..lineTo(150, 150)
    //       ..close(),
    //     Paint()
    //       ..color = Colors.red
    //       ..style = PaintingStyle.fill);

    // // 绘制椭圆
    // // fromLTRB 左上右下
    // canvas.drawOval(
    //     Rect.fromLTRB(0, 0, 220, 120), Paint()..color = Color(0xFF222222));

    // // 绘制弧
    // canvas.drawArc(
    //     Rect.fromLTRB(50, 100, 250, 220),
    //     10,
    //     pi / 2,
    //     true,
    //     Paint()
    //       ..color = Color(0xFF22FF11)
    //       ..style = PaintingStyle.stroke);

    // // 绘制圆角矩形
    // canvas.drawRRect(RRect.fromLTRBR(0, 0, 120, 120, Radius.circular(10)), Paint()..color = Color(0xFF122FFF));

    // 绘制一条直线
    // var paint = Paint()
    //   ..color = Colors.teal
    //   ..strokeWidth = 5
    //   ..strokeCap = StrokeCap.round;

    // Offset startingPoint = Offset(0, size.height / 2);
    // Offset endingPoint = Offset(size.width, size.height / 2);

    // canvas.drawLine(startingPoint, endingPoint, paint);

    // Path路劲 绘制一条直线
    // var paint = Paint()
    //   ..color = Colors.teal
    //   ..strokeWidth = 5
    //   ..style = PaintingStyle.stroke
    //   ..strokeCap = StrokeCap.round;

    // // 绘制路劲
    // var path = Path();
    // path.moveTo(0, size.height / 2);
    // path.lineTo(size.width, size.height / 2);
    // canvas.drawPath(path, paint);

    // 绘制圆环
    // var paint = Paint()
    //   ..color = Colors.teal
    //   ..strokeWidth = 5
    //   // stroke 空心
    //   ..style = PaintingStyle.stroke
    //   // round 直线突出部分的圆角
    //   ..strokeCap = StrokeCap.round;

    // Offset center = Offset(size.width / 2, size.height / 2);

    // // 参数： 位置, 大小, 绘制的样式
    // canvas.drawCircle(center, 100, paint);

    // 用路径 绘制圆环
    // var paint = Paint()
    //   ..color = Colors.teal
    //   ..strokeWidth = 5
    //   ..style = PaintingStyle.stroke
    //   ..strokeCap = StrokeCap.round;

    // var path = Path();
    // path.addOval(Rect.fromCircle(
    //   center: Offset(size.width / 2, size.height / 2),
    //   radius: 100,
    // ));

    // canvas.drawPath(path, paint);

    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();
    var angle = (pi * 2) / sides;

    Offset center = Offset(size.width / 2, size.height / 2);
    Offset startPoint = Offset(radius * cos(radians), radius * sin(radians));

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (var i = 1; i < sides; i++) {
      double x = radius * cos(radians + angle * i) + center.dx;
      double y = radius * sin(radians + angle * i) + center.dy;
      path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
