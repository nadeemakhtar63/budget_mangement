//
// import 'dart:async';
//
// import 'package:budget_mangement/DashBoard.dart';
// import 'package:flutter/material.dart';
//
// class splash_screen extends StatefulWidget {
//   @override
//   _splash_screenState createState() => _splash_screenState();
// }
//
// class _splash_screenState extends State<splash_screen> {
//   void initState(){
//     super.initState();
//     Timer(Duration(seconds: 3),()=>
//       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>DashBoard())));
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               colors: [Colors.indigo,Colors.blueAccent])
//         ),
//         child: Center(
//           child: ListTile(
//             title: Row(
//               children: [
//                 IconButton(icon: new Image.asset("splash_screen.png"),),
//                 Text("Budget Tracker",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)
//               ],
//             ),
//           ),
//           ),
//       ),
//
//     );
//   }
// }
