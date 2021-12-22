

import 'package:budget_mangement/DataBase/FloorDatabase/DatabaseCreate.dart';
import 'package:budget_mangement/DataBase/FloorDatabase/Entity.dart';
import 'package:budget_mangement/DataBase/FloorDatabase/budgetDAO.dart';
import 'package:budget_mangement/Expense/Expence_card.dart';
import 'package:budget_mangement/Expense/Expense_Month_show.dart';
import 'package:budget_mangement/Profit/Budget.dart';
import 'package:budget_mangement/Sellery/Incom_card.dart';
import 'package:budget_mangement/Sellery/ExpenseMonth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List monthUpComing=["2020","2021","2022",'2023','2024','2025','2026','2027','2028','2029','2030','2031','2032',"2033","2034",'2035','2036','2037','2038','2039','2040','2041','2042','2043','2044'];
  String selectedYear;
  double newbudget=0;
  double budget=0;
  double totalIncomOfMonth=0;
  double totalExpenseOfMonth=0;
// static const String TestingDevice='Mobile Id';
  String budgetAnalysis="Profit";
  var d=DateTime.now();
  var k=DateFormat('MMM-yyyy');

  @override
  initState() {

    loaddata();
    super.initState();
     print('incom check $totalIncomOfMonth');
     print('exp check $totalExpenseOfMonth');
     print('budget $budget');
  }
  Future<double> loaddata() async
  {
    var d = DateTime.now();
    var k = DateFormat('MM');
    String dd = k.format(d);
    // print("Month is :$dd");
    final cchk = '%-$dd-%';
   final db=await $Floordatabaseexp.databaseBuilder('budget_managment_app').build();
   final ExpTable=await db.expdio.expPrevsMonths(cchk);
totalExpenseOfMonth=0;
 for (int i = 0; i < ExpTable.length; i++)
 {
  totalExpenseOfMonth += ExpTable[i].amount;
 }
 totalIncomOfMonth=0;
    final IncomTable=await db.expdio.incomePrevsMonths(cchk);
    for (int i = 0; i < IncomTable.length; i++)
    {
      totalIncomOfMonth += IncomTable[i].amount;
    }
 setState(() {
    totalExpenseOfMonth;
    totalIncomOfMonth;
    budget=totalIncomOfMonth-totalExpenseOfMonth;
 });
  }
  @override
  Widget build(BuildContext context) {
    String dd=k.format(d);
  return Scaffold(
   backgroundColor:Colors.cyan[900],
    body: WillPopScope(
      onWillPop: (){
        setState(() {
          Navigator.pop(context,true);
        });
      },
      child: LayoutBuilder(
        builder: (context,size) {
          return Column(
            children: [
            Container(

            padding: EdgeInsets.only(top: 30),
            margin: const EdgeInsets.only(bottom: 6.0), //Same as `blurRadius` i guess
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: budget<0 ? Colors.red[700]:Colors.cyan[700],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
              child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //  Text(dd,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900, fontFamily: 'Quicksand')),
                        Row(

                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("${dd.toString()}", style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Quicksand',
                                color: Colors.white)),
                            // Divider(),
                            // IconButton(
                            //     color: ThemeData().backgroundColor,
                            //
                            //     icon:Icon(Icons.refresh_sharp,size: 30,) , onPressed: (){setState(() {
                            //       loaddata();
                            //     });})
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Expense\n$totalExpenseOfMonth", style: TextStyle(fontSize: 14,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Quicksand',
                                color: Colors.white),),
                            Text("Income\n$totalIncomOfMonth", style: TextStyle(fontSize: 14,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Quicksand',
                                color: Colors.white),),
                            Text(budget>=0 ? 'Profit\n$budget':'Loss\n$budget', style: TextStyle(fontSize: 14,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Quicksand',
                                color: Colors.white),),
                          ],
                        ),])
            ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    // width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height*0.8,
                    child: SingleChildScrollView(
                      child: Column(

                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(

                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,new MaterialPageRoute(builder: (_) => Expence_card())).then((value) => value ?loaddata():null);
                                    },
                                    child: Column(
                                      children: [

                                        Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  10)),
                                          color: Colors.white,

                                          child: Column(

                                            children: [
                                              Card(

                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(10)),
                                                semanticContainer: true,
                                                clipBehavior: Clip
                                                    .antiAliasWithSaveLayer,
                                                child: Image.asset(
                                                  "coin.png", width: 110,
                                                  height: 120,
                                                  color: Colors.lightBlue,),
                                                elevation: 20.0,
                                              ),


                                              SizedBox(height: 5,),
                                              Text("Add Expense", style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),),
                                              SizedBox(height: 5,),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                              ),

                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,new MaterialPageRoute(builder: (_) => Income_card())).then((value) => value ?loaddata():null);
                                  },
                                  child: Column(
                                    children: [
                                      Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10)),
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(
                                                      10)),
                                              semanticContainer: true,
                                              elevation: 20.0,
                                              clipBehavior: Clip
                                                  .antiAliasWithSaveLayer,
                                              child: Image.asset(
                                                "growth.png", width: 110,
                                                height: 120,
                                                color: Colors.brown,),
                                            ),
                                            SizedBox(height: 5,),
                                            Text("Add Income", style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),),
                                            SizedBox(height: 5,),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => ExpenseMonths()));
                                },
                                child: Column(
                                  children: [
                                    Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)),
                                      color: Colors.white,

                                      child: Column(

                                        children: [
                                          Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    10)),
                                            semanticContainer: true,
                                            elevation: 20.0,
                                            clipBehavior: Clip.antiAliasWithSaveLayer,
                                            child: Image.asset(
                                              "accounting.png", width: 110,
                                              height: 120,
                                              color: Colors.purple,),
                                          ),
                                          SizedBox(height: 5,),
                                          Text("Show Expense",
                                            style: TextStyle(fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),),
                                          SizedBox(height: 5,),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => ExpenseMonth()));
                                },
                                child: Column(
                                  children: [
                                    Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)),
                                      color: Colors.white,

                                      child: Column(

                                        children: [
                                          Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    10)),
                                            semanticContainer: true,
                                            elevation: 20.0,
                                            clipBehavior: Clip.antiAliasWithSaveLayer,
                                            child: Image.asset(
                                              "profits.png", width: 110,
                                              height: 120,
                                              color: Colors.deepPurpleAccent,),
                                          ),
                                          SizedBox(height: 5,),
                                          Text("Show Income", style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),),
                                          SizedBox(height: 5,),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                          SizedBox(height: 10,),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Budget()));
                            },
                            child: Column(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: Colors.white,

                                  child: Column(

                                    children: [
                                      Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20)),
                                        semanticContainer: true,
                                        elevation: 20.0,
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        child: Image.asset(
                                          "stock-exchange-app.png", width: 110,
                                          height: 120,
                                          color: Colors.green,),
                                      ),
                                      SizedBox(height: 5,),
                                      Text("Budget Graph", style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),),
                                      SizedBox(height: 5,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Container(
                          //   width: MediaQuery.of(context).size.width,


                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      ),
    ),
  );


  }




}
