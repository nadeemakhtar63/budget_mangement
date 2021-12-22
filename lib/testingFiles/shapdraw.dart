// import 'dart:math';
//
// import 'package:budget_mangement/Design/shap1.dart';
// import 'package:flutter/material.dart';
//
// class shappdraw extends StatefulWidget {
//   @override
//   _shappdrawState createState() => _shappdrawState();
// }
//
// class _shappdrawState extends State<shappdraw> {
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       width: MediaQuery.of(context).size.width/2,
//       height: MediaQuery.of(context).size.width/2,
//       child: Card(
//
//       color: Colors.pink,
//         child: Stack(
//
//             children: <Widget>[
//               CustomPaint(
//                 size: Size.infinite,
//                 painter:new  shape1(),
//               ),
//               Center(
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundImage: AssetImage("budgetplan.jpg"),
//                   backgroundColor: Colors.transparent,
//                 ),
//               )
//
//             ],
//         ),
//       ),
//     );
//   }
// }
