// import 'dart:developer';
//
// import 'package:budget_mangement/DataBase/Authentication.dart';
// import 'package:budget_mangement/Profit/detailProfit.dart';
// import 'package:budget_mangement/assets/customIcons/my_flutter_app_icons.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
//
// class finalProfit extends StatefulWidget {
//   @override
//   _finalProfit createState() => _finalProfit();
// }
// FirebaseAuth _auth=FirebaseAuth.instance;
// User user=_auth.currentUser;
//
// class _finalProfit extends State<finalProfit> {
//
//   String exptype, expamount, date1, timing;
//
//   // TextEditingController expdis=TextEditingController();
//   //TextEditingController expdoler=TextEditingController();
//   Authentication obj = new Authentication();
//
//   Future<String> dataSave() async
//   {
//     //  final FirebaseAuth _auth = FirebaseAuth.instance;
//     // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//     // User createuser = await _auth.currentUser;
//   }
//
//   DateTime currentDate = DateTime.now();
//   var dateformate = DateFormat("MM-yyyy");
//   var timer = DateFormat('hh:mm:ss');
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime pickedDate = await showDatePicker(
//         context: context,
//         initialDate: currentDate,
//         firstDate: DateTime(2021),
//         lastDate: DateTime(2050));
//     if (pickedDate != null && pickedDate != currentDate)
//       setState(() {
//         currentDate = pickedDate;
//         date1 = dateformate.format(currentDate);
//       });
//     print(date1);
//   }
//
//   int item = 0;
//   void initState() {
//     dataSave();
//     getdatauser();
//     print(exptype);
//     print(expamount);
//     setState(() {
//       // if(!(exptype.isEmpty && expamount.isEmpty)) {
//       item = item + 1;
//       currentDate;
//     });
//     super.initState();
//   }
//   final _reference=FirebaseFirestore.instance.collection("Users").doc(user.uid).collection("exp").document();
// // void dispose()
// // {
// //   expdoler.dispose();
// //   expdis.dispose();
// //   super.dispose();
// // }
//
//   Future  getdatauser() async
//   {
//
//     final UserRef=await FirebaseFirestore.instance.collection("Users").doc(user.uid).collection("exp").doc(dateformate.format(currentDate)).collection(timer.format(currentDate));
//     UserRef.getDocuments().then((QuerySnapshot snapshot){
//       snapshot.documents.forEach((DocumentSnapshot doc) {
//         print(doc.data());
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Map p_list;
//     // FirebaseFirestore dbref=FirebaseFirestore.instance;
//     // CollectionReference cref=dbref.collection("Users");
//     // DocumentReference dref=cref.doc(user.uid);
//     // CollectionReference expref=dref.collection("exp");
//     // DocumentReference dateRef=expref.doc(dateformate.format(currentDate));
//     // CollectionReference timeRef=dateRef.collection(timer.format(currentDate));
//     // DocumentReference itemref=timeRef.doc("3");
//
//
//
//
//     return Scaffold(
//       // floatingActionButton: FloatingActionButton(
//       //   child: Column(
//       //       children: [Icon(Icons.add)]),
//       //   elevation: 100,
//       //   hoverColor: Colors.cyan,
//       //   backgroundColor: Colors.brown,
//       //   onPressed: initState,
//       //
//       //
//       // ),
//
//       backgroundColor: Color(0xff7c94b6),
//       appBar: AppBar(
//         elevation: 0.0,
//         flexibleSpace: Container(
//
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: <Color>[
//                   Color(0xff7c94b6),
//                   Color(0xff7c94b6)
//                 ]
//             ),
//
//           ),
//         ),
//         backgroundColor: Color(0xff7c94b6),
//         actions: <Widget>[
//
//           //  Text("${timer.format(currentDate)}",style: TextStyle(fontSize: 18),),
//           FlatButton.icon(
//               onPressed: () => currentDate,
//               icon: Icon(Icons.refresh),
//               label: Text("${timer.format(currentDate)}",
//                 style: TextStyle(fontSize: 14),)),
//
//           FlatButton.icon(
//               onPressed: () => _selectDate(context),
//               icon: Icon(Icons.arrow_drop_down),
//               label: Text("${dateformate.format(currentDate)}",
//                 style: TextStyle(fontSize: 14),)),
//           FlatButton.icon(onPressed: () {
//             getdatauser();
//
//           },
//               icon: Icon(Icons.where_to_vote_outlined), label: Text("Save"))
//         ],
//       ),
//       body:
//       StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection("Users").doc(user.uid).collection("exp").where("date",isEqualTo: date1).snapshots(),
//         builder: (context,snapshot){
//           if(snapshot.hasData)
//           {
//
//             final List<DocumentSnapshot> documents=snapshot.data.docs;
//
//             return ListView(
//               children: documents
//                   .map((e) => Card(
//
//                 child: ListTile(
//
//                   title:Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(e["Amount"]),
//                       Text(e['time']),
//                     ],
//                   ) ,
//                   subtitle: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         children: [
//                           Text(e['date']),
//                           Text(e['date']),
//                         ],
//                       ),
//
//                     ],
//                   ),
//                   trailing: IconButton(onPressed: (){ Navigator.push((context),MaterialPageRoute(builder: (context)=>detailProfit()));},icon: Icon(Icons.arrow_forward_ios,color: Colors.blueAccent,),),
//                 ),
//               )).toList(),
//             );
//           }
//           else if(snapshot.hasError)
//             return Text("it is Error");
//         },
//       ),
//
//
//
//     );
//   }
//
//
// }
//
// // child: ListView.builder(
// //     itemCount: item,
// //     itemBuilder: (context, index) {
// //       return Card(
// //         elevation: 8.0,
// //         margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
// //         child: Container(
// //           decoration: BoxDecoration(
// //             color: Color.fromRGBO(64, 75, 96, 9),
// //
// //           ),
// //           child: ListTile(
// //             contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
// //             leading: Container(
// //               padding: EdgeInsets.only(right: 12.0),
// //               decoration: new BoxDecoration(
// //                 border: new Border(right: new BorderSide(width: 1,color: Colors.white24)),
// //               ),
// //               child: Icon(Icons.auto_stories,color: Colors.white,),
// //
// //             ),
// //             title: Text("Your Budget",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
// //             subtitle: Row(
// //               children: <Widget>[
// //                 Icon(Icons.line_style,color: Colors.yellowAccent,),
// //
// //                 Text("Intermediate",style: TextStyle(color: Colors.white),)
// //               ],
// //             ),
// //             trailing:
// //             IconButton(icon: Icon(Icons.keyboard_arrow_right,), onPressed: () {
// //               Navigator.push(this.context, MaterialPageRoute(builder: (context)=>detailProfit()));
// //             }),
// //             //Icon(Icons.keyboard_arrow_right,color: Colors.white,size: 30.0,),
// //           ),
// //         ),
// //       );
// // return   new Card(
// //     child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: <Widget>[
// //           ListTile(
// //             leading: const Icon(MyFlutterApp.salary,color: Colors.teal,size: 70,),
// //             title: Text('The is having:'),
// //             subtitle: Text('Votes.'),
// //           ),
// //           ListTile(
// //             title: Text('The is having:'),
// //             subtitle: Text('Votes.'),
// //           ),
// //           new Container(
// //             margin: EdgeInsets.fromLTRB(5, 20, 5, 20),// make buttons use the appropriate styles for cards
// //               child: new Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: <Widget>[
// //                     new  Text('Thumb up'),
// //
// //                     new  Text('Thumb down'),
// //
// //                     ]))]));
//
// //           ),
// //         ),
// //       );
// //     }
//
//
