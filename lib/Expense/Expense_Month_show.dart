
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:budget_mangement/DataBase/FloorDatabase/DatabaseCreate.dart';
import 'package:budget_mangement/DataBase/FloorDatabase/Entity.dart';
import 'package:budget_mangement/DataBase/FloorDatabase/budgetDAO.dart';
import 'package:budget_mangement/Sellery/Incom.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
class ExpenseMonth extends StatefulWidget {
  String selectedYear;
 // budgetDao dio;
  //ExpenseMonth({Key key, this.selectedYear,  budgetDao deo}):super(key: key);
  @override
  _ExpenseMonthState createState() => _ExpenseMonthState();
}

class _ExpenseMonthState extends State<ExpenseMonth> {
  List<String> months=['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'dec'];
  List <String> year=['2020', '2021', '2022', '2023', '2024', '2025', '2026', '2027', '2028', '2029', '2031', '2032'];
List month=[];
  String selectedMonth;
  int monthNo;
  int mon;
  int totalExpnseofmonth=0;
  int totalIncomeofmonth=0, budget=0;
  int lost=0;
  String monthvalue,budgLost='Budget/Lost';
  int yearNo;
  String selectedYear;
  int tuchIndix;
  String Expenses;
  String Incoms;
  ExpEntity dio;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Colors.cyan[700],

      // appBar: AppBar(
      //   title: Text("Expnse",style: TextStyle(fontSize:18,fontWeight: FontWeight.w900),),
    //  ),
      body:  LayoutBuilder(
        builder:(context,size)
          {
         return Column(
            children:<Widget> [

              Container(
                margin: const EdgeInsets.only(bottom: 6.0), //Same as `blurRadius` i guess
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.cyan[900],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                padding: EdgeInsets.only(top: 50),
                //  width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height*0.2,
                //   color: Colors.cyan[900],
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    // Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: <Widget>[
                    //       Text("Select Month",style: TextStyle(fontSize:14,fontWeight: FontWeight.w900,fontFamily: 'Quicksand',color: Colors.white),),
                    //       Text("Select Year",style: TextStyle(fontSize:14,fontWeight: FontWeight.w900,fontFamily: 'Quicksand',color: Colors.white),),
                    //     ]
                    // ),
                    // ,FlatButton(
                    //     onPressed: (){
                   Divider(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          DropdownButton(
                              hint: Text('Select Month',style: TextStyle(fontSize:14,fontWeight: FontWeight.w900,fontFamily: 'Quicksand',color: Colors.white),),
                              value: selectedMonth,
                              onChanged: (value){
                                setState(() {
                                  selectedMonth=value;
                                  monthNo=months.indexOf(value);
                                  mon= months.indexOf(value);
                                  ++mon;
                                  if(monthNo<10)
                                  {
                                    setState(() {
                                      monthvalue="0${mon.toString()}";
                                    });
                                  }
                                  else
                                  {
                                    setState(() {
                                      monthvalue=mon.toString();
                                    });
                                  }
                                  // print("Month no is :$monthvalue");
                                });
                              },
                              items:
                              months.map((e) {
                                return DropdownMenuItem(
                                  child: new Text(e),
                                  value: e,
                                );
                              }).toList()

                          ),
                          DropdownButton(
                              hint: Text('Select Year',style: TextStyle(fontSize:14,fontWeight: FontWeight.w900,fontFamily: 'Quicksand',color: Colors.white),),
                              value: selectedYear,
                              onChanged: (value){
                                setState(() {
                                  selectedYear=value;
                                  print("Month no is :$selectedYear");
                                });

                              },

                              items:
                              year.map((e) {
                                return DropdownMenuItem(
                                  child: new Text(e),
                                  value: e,

                                );
                              }).toList()

                          ),
                        ]
                    )
                  ],
                ),
              ),
    //    ),
              Expanded(
                child: Container(
                //  width: MediaQuery.of(context).size.width,
               //   height: MediaQuery.of(context).size.height*0.8,
                  child: FutureBuilder<databaseexp>(
                    future: $Floordatabaseexp.databaseBuilder('budget_managment_app').build(),
                    builder: (context,index){
                      if (index.hasError) {
                         return Text("DataBase error");
                      }
                      if(!index.hasData)
                      {
                        return CircularProgressIndicator();
                      }
                      else
                        {
                          final cchk='%$selectedYear-$monthvalue-%';
                          return StreamBuilder<List<IncomEntity>>(
                              stream: index.data.expdio.incomePrevsMonths(cchk).asStream(),
                              builder: (BuildContext context,AsyncSnapshot <List<IncomEntity>> snapshot){
                                var listExpnse=snapshot.data as List<IncomEntity>;
                                 return ListView.builder(
                                          itemCount: listExpnse !=null ? listExpnse.length:0,
                                          itemBuilder: (context,item)
                                     {
                                       if(listExpnse.isEmpty) {
                                         final snakbar = SnackBar(
                                             content: Text("data"));
                                         Scaffold.of(context).showSnackBar(snakbar);
                                       }
                                       return Container(
                                           child: Column(
                                               children: [
                                                 Container(
                                                   alignment: Alignment
                                                       .topCenter,
                                                   child: Column(
                                                     children: <Widget>[
                                                       Divider(),
                                                       Card(
                                                         color: Colors.cyan[300],
                                                         elevation: 10,
                                                         child: Row(
                                                           children: <Widget>[
                                                             Padding(
                                                               padding: EdgeInsets
                                                                   .all(
                                                                   16),
                                                               child: GestureDetector(
                                                                 onTap: () {},
                                                                 child: Container(
                                                                   width: 100,
                                                                   height: 100,
                                                                   decoration: BoxDecoration(
                                                                       color: Colors.cyan[400],
                                                                       borderRadius: BorderRadius
                                                                           .all(
                                                                           Radius
                                                                               .circular(
                                                                               20)),
                                                                       boxShadow: [
                                                                         BoxShadow(
                                                                             blurRadius: 7.0,
                                                                             color: Colors
                                                                                 .black)
                                                                       ]
                                                                   ),
                                                                   child: Center(
                                                                       child: Text(
                                                                         ('Date: \n ${listExpnse[item].dateexp}'),
                                                                         style: TextStyle(
                                                                             fontSize: 16,
                                                                             fontWeight: FontWeight
                                                                                 .w900,
                                                                             color: Colors
                                                                                 .white),)),
                                                                 ),
                                                               ),
                                                             ),
                                                             GestureDetector(
                                                               onTap: () {},
                                                               child: Container(
                                                                 // padding: EdgeInsets.all(16),
                                                                 child: Column(
                                                                   mainAxisAlignment: MainAxisAlignment
                                                                       .spaceBetween,
                                                                   children: [
                                                                     Row(
                                                                         mainAxisAlignment: MainAxisAlignment
                                                                             .spaceBetween,
                                                                         children: [
                                                                           Text(
                                                                               "Income  :  "),
                                                                           Text(
                                                                               ('${listExpnse[item].amount}')
                                                                                   .toString()),
                                                                         ]
                                                                     ),
                                                                    GestureDetector(
                                                                      // ignore: missing_return
                                                                      onTap:(){
                                                                        AwesomeDialog(
                                                                          context: context,
                                                                          dialogType: DialogType.INFO,
                                                                          animType: AnimType.BOTTOMSLIDE,
                                                                          title:'Amount:  ${listExpnse[item].amount}\nTitle:-  ${listExpnse[item].ref}' ,
                                                                          desc:'Description:-  ${listExpnse[item].discr}' ,
                                                                          btnCancelOnPress: () {},
                                                                          btnOkOnPress: () {},
                                                                        )..show();
                                                                        // showDialog(
                                                                        //   context: context, builder: (context) {
                                                                        //     return SingleChildScrollView(
                                                                        //       child: AlertDialog(
                                                                        //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                                        //         elevation: 16,
                                                                        //         title: Container(
                                                                        //
                                                                        //           height: 400.0,
                                                                        //           width: 600.0,
                                                                        //           child: ListView(
                                                                        //
                                                                        //             children: <Widget>[
                                                                        //               SizedBox(height: 20),
                                                                        //               Center(
                                                                        //                 child: Text(
                                                                        //                   "Income Detaild",
                                                                        //                   style: TextStyle(fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
                                                                        //                 ),
                                                                        //               ),
                                                                        //               SizedBox(height: 20),
                                                                        //             Divider(),
                                                                        //
                                                                        //                     Text('Income:'),
                                                                        //                     SizedBox(height: 10,),
                                                                        //                     Text('${listExpnse[item].amount.toString()}',style: TextStyle(fontStyle: FontStyle.normal),),
                                                                        //                     SizedBox(height: 10,),
                                                                        //                     Divider(),
                                                                        //                     SizedBox(height: 10,),
                                                                        //                     Text('Refrense:'),
                                                                        //                     SizedBox(height: 10,),
                                                                        //                     Text('${listExpnse[item].ref}',style: TextStyle(fontStyle: FontStyle.normal),),
                                                                        //                     SizedBox(height: 10,),
                                                                        //                     Divider(height: 2,),
                                                                        //                     SizedBox(height: 10,),
                                                                        //                     Text('Date of Income:'),
                                                                        //                     SizedBox(height: 10,),
                                                                        //                     Text('${listExpnse[item].dateexp}',style: TextStyle(fontStyle: FontStyle.normal),),
                                                                        //                     SizedBox(height: 10,),
                                                                        //                     Divider(height: 2,),
                                                                        //                     SizedBox(height: 10,),
                                                                        //                     Text('Discription:'),
                                                                        //                     SizedBox(height: 10,),
                                                                        //                     Expanded(
                                                                        //                         child: Text('${listExpnse[item].discr}',style: TextStyle(fontStyle: FontStyle.normal),)),
                                                                        //
                                                                        //
                                                                        //
                                                                        //                   ],
                                                                        //                 ),
                                                                        //
                                                                        //             ),
                                                                        //          content: Center(
                                                                        //
                                                                        //            child:  FlatButton(onPressed: ()=>Navigator.pop(context),
                                                                        //                child:Text("ok",style: TextStyle(fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold))),
                                                                        //
                                                                        //          ),
                                                                        //
                                                                        //          //   )
                                                                        //          //   ],
                                                                        //       //    ),
                                                                        //     //    ),
                                                                        //
                                                                        //       ),
                                                                         //   );
                                                                       //   },

                                                                     //   );
                                                                      },
                                                                    child: Chip(

                                                                       label: Text("Information"),
                                                                       shadowColor: Colors.blue,
                                                                       backgroundColor: Colors.blue,
                                                                       elevation: 10,
                                                                       autofocus: true,
                                                                     ),

                                                                    )
                                                                   ],
                                                                 ),
                                                               ),
                                                             )
                                                           ],
                                                         ),
                                                       )
                                                     ],
                                                   ),
                                                 )
                                               ])

                                       );
                                     }
                                 );

                               });
                        }
                    },
                  ),
                ),
              )
  ]
    );
    }
      )
    );
  }
}
