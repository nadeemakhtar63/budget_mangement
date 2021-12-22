//
//
// import 'dart:convert';
// import 'dart:math';
//
// import 'package:budget_mangement/DataBase/Authentication.dart';
// import 'package:budget_mangement/DataBase/FloorDatabase/DatabaseCreate.dart';
// import 'package:budget_mangement/DataBase/FloorDatabase/Entity.dart';
// import 'package:budget_mangement/DataBase/FloorDatabase/budgetDAO.dart';
// import 'package:budget_mangement/assets/customIcons/my_flutter_app_icons.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:floor/floor.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Expences  extends StatefulWidget  {
//
//   @override
//   _ExpencesState createState() => _ExpencesState();
// }
//
// class _ExpencesState extends State<Expences> {
//
//   String amount,payee,category,payMethod,status,refno,des, exptype="",expamount="",date,timing;
//   int count=0;
//     budgetDao expdio;
//  // TextEditingController expdis=TextEditingController();
//  //TextEditingController expdoler=TextEditingController();
//    Authentication obj=new Authentication();
//    void floorsave() async {
//      final budgetAppDatabase = await $Floordatabaseexp.databaseBuilder(
//          'budget_managment_app').build();
//      expdio = budgetAppDatabase.expdio;
//      String date=(dateformate.format(currentDate).toString());
//      //print(expdeo);
//    //  try {
//        final datasave = ExpEntity(
//            null,
//            int.parse(ballnce.text),
//            catg.text,
//            payment.text,
//            dropdowvalue,
//            stats.text,
//            refs.text,
//            disc.text,
//            date,
//            timer.format(currentDate));
//        //   null,
//        // 30,
//        // "cash",
//        // "Food",
//        // "30days",
//        // "clear",
//        // "Bank",
//        // "Femily",
//        // "llll",
//        // "sss");
//         print("Data Store");
//        expdio.insertExp(datasave);
//        print((expdio.expSelection().toString()));
//     // }on Exception catch(_)
//     // {
//     //   print("Data not Store");
//     // }
//
//    }
//     Future<String> dataSave() async
//     {
//       final FirebaseAuth _auth=FirebaseAuth.instance;
//       final FirebaseFirestore _firestore=FirebaseFirestore.instance;
//       User createuser=await _auth.currentUser;
//             String date=(dateformate.format(currentDate).toString());
//             String timecheck=timer.format(currentDate);
//       DocumentReference ref=FirebaseFirestore.instance.collection("Users").document(createuser.uid).collection("exp").document();
//           ref.setData(
//           {
//            "date":date,
//             "time":timecheck,
//             "Amount":ballnce.text,
//             "catgory":catg.text,
//             "pay method":payment.text,
//             "expense type":dropdowvalue,
//             "statues":stats.text,
//             "ref":refs.text,
//             "Dis":disc.text
//           }
//           ).then((value)
//           {
//             SnackBar(
//               content: Text("Data Sucessfully Store"),
//               action: SnackBarAction(
//                 label: "OK",
//                 onPressed: (){},
//
//               ),
//             );
//           }) ;
//     }
//   DateTime currentDate=DateTime.now();
//   var dateformate=DateFormat("yyyy-MM-dd");
//   var timer=DateFormat('hh:mm:ss');
//   Future<void> _selectDate(BuildContext context) async {
//
//     final DateTime pickedDate = await showDatePicker(
//         context: context,
//         initialDate: currentDate,
//         firstDate: DateTime(2020),
//         lastDate: DateTime(2050));
//     if (pickedDate != null && pickedDate != currentDate)
//       setState(() {
//         currentDate = pickedDate;
// date=dateformate.format(currentDate);
//       });
//     print(date);
//   }
//   bool _isButtonDisabled;
//   int item=0;
//  void initState()
//   {
//
//     if(exptype.isEmpty && expamount.isEmpty)
//       {
//         _isButtonDisabled=true;
//       }
//     else if (!(exptype.isEmpty && expamount.isEmpty)){
//       _isButtonDisabled = false;
//     }
//    print(exptype);
//    print(expamount);
//     setState(() {
//
//       // if(!(exptype.isEmpty && expamount.isEmpty)) {
//         item = item + 1;
//         currentDate;
//
//
//     });
//     super.initState();
//
//   }
//
// // void dispose()
// // {
// //   expdoler.dispose();
// //   expdis.dispose();
// //   super.dispose();
// // }
//   //bool checkbox=false;
//  final ballnce=TextEditingController();
//   final refs =TextEditingController();
//   final disc =TextEditingController();
//   final payment=TextEditingController();
//   final catg=TextEditingController();
//   final stats=TextEditingController();
// final _key=GlobalKey<FormState>();
//   String dropdowvalue="other";
//   String pmethod="Cash";
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.assignment_turned_in_sharp),
//
//         elevation: 100,
//         hoverColor: Colors.cyan,
//         backgroundColor: Color(0xff7c94b6),
//
//         onPressed:(){
//             if(_key.currentState.validate())
//               {
//                 floorsave();
//                 dataSave();
//               }
//           },
//
//       ),
//
//       backgroundColor: Color(0xff7c94b6),
//       appBar: AppBar(
//         elevation: 0.0,
//
//         flexibleSpace: Container(
//             width: double.infinity,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: <Color>[
//                 Color(0xff7c94b6),
//                 Color(0xff7c94b6)
//               ]
//             ),
//
//           ),
//         ),
//         backgroundColor: Color(0xff7c94b6),
//         actions: <Widget>[
//
//         //  Text("${timer.format(currentDate)}",style: TextStyle(fontSize: 18),),
//           FlatButton.icon(
//               onPressed:()=> currentDate,
//               icon: Icon(Icons.refresh),
//               label: Text("${timer.format(currentDate)}",style: TextStyle(fontSize: 14),),),
//
//           FlatButton.icon(
//               onPressed:()=> _selectDate(context),
//               icon: Icon(Icons.arrow_drop_down),
//               label: Text("${dateformate.format(currentDate)}",style: TextStyle(fontSize: 14),)),
//           FlatButton.icon(onPressed: (){
//
//             // if(!(exptype.isEmpty && expamount.isEmpty))
//             //   {
//             //     setState(() {
//             //       count++;
//             //     });
//             //     dataSave();
//             //     print(exptype);
//             //     print(expamount);
//             //   }
//           },
//               icon:Icon(Icons.where_to_vote_outlined), label: Text("Save"))
//         ],
//       ),
//       body: ListView.builder(
//           itemCount: item,
//           itemBuilder:(context,index){
//      return Card(
//        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
//        shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.circular(20)
//        ),
//        color: Color(0xff7c94b6),
//        elevation: 40,
//
//        child: Container(
//          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
//          child: Form(
//            key: _key,
//            child: Column(
//
//              crossAxisAlignment: CrossAxisAlignment.stretch,
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              mainAxisSize: MainAxisSize.min,
//              children: <Widget>[
//
//                  Padding(
//                    padding: EdgeInsets.all(5),
//                    child: TextFormField(
//                       controller: ballnce,
//                           validator: (value){
//                         if(value.isEmpty)
//                           {
//                             return 'please Enter Balance';
//                           }
//                         return null;
//                           },
//                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),
//                         // controller: expdis,
//                            decoration:  InputDecoration(
//                        //      errorText: checkbox?"Value can't be empty":null,
//                              border: OutlineInputBorder(
//                                borderRadius: const BorderRadius.all(const Radius.circular(20)),
//                              ),
//                              prefixIcon: Icon(MyFlutterApp.salary,color: Colors.amber,),
//                              suffixIcon: IconButton(onPressed: (){
//                                ballnce.clear();
//                              },
//                                icon: Icon(Icons.clear,),),
//                              hintText: "Amount"
//
//                            ),
//                      // keyboardType: TextInputType.number,
//                      // inputFormatters: <TextInputFormatter>[
//                      //   FilteringTextInputFormatter.digitsOnly
//                      // ],
//                        // onChanged: (value)
//                        //  {
//                        //
//                        //    if(!(value.isEmpty))
//                        //      amount=value;
//                        //    //  print(exptype);
//                        //      super.initState();
//                        //
//                        //
//                        //  },
//                          ),
//                  ),
//
//
//                Padding(
//                  padding: EdgeInsets.all(5),
//                  child: TextFormField(
//
//                    style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),
//                    // controller: expdis,
//                    controller: catg,
//                    decoration:  InputDecoration(
//                      // errorText: checkbox?"Value can't be empty":null,
//                        border: OutlineInputBorder(
//                          borderRadius: const BorderRadius.all(const Radius.circular(20)),
//                        ),
//                        prefixIcon: Icon(Icons.home,color: Colors.cyan,),
//                        suffixIcon: IconButton(onPressed: (){
//                          catg.clear();
//                        }, icon:Icon( Icons.clear),),
//                        hintText: "Catogory(Home/Office/other)"
//
//                    ),
//                    validator: (value){
//                      if(value.isEmpty)
//                        {
//                          return "Please Enter Expanse catagory";
//                        }
//                      return null;
//
//                    },
//
//
//
//                    // onChanged: (value)
//                    // {
//                    //
//                    //   if(!(value.isEmpty))
//                    //   exptype=value;
//                    //   //  print(exptype);
//                    //   super.initState();
//                    //
//                    //
//                    // },
//                  ),
//                ),
//
//          Container(
//              decoration: ShapeDecoration(
//                  shape: RoundedRectangleBorder(
//                      side: BorderSide(width:  0,style: BorderStyle.solid),
//                      borderRadius: BorderRadius.all(Radius.circular(20))
//                  )
//              ),
//              padding: EdgeInsets.all(5),
//              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
//              child: DropdownButton<String>(
//
//               // hint:new Text("Payment Method"),
//                value: pmethod,
//                icon: Icon(Icons.keyboard_arrow_down_outlined),
//                isExpanded: true,
//                iconSize: 24,
//                elevation: 16,
//                style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black54),
//                underline: Container(
//                  height: 2,
//                ),
//                items: <String>["Cash","Bank Card","Mobile transection","other"].map<DropdownMenuItem<String>>((String value1) {
//
//                  return DropdownMenuItem<String>(
//
//                    value: value1,
//                    child: Row(
//                      children: [
//                        IconButton(icon: Icon(Icons.payments,color: Colors.lightBlueAccent,), onPressed: null),
//                        Text(value1),
//                      ],
//                    ),
//                  );
//                }).toList(),
//                onChanged: (String newvalue1)
//                {
//                  setState(() {
//                   // if(!(newvalue1=="Payment Method"))
//                      pmethod=newvalue1;
//
//                  });
//
//                },
//
//              )
//
//          ),
//
//                  //subtitle:
//                  // Padding(
//                  //   padding: EdgeInsets.all(5),
//                  //   child: TextFormField(
//                  //     controller: payment,
//                  //     validator: (value)
//                  //     {
//                  //       if(value.isEmpty){
//                  //         return "Enter Payment Method";
//                  //       }
//                  //       return null;
//                  //     },
//                  //     style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),
//                  //    // controller: expdoler,
//                  //     decoration: InputDecoration(
//                  //      //   errorText: checkbox?"Value can't be empty":null,
//                  //       prefixIcon: Icon(Icons.credit_card,color: Colors.blueAccent,),
//                  //       suffixIcon: IconButton(onPressed: (){
//                  //         payment.clear();
//                  //       }, icon:Icon( Icons.clear),),
//                  //       border: OutlineInputBorder(
//                  //         borderRadius:const BorderRadius.all(const Radius.circular(20))
//                  //       ),
//                  //       hintText: "Pay Method(Cash/Bank Card)"
//                  //     ),
//
//                      // keyboardType: TextInputType.number,
//                      //  inputFormatters: <TextInputFormatter>[
//                      //    FilteringTextInputFormatter.digitsOnly
//                      //  ],
//                      //      onChanged: (value)
//                      // {
//                      //   if(!(value.isEmpty))
//                      //     payMethod=value;
//                      //   //  print(expamount);
//                      //     super.initState();
//                      //
//                      //
//                      // },
//             //       ),
//               //   ),
//
//               // ),
//               // ListTile(
//                //  title:
//                  Container(
//                    decoration: ShapeDecoration(
//                      shape: RoundedRectangleBorder(
//                        side: BorderSide(width:  0,style: BorderStyle.solid),
//                        borderRadius: BorderRadius.all(Radius.circular(20))
//                      )
//                    ),
//                    padding: EdgeInsets.all(5),
//                       margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                    child: DropdownButton<String>(
//
//                     //  hint:new Text("Expence type"),
//                      value: dropdowvalue,
//                        icon: Icon(Icons.keyboard_arrow_down_outlined),
//                        isExpanded: true,
//                        iconSize: 24,
//                        elevation: 16,
//                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black54),
//                        underline: Container(
//                          height: 2,
//                        ),
//                        items: <String>["other","Bill","Food","fual","rent",].map<DropdownMenuItem<String>>((String value) {
//
//                        return DropdownMenuItem<String>(
//
//                              value: value,
//                              child: Row(
//                                children: [
//                                  IconButton(icon: Icon(Icons.payments,color: Colors.lightBlueAccent,), onPressed: null),
//                                  Text(value),
//                                ],
//                              ),
//                        );
//                        }).toList(),
//                        onChanged: (String newvalue)
//                        {
//                        setState(() {
//                          //if(!(newvalue=="Expence type"))
//                          dropdowvalue=newvalue;
//
//                        });
//
//                        },
//
//                    )
//
//                  ),
//                 // subtitle:
//                 Padding(
//                   padding: EdgeInsets.all(10),
//                   child: TextFormField(
//                     controller: stats,
//                      validator: (value)
//                     {
//                       if(value.isEmpty)
//                       return "Enter status(cash/bank)";
//                       return null;
//                     },
//
//
//                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),
//                       //controller: expdoler,
//                      decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.category,color: Colors.blueAccent,),
//                         suffixIcon: IconButton(onPressed: (){
//                           stats.clear();
//                         },icon: Icon(Icons.clear),),
//                         // errorText: checkbox?"Value can't be empty":null,
//                     border: OutlineInputBorder(
//
//                       borderRadius: const BorderRadius.all(Radius.circular(20))
//                     ),
//                          hintText: "States(Clear/pendding)"
//                      ),
//
//                      // keyboardType: TextInputType.number,
//                      // inputFormatters: <TextInputFormatter>[
//                      //   FilteringTextInputFormatter.digitsOnly
//                      // ],
//                      // onChanged: (value)
//                      // {
//                      //   if(!(value.isEmpty))
//                      //   status=value;
//                      //   //  print(expamount);
//                      //   super.initState();
//                      //
//                      //
//                      // },
//                    ),
//                 ),
//                Padding
//                  (
//                  padding: EdgeInsets.all(10),
//                  child: TextFormField(
//                   controller: refs,
//
//
//                    style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),
//                    // controller: expdoler,
//                    decoration: InputDecoration(
//             //           errorText: checkbox?"Value can't be empty":null,
//                        // border: OutlineInputBorder(
//                        //     borderRadius: const BorderRadius.all(Radius.circular(30))
//                        // ),
//                        hintText: "Ref/check number (optional)"
//                    ),
//
//                    // keyboardType: TextInputType.number,
//                    // inputFormatters: <TextInputFormatter>[
//                    //   FilteringTextInputFormatter.digitsOnly
//                    // ],
//                    // onChanged: (value)
//                    // {
//                    //   if(!(value.isEmpty))
//                    //   refno=value;
//                    //   //  print(expamount);
//                    //   super.initState();
//                    //
//                    //
//                    // },
//                  ),
//                ),
//                Padding(
//                  padding: EdgeInsets.all(10),
//                  child: TextFormField(
//                       controller: disc,
//                    style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),
//                    // controller: expdoler,
//                    decoration: InputDecoration(
//               //         errorText: checkbox?"Value can't be empty":null,
//                        // border: OutlineInputBorder(
//                        //     borderRadius: const BorderRadius.all(Radius.circular(20))
//                        // ),
//                        hintText: "Discriptin (Optional)"
//                    ),
//
//                    // keyboardType: TextInputType.number,
//                    // inputFormatters: <TextInputFormatter>[
//                    //   FilteringTextInputFormatter.digitsOnly
//                    // ],
//                    // onChanged: (value)
//                    // {
//                    //   if(!(value.isEmpty))
//                    //   des=value;
//                    //   //  print(expamount);
//                    //   super.initState();
//                    //
//                    //
//                    // },
//                  ),
//                ),
//               // )
//
//              ],
//            ),
//          ),
//        ),
//      );
//           }
//       ),
//     );
//   }
// }