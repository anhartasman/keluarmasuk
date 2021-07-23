import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 17.36281, size.height * 1.957585);
    path_0.lineTo(size.width * 17.21088, size.height * 1.957585);
    path_0.arcToPoint(Offset(size.width * 17.17260, size.height * 1.924103),
        radius: Radius.elliptical(
            size.width * 0.03852834, size.height * 0.03792625),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.lineTo(size.width * 17.17211, size.height * 1.924103);
    path_0.arcToPoint(Offset(size.width * 16.78027, size.height * 1.924103),
        radius:
            Radius.elliptical(size.width * 0.1982698, size.height * 0.1951714),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(size.width * 16.77977, size.height * 1.924103);
    path_0.arcToPoint(Offset(size.width * 16.74150, size.height * 1.957585),
        radius: Radius.elliptical(
            size.width * 0.03852154, size.height * 0.03791956),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.lineTo(size.width * 16.58957, size.height * 1.957585);
    path_0.arcToPoint(Offset(size.width * 16.55128, size.height * 1.924103),
        radius: Radius.elliptical(
            size.width * 0.03852834, size.height * 0.03792625),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.lineTo(size.width * 16.55102, size.height * 1.924103);
    path_0.lineTo(size.width * 16.55102, size.height * 1.104908);
    path_0.lineTo(size.width * 17.40136, size.height * 1.104908);
    path_0.lineTo(size.width * 17.40136, size.height * 1.924103);
    path_0.lineTo(size.width * 17.40109, size.height * 1.924103);
    path_0.arcToPoint(Offset(size.width * 17.36281, size.height * 1.957585),
        radius: Radius.elliptical(
            size.width * 0.03852154, size.height * 0.03791956),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff4a4b4d).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 17.36281, size.height * 1.957585);
    path_1.lineTo(size.width * 17.21088, size.height * 1.957585);
    path_1.arcToPoint(Offset(size.width * 17.17260, size.height * 1.924103),
        radius: Radius.elliptical(
            size.width * 0.03852834, size.height * 0.03792625),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_1.lineTo(size.width * 17.17211, size.height * 1.924103);
    path_1.arcToPoint(Offset(size.width * 16.78027, size.height * 1.924103),
        radius:
            Radius.elliptical(size.width * 0.1982698, size.height * 0.1951714),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_1.lineTo(size.width * 16.77977, size.height * 1.924103);
    path_1.arcToPoint(Offset(size.width * 16.74150, size.height * 1.957585),
        radius: Radius.elliptical(
            size.width * 0.03852154, size.height * 0.03791956),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_1.lineTo(size.width * 16.58957, size.height * 1.957585);
    path_1.arcToPoint(Offset(size.width * 16.55128, size.height * 1.924103),
        radius: Radius.elliptical(
            size.width * 0.03852834, size.height * 0.03792625),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_1.lineTo(size.width * 16.55102, size.height * 1.924103);
    path_1.lineTo(size.width * 16.55102, size.height * 1.104908);
    path_1.lineTo(size.width * 17.40136, size.height * 1.104908);
    path_1.lineTo(size.width * 17.40136, size.height * 1.924103);
    path_1.lineTo(size.width * 17.40109, size.height * 1.924103);
    path_1.arcToPoint(Offset(size.width * 17.36281, size.height * 1.957585),
        radius: Radius.elliptical(
            size.width * 0.03852154, size.height * 0.03791956),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xfffc1d38).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.2018141, size.height * 0.1986603),
        size.width * 0.2018141, paint_2_fill);

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.3276644, size.height * 0.3225439),
        size.width * 0.3276644, paint_3_fill);

    Paint paint_4_fill = Paint()..style = PaintingStyle.fill;
    paint_4_fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.1190476, size.height * 0.1171872),
        size.width * 0.1190476, paint_4_fill);

    Paint paint_5_fill = Paint()..style = PaintingStyle.fill;
    paint_5_fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.02040816, size.height * 0.02008924),
        size.width * 0.02040816, paint_5_fill);

    Paint paint_6_fill = Paint()..style = PaintingStyle.fill;
    paint_6_fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.01473923, size.height * 0.01450890),
        size.width * 0.01473923, paint_6_fill);

    Paint paint_7_fill = Paint()..style = PaintingStyle.fill;
    paint_7_fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.02380952, size.height * 0.02343745),
        size.width * 0.02380952, paint_7_fill);

    Paint paint_8_fill = Paint()..style = PaintingStyle.fill;
    paint_8_fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.03287982, size.height * 0.03236600),
        size.width * 0.03287982, paint_8_fill);

    Paint paint_9_fill = Paint()..style = PaintingStyle.fill;
    paint_9_fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.2630385, size.height * 0.2589280),
        size.width * 0.2630385, paint_9_fill);

    Path path_10 = Path();
    path_10.moveTo(size.width * 0.4775646, size.height * 0.3169636);
    path_10.cubicTo(
        size.width * 0.4775646,
        size.height * 0.3262761,
        size.width * 0.4691474,
        size.height * 0.3338765,
        size.width * 0.4588776,
        size.height * 0.3338765);
    path_10.lineTo(size.width * 0.04246485, size.height * 0.3338765);
    path_10.cubicTo(
        size.width * 0.03219501,
        size.height * 0.3338765,
        size.width * 0.02377778,
        size.height * 0.3262761,
        size.width * 0.02377778,
        size.height * 0.3169636);
    path_10.cubicTo(
        size.width * 0.02377778,
        size.height * 0.3076890,
        size.width * 0.03219501,
        size.height * 0.3001266,
        size.width * 0.04246485,
        size.height * 0.3001266);
    path_10.lineTo(size.width * 0.4588776, size.height * 0.3001266);
    path_10.cubicTo(
        size.width * 0.4691474,
        size.height * 0.3001176,
        size.width * 0.4775646,
        size.height * 0.3076801,
        size.width * 0.4775646,
        size.height * 0.3169636);
    path_10.close();
    path_10.moveTo(size.width * 0.2724671, size.height * 0.1048770);
    path_10.arcToPoint(Offset(size.width * 0.2289138, size.height * 0.1047632),
        radius: Radius.elliptical(
            size.width * 0.02180272, size.height * 0.02146201),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_10.arcToPoint(Offset(size.width * 0.2724671, size.height * 0.1048770),
        radius:
            Radius.elliptical(size.width * 0.1737596, size.height * 0.1710443),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_10.close();
    path_10.moveTo(size.width * 0.4421202, size.height * 0.2851824);
    path_10.lineTo(size.width * 0.05922222, size.height * 0.2851824);
    path_10.arcToPoint(Offset(size.width * 0.4421202, size.height * 0.2851824),
        radius:
            Radius.elliptical(size.width * 0.1920431, size.height * 0.1890420),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_10.close();
    path_10.moveTo(size.width * 0.2287596, size.height * 0.1275667);
    path_10.cubicTo(
        size.width * 0.2287596,
        size.height * 0.1275667,
        size.width * 0.1214240,
        size.height * 0.1505979,
        size.width * 0.08937642,
        size.height * 0.2675842);
    path_10.lineTo(size.width * 0.1299660, size.height * 0.2675842);
    path_10.cubicTo(
        size.width * 0.1299660,
        size.height * 0.2675842,
        size.width * 0.1524263,
        size.height * 0.1700197,
        size.width * 0.2287596,
        size.height * 0.1275667);
    path_10.close();

    Paint paint_10_fill = Paint()..style = PaintingStyle.fill;
    paint_10_fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawPath(path_10, paint_10_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
