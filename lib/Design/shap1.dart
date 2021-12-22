// import 'dart:math';
//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// class shape1 extends CustomPainter
// {
//
//
//   void drawCurveShap(Canvas canvas,Rect bound , Rect AvaterBonds ){
//     final paint=Paint()..color=Colors.lightBlueAccent;
//     final handlepaint=Offset(bound.left+(bound.width * 0.25),bound.top);
//     final curvePath=Path()
//     ..moveTo(bound.bottomLeft.dx,bound.bottomLeft.dy)
//     ..arcTo(AvaterBonds, -pi, pi, false)
//     ..lineTo(bound.bottomRight.dx,bound.bottomRight.dy)
//     ..lineTo(bound.topRight.dx, bound.topRight.dy)
//     ..quadraticBezierTo(handlepaint.dx, handlepaint.dy, bound.bottomLeft.dx, bound.bottomLeft.dy)
//     ..close();
//     canvas.drawPath(curvePath, paint);
//   }
//
//   void _drawBackgroung(Canvas canvas,Rect shapeBounds,Rect AvaterBounds){
//     final paint=Paint()..color=Colors.blueAccent;
//     final BackgroundPath=Path()
//       ..moveTo(shapeBounds.left,shapeBounds.top)
//       ..lineTo(shapeBounds.bottomLeft.dx,shapeBounds.bottomLeft.dy)
//       ..arcTo(AvaterBounds,-pi,pi,false)
//       ..lineTo(shapeBounds.bottomRight.dx,shapeBounds.bottomRight.dy)
//       ..lineTo(shapeBounds.topRight.dx,shapeBounds.topRight.dy)
//       ..close();
//     final curveshapBound=
//     Rect.fromLTRB(
//         shapeBounds.left, shapeBounds.top+shapeBounds.height*0.35, shapeBounds.right, shapeBounds.bottom);
//     canvas.drawPath(BackgroundPath, paint);
//     drawCurveShap(canvas, curveshapBound, AvaterBounds);
//
//   }
//   @override
//   void paint(Canvas canvas, Size size) {
//  double avatar=50;
// final shapepaint=Rect.fromLTWH(0, 0, size.width, size.height/2);
//
//
// //final painting= new Paint()..color=Colors.lightBlueAccent;
//     //canvas.drawRect(shapepaint, painting);
//
//
//  final centerAvatar=Offset(shapepaint.center.dx,shapepaint.bottom);
//  final AvaterBounds=Rect.fromCircle(center: centerAvatar,radius:avatar ).inflate(6);
//
//  _drawBackgroung(canvas, shapepaint, AvaterBounds);
//   }
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//    return true;
//   }
//
// }