//
//
//
// import 'package:budget_mangement/DataBase/FloorDatabase/DatabaseCreate.dart';
// import 'package:budget_mangement/DataBase/FloorDatabase/Entity.dart';
// import 'package:intl/intl.dart';
//
// class detailProfit extends StatefulWidget {
//  String date,month;
//   detailProfit({Key key , this.date,this.month}):super(key: key);
//   @override
//   _detailProfitState createState() => _detailProfitState();
// }
// // FirebaseAuth _auth=FirebaseAuth.instance;
// // User user=_auth.currentUser;
//
// // final cardDesign=Card(
// //   elevation: 10,
// //   child: Container(
// //     padding: const EdgeInsets.all(10),
// //     child: Column(
// //       mainAxisAlignment: MainAxisAlignment.start,
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: <Widget>[
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.start,
// //           children: <Widget>[
// //             Expanded(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: <Widget>[
// //                     Text("Date :" ,style: TextStyle(
// //                       fontSize: 12,
// //                       fontWeight: FontWeight.bold
// //                     ),),
// //                     SizedBox(height: 5,),
// //                     Text("Total Expense :",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
// //                     SizedBox(height: 5,),
// //                     Text("Total Profit",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
// //
// //                   ],
// //                 )),
// //             Expanded(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: <Widget>[
// //                     Text("11/2020",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
// //                     SizedBox(height: 5,),
// //                     Text("55360",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
// //                     SizedBox(height: 5,),
// //                     Text("126590",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
// //                   ],
// //                 ))
// //           ],
// //         ),
// //         SizedBox(
// //           height: 10,
// //         ),
// //         Text("01/11/2020",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
// //         SizedBox(height: 5,),
// //         Container(
// //           height: 250,
// //           child: ListView.builder(
// //             // stream: FirebaseFirestore.instance.collection("Users").doc(user.uid).collection("exp").where('date').snapshots(),
// //               itemCount: 5,
// //               itemBuilder: (context,index){
// //               return Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: <Widget>[
// //                   Text((index+1).toString()+".Item Title",style: TextStyle(fontSize: 16),),
// //                     SizedBox(height: 5,),
// //                   Row(
// //                     children: <Widget>[
// //                       Text("Incom",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
// //                       Text("Sellary",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
// //                     ],
// //                   ),
// //                   SizedBox(height: 5,),
// //                   Text("Profit",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
// //                   SizedBox(height: 5,),
// //                   Text("-500",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
// //                   SizedBox(height: 5,),
// //                   Row(
// //                     children: <Widget>[
// //                       Text("Lost",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
// //                       SizedBox(width: 10,),
// //                       Text("500",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
// //                     ],
// //                   ),
// //                   Divider(),
// //                   SizedBox(height: 5,)
// //                 ],
// //               );
// //               }),
// //         ),
// //         Flexible(
// //             child: ListView.builder(
// //               itemCount: 5,
// //                 shrinkWrap: true,
// //                 itemBuilder: (index,item){
// //                 return Column(
// //                   mainAxisAlignment: MainAxisAlignment.start,
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: <Widget>[
// //                     Divider(
// //                       color: Colors.black,
// //                     )
// //                   ],
// //                 );
// //                 }
// //             ))
// //       ],
// //
// //     ),
// //   ),
// // );
// class _detailProfitState extends State<detailProfit> {
//  int totalExpnseofmonth=0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Detail of Your activities"),
//       ),
//       body:   FutureBuilder<databaseexp>(
//         future:$Floordatabaseexp.databaseBuilder('budget_managment_app').build() ,
//         builder: (context,index){
//           if(index.hasData)
//           {
//             var d=DateTime.now();
//             var k=DateFormat('MM');
//             String dd=k.format(d);
//             // print("Month is :$dd");
//           //  final cchk='%${widget.year}-${widget.month}-%';
//             print(' detail activity date : ${widget.month}');
//             return StreamBuilder<List<ExpEntity>>(
//               // ignore: missing_return
//                 stream: (index.data.expdio.expPrevsMonths(widget.month).asStream()),
//                 builder: (BuildContext context,AsyncSnapshot<List<ExpEntity>> snapshot) {
//                   if (snapshot.hasData) {
//                     var listAllExpense = snapshot.data as List<ExpEntity>;
//                     //  print(listAllExpense);
//                     totalExpnseofmonth = 0;
//                     for (int i = 0; i < listAllExpense.length; i++) {
//                       totalExpnseofmonth += listAllExpense[i].amount;
//                       //   print('data is: ${totalExpnseofmonth.toString()}');
//                     }
//                     // return ListView.builder(
//                     //     itemCount: listAllExpense != null ? listAllExpense
//                     //         .length : 0,
//                     //     itemBuilder: (context, indix) {
//                     //       print("all daata: $listAllExpense");
//
//                           return Card(
//      elevation: 10,
//   child: Container(
//     padding: const EdgeInsets.all(10),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text("Date :" ,style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold
//                     ),),
//                     SizedBox(height: 5,),
//                     Text("Total Expense :",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
//                     SizedBox(height: 5,),
//                     Text("Total Profit",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
//
//                   ],
//                 )),
//             Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text("11/2020",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
//                     SizedBox(height: 5,),
//                     Text("55360",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
//                     SizedBox(height: 5,),
//                     Text("126590",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
//                   ],
//                 ))
//           ],
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Text("01/11/2020",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//         SizedBox(height: 5,),
//         Container(
//           height: 250,
//           child: ListView.builder(
//
//             // stream: FirebaseFirestore.instance.collection("Users").doc(user.uid).collection("exp").where('date').snapshots(),
//               itemCount: listAllExpense.length,
//               itemBuilder: (context,index){
//
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text("Date :"+(index+1).toString(),style: TextStyle(fontSize: 20),),
//                     SizedBox(height: 5,),
//                   SizedBox(height: 5,),
//                   Row(
//                     children: <Widget>[
//                       Text("Expense",style: TextStyle(fontSize: 16,),),
//                       SizedBox(width: 10,),
//                       Text(('${listAllExpense[index].amount}').toString(),style: TextStyle(fontSize: 16,),),
//                     ],
//                   ),
//
//                   Row(
//                     children: <Widget>[
//                       Text("Refrence : ",style: TextStyle(fontSize: 16,),),
//                       Text(listAllExpense[index].ref,style: TextStyle(fontSize: 16,),),
//                     ],
//                   ),
//                   Row(
//                     children: <Widget>[
//                       Text("Refrence : ",style: TextStyle(fontSize: 16,),),
//                       Text(listAllExpense[index].discr,style: TextStyle(fontSize: 16,),),
//                     ],
//                   ),
//                   SizedBox(height: 5,),
//
//                 ],
//               );
//               }),
//         ),
//         Flexible(
//             child:
//
//             //     itemCount: listAllExpense != null ? listAllExpense
//             //         .length : 0,
//             //     itemBuilder: (context, indix) {
//
//             ListView.builder(
//               itemCount: listAllExpense != null ? listAllExpense.length : 0,
//                 shrinkWrap: true,
//                 itemBuilder: (index,item){
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Divider(
//                       color: Colors.black,
//                     )
//                   ],
//                 );
//                 }
//             ))
//       ],
//
//     ),
//   ),
// );
// //                        }
//  //                   );
//                   }
//                 }
//             );
//
//           }
//         },
//       ),
//     );
//   }
// }
