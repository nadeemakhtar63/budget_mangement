import 'dart:math';

import 'package:budget_mangement/DataBase/FloorDatabase/DatabaseCreate.dart';
import 'package:budget_mangement/DataBase/FloorDatabase/Entity.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Budget extends StatefulWidget {

  @override
  _BudgetState createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
List<String> months=['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'dec'];
List <String> year=['2020', '2021', '2022', '2023', '2024', '2025', '2026', '2027', '2028', '2029', '2031', '2032'];
  String selectedMonth;
int monthNo;
int mon;
int totalExpnseofmonth=0;
int totalIncomeofmonth=0, budget=0;
double incom_per=0.0;
double expence_per=0.0;
double profit_per=0.0;
int lost=0;
String monthvalue,budgLost='Budget/Lost';
int yearNo;
String selectedYear;
int tuchIndix;
String Expenses;
String Incoms;
ExpEntity dio;
void initState()
{
  loaddata(selectedYear,selectedMonth);
  // loadIncom(selectedYear,selectedMonth);
  super.initState();

}
Future<double> loaddata(selectedYear,selectedMonth) async
{
  var ExpTabel;
  var IncomTable;
  var d = DateTime.now();
  var k = DateFormat('MM');
  String dd = k.format(d);
  // print("Month is :$dd");
  final cchk = '%-$dd-%';
  final db = await $Floordatabaseexp.databaseBuilder('budget_managment_app')
      .build();
  ExpTabel = await db.expdio.expPrevsMonths('%$selectedYear-$monthvalue-%');

  totalExpnseofmonth = 0;
  for (int i = 0; i < ExpTabel.length; i++) {
    totalExpnseofmonth += ExpTabel[i].amount;
  }
  IncomTable =
  await db.expdio.incomePrevsMonths('%$selectedYear-$monthvalue-%');

  totalIncomeofmonth = 0;
  for (int i = 0; i < IncomTable.length; i++) {
    totalIncomeofmonth += IncomTable[i].amount;
  }
  setState(() {
     totalIncomeofmonth;
     totalExpnseofmonth;
     budget=(totalIncomeofmonth-totalExpnseofmonth);
     incom_per=totalIncomeofmonth/(totalIncomeofmonth+totalExpnseofmonth);
     expence_per=totalExpnseofmonth/(totalIncomeofmonth+totalExpnseofmonth);

    profit_per=(budget.abs())/(totalIncomeofmonth+totalExpnseofmonth);

  });
}
  @override
  Widget build(BuildContext context) {
print('test income $totalIncomeofmonth');
print('test expense$totalExpnseofmonth');
    return  Scaffold(

        backgroundColor: Colors.cyan[900],
        body: Column(
          children:<Widget> [

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
                  // width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height*0.2,

                  child: Column(
                    children: <Widget>[
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: <Widget>[
  //                   Text('Select Month',style: TextStyle(fontSize:14,fontWeight: FontWeight.w900,fontFamily: 'Quicksand',color: Colors.white),),
  //                   Text('Select Year',style: TextStyle(fontSize:14,fontWeight: FontWeight.w900,fontFamily: 'Quicksand',color: Colors.white),),
  // ]
  //                 ),
                    Divider(),
                    // ,FlatButton(
                    //     onPressed: (){
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

                                   monthvalue="0${mon.toString()}";

                                 }
                               else
                                 {
                                   monthvalue=mon.toString();

                                 }
                             //  loadIncom(selectedYear,selectedMonth);
                               loaddata(selectedYear,selectedMonth);
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
                            //  loadIncom(selectedYear,selectedMonth);
                              loaddata( selectedYear,selectedMonth);
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

            Expanded(

                child: SingleChildScrollView(
                  child: Column(
                    children: [
                    AspectRatio(
                        aspectRatio: 1.3,
                      child: Card(
                        color: Colors.cyan[900],
                        child: Row(
                          children: <Widget>[
                             const SizedBox(
                               height: 18,
                             ),
                           Expanded(
                               child: AspectRatio(
                                 aspectRatio: 1,
                                 child: PieChart(
                                   PieChartData(
                                     pieTouchData: PieTouchData(touchCallback: (pieTouchResponse){
                                       setState(() {
                                         if(pieTouchResponse.touchInput is FlLongPressEnd || pieTouchResponse.touchInput is FlPanEnd)
                                           {
                                             tuchIndix=-1;
                                           }
                                         else
                                           {
                                             tuchIndix=pieTouchResponse.touchedSectionIndex;
                                           }
                                       });
                                     }),
                                     borderData: FlBorderData(
                                       show: false
                                     ),

                                       sectionsSpace: 0,
                                     centerSpaceRadius: 50.0,
                                     //centerSpaceColor: Colors.green,

                                     sections: showingSections(),
                                   )
                                 ),
                               ),
                           ),
                                // const SizedBox(
                                // width: 18,
                                // ),
                                ],
                                ),
                                )
                                ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment:MainAxisAlignment.end,
                            //  mainAxisSize: MainAxisSize.min,
                            children: [
                              FlatButton(
                                    onPressed:(){} ,
                                    color:  Color(0xff0293ee),
                                    textColor: Colors.white,
                                 //   padding: EdgeInsets.all(8.0),
                                    child:Text('Expense:',style: TextStyle(fontWeight: FontWeight.w900,))),

                              SizedBox(height: 20,),

                              FlatButton(onPressed:(){} ,
                               color:  Color(0xfff8b250),
                               textColor: Colors.white,
                           //    padding: EdgeInsets.all(8.0),
                                    child:Text('Income:',style: TextStyle(fontWeight: FontWeight.w900,))),

                              SizedBox(height: 20,),
                                FlatButton(onPressed:(){} ,
                                color:  budget<0 ?Colors.red:Colors.green,
                                textColor: Colors.white,
                              //  padding: EdgeInsets.all(8.0),
                                child:Text('${budget<0 ? 'Loss':'Profit'}:',style: TextStyle(fontWeight: FontWeight.w900,)))
                              // Text('$budgLost: ${budget.toString()}',style: TextStyle(fontWeight: FontWeight.w900,color: Color(0xff845bef)),)
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new CircularPercentIndicator(
                                radius: 60.0,
                                animation: true,
                                animationDuration: 1200,
                                lineWidth: 6.0,
                                percent: expence_per.isFinite ?expence_per:0.0,
                                center:
                                expper(),
                                circularStrokeCap: CircularStrokeCap.butt,
                                backgroundColor: Colors.white,
                                progressColor: Color(0xff0293ee),
                              ),
                              new CircularPercentIndicator(
                                  radius: 60.0,
                                  animation: true,
                                  animationDuration: 1200,
                                  lineWidth: 6.0,
                                  percent:incom_per.isFinite? incom_per:0.0,
                                  center: inper(),
                                  circularStrokeCap: CircularStrokeCap.butt,
                                  backgroundColor: Colors.white,
                                  progressColor: Color(0xfff8b250)
                              ),
                              new CircularPercentIndicator(
                                radius: 60.0,
                                animation: true,
                                animationDuration: 1200,
                                lineWidth: 6.0,
                                percent:(profit_per.abs()).isFinite ?profit_per:0.0,
                                center:
                                budper(),
                                circularStrokeCap: CircularStrokeCap.butt,
                                backgroundColor: Colors.white,
                                progressColor: budget>=0 ?Colors.green:Colors.red,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment:MainAxisAlignment.end,
                            //  mainAxisSize: MainAxisSize.min,
                            children: [
                        FlatButton(
                              onPressed:(){} ,
                              color:  Color(0xff0293ee),
                              textColor: Colors.white,
                              //   padding: EdgeInsets.all(8.0),
                              child:Text('${totalExpnseofmonth.toString()}',style: TextStyle(fontWeight: FontWeight.w900,))),
                              SizedBox(height: 20,),

                              FlatButton(
                              onPressed:(){} ,
                                  color:  Color(0xff0293ee),
                                  textColor: Colors.white,
                                  //   padding: EdgeInsets.all(8.0),
                                  child:Text('${totalIncomeofmonth.toString()}',style: TextStyle(fontWeight: FontWeight.w900,))),
                              SizedBox(height: 20,),
                              FlatButton(onPressed:(){} ,
                                  color:  budget>=0 ?Colors.green:Colors.red,
                                  textColor: Colors.white,
                                  //  padding: EdgeInsets.all(8.0),
                                  child:Text(' ${budget.toString()}',style: TextStyle(fontWeight: FontWeight.w900,)))
                              // Text('$budgLost: ${budget.toString()}',style: TextStyle(fontWeight: FontWeight.w900,color: Color(0xff845bef)),)
                            ],
                          ),
                        ],
                      ),
                    ]
                                ),
                )
                              )
                           //   )
                              ]
                              )
                              );
                          }
                             Widget expper(){
                             double exp=(((totalExpnseofmonth/(totalIncomeofmonth+totalExpnseofmonth))*100)).abs();
                            // int k=exp.toInt();
                             if(exp.isNaN)
                              {
                                 return Text("");
                              }
                             else{
                           return   Text('${(exp.toInt()).toString()}%');
                             }
                          }
                        Widget inper(){
                          double exp;
                           setState(() {
                             exp=((totalIncomeofmonth/(totalIncomeofmonth+totalExpnseofmonth))*100).abs();
                           });

                          // int k=exp.toInt();
                          if(exp.isNaN)
                          {
                            return Text("");
                          }
                          else{
                            return   Text('${(exp.toInt()).toString()}%');
                          }
                        }
                      Widget budper(){
                        double exp=((budget/(totalIncomeofmonth+totalExpnseofmonth))*100).abs();
                        // int k=exp.toInt();
                        if(exp.isNaN)
                        {
                          return Text("");
                        }

                        else{
                          return   Text('${(exp.toInt()).toString()}%');
                        }
                        }

                        List<PieChartSectionData> showingSections() {
                          double expo,incomeo,budgetio;

                         setState((){
                              expo=((totalExpnseofmonth/(totalIncomeofmonth+totalExpnseofmonth))*100).abs();
                              incomeo=((totalIncomeofmonth/(totalIncomeofmonth+totalExpnseofmonth))*100).abs();
                              budgetio=((budget/(totalIncomeofmonth+totalExpnseofmonth))*100).abs();
                            //  super.initState();
                              });
                          return List.generate(3, (i) {
                            final isTouched = i == tuchIndix;
                            final double fontSize = isTouched ?25:16;
                            final double radius = isTouched ?60:50;
                            switch (i) {
                              case 0:
                                return PieChartSectionData(
                                  color: const Color(0xff0293ee),
                                  value: expo==double.nan || expo.isInfinite || expo.isNaN?0:expo,
                                  title: 'Expense',
                                  radius: radius,
                                  titleStyle: TextStyle(
                                      fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                                );
                              case 1:
                                return PieChartSectionData(
                                  color: const Color(0xfff8b250),
                                  value: incomeo==double.nan || incomeo.isInfinite || incomeo.isNaN?0:incomeo,
                                  title: 'Income',
                                  radius: radius,
                                  titleStyle: TextStyle(
                                      fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                                );
                              case 2:
                                return PieChartSectionData(
                                  color: budget>=0?Colors.green:Colors.red,
                                  value: budgetio==double.nan || budgetio.isInfinite || budgetio.isNaN?0:budgetio,
                                  title: budget>=0 ? 'Profit':'Loss',
                                  radius: radius,
                                  titleStyle: TextStyle(
                                      fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                                );

                              default:
                                return null;
                            }
                          });
                        }

  void moveToLastScreen() {
    Navigator.pop(context);
  }
                        }
