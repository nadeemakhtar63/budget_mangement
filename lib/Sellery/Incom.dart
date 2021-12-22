

import 'package:budget_mangement/DataBase/Authentication.dart';
import 'package:budget_mangement/assets/customIcons/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class income extends StatefulWidget {
  @override
  _incomeState createState() => _incomeState();
}

class _incomeState extends State<income> {
  String amount,payee,category,payMethod,status,refno,des, exptype="",expamount="",date,timing;
  int count=0;
   TextEditingController expdis=TextEditingController();
  TextEditingController expdoler=TextEditingController();
  // Authentication obj=new Authentication();
  // Future<String> dataSave() async
  // {
  //   final FirebaseAuth _auth=FirebaseAuth.instance;
  //   final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  //   User createuser=await _auth.currentUser;
  //   String date=(dateformate.format(currentDate).toString());
  //   String timecheck=timer.format(currentDate);
    // DocumentReference ref=FirebaseFirestore.instance.collection("Users").document(createuser.uid).collection("income").document();
    // ref.setData(
    //     {
    //       "date":date,
    //       "time":timecheck,
    //       "incom":incom_drop,
    //      // "catgory":catg_drop,
    //       "recived method":recivemethod_drop,
    //      // "expense type":dropdowvalue,
    //      // "statues":status_drop,
    //       "ref":refs.text,
    //       "Dis":disc.text
    //
    //
    //
    //     }
   // ) ;
 // }
  DateTime currentDate=DateTime.now();
  var dateformate=DateFormat("MM-yyyy");
  var timer=DateFormat('hh:mm:ss');
  Future<void> _selectDate(BuildContext context) async {

    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2020),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
        date=dateformate.format(currentDate);
      });
    print(date);
  }
  bool _isButtonDisabled;
  int item=0;
  void initState()
  {

    if(exptype.isEmpty && expamount.isEmpty)
    {
      _isButtonDisabled=true;
    }
    else if (!(exptype.isEmpty && expamount.isEmpty)){
      _isButtonDisabled = false;
    }
    print(exptype);
    print(expamount);
    setState(() {

      // if(!(exptype.isEmpty && expamount.isEmpty)) {
      item = item + 1;
      currentDate;


    });
    super.initState();

  }

// void dispose()
// {
//   expdoler.dispose();
//   expdis.dispose();
//   super.dispose();
// }
  //bool checkbox=false;
  final ballnce=TextEditingController();
  final refs =TextEditingController();
  final disc =TextEditingController();
 // final payment=TextEditingController();
 // final catg=TextEditingController();
  //final stats=TextEditingController();
  final _key=GlobalKey<FormState>();
 // String catg_drop="Catgory";
  String incom_drop="other source";
  String recivemethod_drop="Cash";
 // String status_drop="Status";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.assignment_turned_in_sharp),

        elevation: 100,
        hoverColor: Colors.cyan,
        backgroundColor: Color(0xff7c94b6),

        onPressed:(){
          if(_key.currentState.validate())
          {

          //  dataSave();
            setState(() {
              ballnce.clear();
              refs.clear();
              disc.clear();
              incom_drop="other source";
              recivemethod_drop="Cash";
              SnackBar(
                content: Text("Data Sucessfully Store"),
                action: SnackBarAction(
                  label: "OK",
                  onPressed: (){},

                ),
              );

            });
          }
        },

      ),

      backgroundColor: Color(0xff7c94b6),
      appBar: AppBar(
        elevation: 0.0,

        flexibleSpace: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color(0xff7c94b6),
                  Color(0xff7c94b6)
                ]
            ),

          ),
        ),
        backgroundColor: Color(0xff7c94b6),
        actions: <Widget>[

          //  Text("${timer.format(currentDate)}",style: TextStyle(fontSize: 18),),
          FlatButton.icon(
            onPressed:()=> currentDate,
            icon: Icon(Icons.refresh),
            label: Text("${timer.format(currentDate)}",style: TextStyle(fontSize: 14),),),

          FlatButton.icon(
              onPressed:()=> _selectDate(context),
              icon: Icon(Icons.arrow_drop_down),
              label: Text("${dateformate.format(currentDate)}",style: TextStyle(fontSize: 14),)),
          FlatButton.icon(onPressed: (){

            // if(!(exptype.isEmpty && expamount.isEmpty))
            //   {
            //     setState(() {
            //       count++;
            //     });
            //     dataSave();
            //     print(exptype);
            //     print(expamount);
            //   }
          },
              icon:Icon(Icons.where_to_vote_outlined), label: Text("Save"))
        ],
      ),
      body: ListView.builder(
          itemCount: item,
          itemBuilder:(context,index){
            return Card(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              color: Color(0xff7c94b6),
              elevation: 40,

              child: Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Form(
                  key: _key,
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.all(5),
                        child: TextFormField(
                          controller: ballnce,
                          validator: (value){
                            if(value.isEmpty)
                            {
                              return 'please Enter Balance';
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),
                          // controller: expdis,
                          decoration:  InputDecoration(
                            //      errorText: checkbox?"Value can't be empty":null,
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(const Radius.circular(20)),
                              ),
                              prefixIcon: Icon(MyFlutterApp.salary,color: Colors.amber,),
                              suffixIcon: IconButton(onPressed: (){
                                ballnce.clear();
                              },
                                icon: Icon(Icons.clear,),),
                              hintText: "Income"

                          ),
                          // keyboardType: TextInputType.number,
                          // inputFormatters: <TextInputFormatter>[
                          //   FilteringTextInputFormatter.digitsOnly
                          // ],
                          // onChanged: (value)
                          //  {
                          //
                          //    if(!(value.isEmpty))
                          //      amount=value;
                          //    //  print(exptype);
                          //      super.initState();
                          //
                          //
                          //  },
                        ),
                      ),


                      // Padding(
                      //   padding: EdgeInsets.all(5),
                      //   child: TextFormField(
                      //
                      //     style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),
                      //     // controller: expdis,
                      //     controller: catg,
                      //     decoration:  InputDecoration(
                      //       // errorText: checkbox?"Value can't be empty":null,
                      //         border: OutlineInputBorder(
                      //           borderRadius: const BorderRadius.all(const Radius.circular(20)),
                      //         ),
                      //         prefixIcon: Icon(Icons.account_balance_rounded,color: Colors.cyan,),
                      //         suffixIcon: IconButton(onPressed: (){
                      //            catg.clear();
                      //           }, icon:Icon( Icons.clear)),
                      //
                      //
                      //         hintText: "Catogory(Sellary/Bussines/other)"
                      //
                      //     ),
                      //     validator: (value){
                      //       if(value.isEmpty)
                      //       {
                      //         return "Please Enter Income catagory";
                      //       }
                      //       return null;
                      //
                      //     },



                          // onChanged: (value)
                          // {
                          //
                          //   if(!(value.isEmpty))
                          //   exptype=value;
                          //   //  print(exptype);
                          //   super.initState();
                          //
                          //
                          // },
                      //  ),
                    //  ),
                Container(
                    decoration: ShapeDecoration(

                        shape: RoundedRectangleBorder(

                            side: BorderSide(width:  0,style: BorderStyle.solid),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        )
                    ),
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: DropdownButton<String>(

                      //hint:new Text("Expence type"),
                      value: incom_drop,
                      icon: Icon(Icons.keyboard_arrow_down_outlined),
                      isExpanded: true,
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black54),
                      underline: Container(
                        height: 2,
                      ),
                      items: <String>["Sellary","Business","other source"].map<DropdownMenuItem<String>>((String value1) {

                        return DropdownMenuItem<String>(

                          value: value1,
                          child: Row(
                            children: [
                              IconButton(icon: Icon(Icons.payments,color: Colors.lightBlueAccent,), onPressed: null),
                              Text(value1),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (String newvalue1)
                      {
                        setState(() {
                          if(!(newvalue1=="Icome source"))
                            incom_drop=newvalue1;

                        });

                      },

                    )

                ),
                Container(
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width:  0,style: BorderStyle.solid),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        )
                    ),
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: DropdownButton<String>(

                      //hint:new Text("Expence type"),
                      value: recivemethod_drop,
                      icon: Icon(Icons.keyboard_arrow_down_outlined),
                      isExpanded: true,
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black54),
                      underline: Container(
                        height: 2,
                      ),
                      items: <String>["Cash","Bank Card","mobile transection","other"].map<DropdownMenuItem<String>>((String value2) {

                        return DropdownMenuItem<String>(

                          value: value2,
                          child: Row(
                            children: [
                              IconButton(icon: Icon(Icons.payments,color: Colors.lightBlueAccent,), onPressed: null),
                              Text(value2),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (String newvalue2)
                      {
                        setState(() {
                          if(!(newvalue2=="Recived Mehod"))
                            recivemethod_drop=newvalue2;

                        });

                      },

                    )

               ),
                      //subtitle:
                      // Padding(
                      //   padding: EdgeInsets.all(5),
                      //   child: TextFormField(
                      //     controller: payment,
                      //     validator: (value)
                      //     {
                      //       if(value.isEmpty){
                      //         return "Enter Recive Method";
                      //       }
                      //       return null;
                      //     },
                      //     style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),
                      //     // controller: expdoler,
                      //     decoration: InputDecoration(
                      //       //   errorText: checkbox?"Value can't be empty":null,
                      //         prefixIcon: Icon(Icons.credit_card,color: Colors.blueAccent,),
                      //         suffixIcon: IconButton(onPressed: (){
                      //           payment.clear();
                      //         }, icon:Icon( Icons.clear),),
                      //         border: OutlineInputBorder(
                      //             borderRadius:const BorderRadius.all(const Radius.circular(20))
                      //         ),
                      //         hintText: "Recive Method(Cash/Bank Card)"
                      //     ),

                          // keyboardType: TextInputType.number,
                          //  inputFormatters: <TextInputFormatter>[
                          //    FilteringTextInputFormatter.digitsOnly
                          //  ],
                          //      onChanged: (value)
                          // {
                          //   if(!(value.isEmpty))
                          //     payMethod=value;
                          //   //  print(expamount);
                          //     super.initState();
                          //
                          //
                          // },
                      //  ),
                    //  ),

                      // ),
                      // ListTile(
                      //  title:
                      // Container(
                      //     decoration: ShapeDecoration(
                      //         shape: RoundedRectangleBorder(
                      //             side: BorderSide(width:  0,style: BorderStyle.solid),
                      //             borderRadius: BorderRadius.all(Radius.circular(20))
                      //         )
                      //     ),
                      //     padding: EdgeInsets.all(5),
                      //     margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      //     child: DropdownButton<String>(
                      //
                      //       //hint:new Text("Expence type"),
                      //       value: status_drop,
                      //       icon: Icon(Icons.keyboard_arrow_down_outlined),
                      //       isExpanded: true,
                      //       iconSize: 24,
                      //       elevation: 16,
                      //       style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black54),
                      //       underline: Container(
                      //         height: 2,
                      //       ),
                      //       items: <String>["Status","Recived","Upcoming","Goal","Expaction"].map<DropdownMenuItem<String>>((String value3) {
                      //
                      //         return DropdownMenuItem<String>(
                      //
                      //           value: value3,
                      //           child: Row(
                      //             children: [
                      //               IconButton(icon: Icon(Icons.payments,color: Colors.lightBlueAccent,), onPressed: null),
                      //               Text(value3),
                      //             ],
                      //           ),
                      //         );
                      //       }).toList(),
                      //       onChanged: (String newvalue3)
                      //       {
                      //         setState(() {
                      //         //  if(!(newvalue=="Status"))
                      //             status_drop=newvalue3;
                      //
                      //         });
                      //
                      //       },
                      //
                      //     )
                      //
                      // ),
                      // subtitle:
                      // Padding(
                      //   padding: EdgeInsets.all(10),
                      //   child: TextFormField(
                      //     controller: stats,
                      //     validator: (value)
                      //     {
                      //       if(value.isEmpty)
                      //         return "Enter status(Recive/upcoming)";
                      //       return null;
                      //     },
                      //
                      //
                      //     style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),
                      //     //controller: expdoler,
                      //     decoration: InputDecoration(
                      //         prefixIcon: Icon(Icons.category,color: Colors.blueAccent,),
                      //         suffixIcon: IconButton(onPressed: (){
                      //           stats.clear();
                      //         },icon: Icon(Icons.clear),),
                      //         // errorText: checkbox?"Value can't be empty":null,
                      //         border: OutlineInputBorder(
                      //
                      //             borderRadius: const BorderRadius.all(Radius.circular(20))
                      //         ),
                      //         hintText: "States(Recive/Upcominig)"
                      //     ),

                          // keyboardType: TextInputType.number,
                          // inputFormatters: <TextInputFormatter>[
                          //   FilteringTextInputFormatter.digitsOnly
                          // ],
                          // onChanged: (value)
                          // {
                          //   if(!(value.isEmpty))
                          //   status=value;
                          //   //  print(expamount);
                          //   super.initState();
                          //
                          //
                          // },
                      //  ),
                      //),
                      Padding
                        (
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: refs,


                          style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),
                          // controller: expdoler,
                          decoration: InputDecoration(
                            //           errorText: checkbox?"Value can't be empty":null,
                            // border: OutlineInputBorder(
                            //     borderRadius: const BorderRadius.all(Radius.circular(30))
                            // ),
                              hintText: "Ref/check number (optional)"
                          ),

                          // keyboardType: TextInputType.number,
                          // inputFormatters: <TextInputFormatter>[
                          //   FilteringTextInputFormatter.digitsOnly
                          // ],
                          // onChanged: (value)
                          // {
                          //   if(!(value.isEmpty))
                          //   refno=value;
                          //   //  print(expamount);
                          //   super.initState();
                          //
                          //
                          // },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: disc,
                          style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),
                          // controller: expdoler,
                          decoration: InputDecoration(
                            //         errorText: checkbox?"Value can't be empty":null,
                            // border: OutlineInputBorder(
                            //     borderRadius: const BorderRadius.all(Radius.circular(20))
                            // ),
                              hintText: "Discriptin (Optional)"
                          ),

                          // keyboardType: TextInputType.number,
                          // inputFormatters: <TextInputFormatter>[
                          //   FilteringTextInputFormatter.digitsOnly
                          // ],
                          // onChanged: (value)
                          // {
                          //   if(!(value.isEmpty))
                          //   des=value;
                          //   //  print(expamount);
                          //   super.initState();
                          //
                          //
                          // },
                        ),
                      ),
                      // )

                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}