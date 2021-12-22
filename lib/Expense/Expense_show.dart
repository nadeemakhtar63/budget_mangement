
import 'package:budget_mangement/DataBase/FloorDatabase/DatabaseCreate.dart';
import 'package:budget_mangement/DataBase/FloorDatabase/Entity.dart';
import 'package:budget_mangement/DataBase/FloorDatabase/budgetDAO.dart';
import 'package:budget_mangement/Profit/Budget.dart';
import 'package:budget_mangement/Profit/detailProfit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class ExpenseShow extends StatefulWidget {
  String selectedYear;
  ExpenseShow({Key key, @required this.selectedYear}):super(key: key);


  @override
  _ExpenseShowState createState() => _ExpenseShowState();
}

class _ExpenseShowState extends State<ExpenseShow>  {
  List monthUpComing=["no month",'January',"February",'March','April','May','June','July','August','September','October','November','December'];
  List monthvalue=[];
  //var expdeo;
  budgetDao  expdeo;
  int totalexp=0;

  @override
  Widget build(BuildContext context) {
    var d = DateTime.now();
    String years = widget.selectedYear;
    var formt = DateFormat("yyyy-MM-dd");
    List<String> months=['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'dec'];
    List <String> year=['2020', '2021', '2022', '2023', '2024', '2025', '2026', '2027', '2028', '2029', '2031', '2032'];
    List<Color> selectColors=[Colors.black,Colors.red,Colors.amber,Colors.tealAccent,Colors.lime,Colors.greenAccent,Colors.black,Colors.red,Colors.amber,Colors.tealAccent,Colors.lime,Colors.greenAccent];
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
    // String date1=(DateTime(d.year,d.month,d.day)).toString();
    var date2=(DateTime(2022));
    var monthget=DateFormat('M');
    String getmonths=monthget.format(date2);
    // String m=(DateTime(d.month)).toString();
    var current_month=(d.month);
    var current_year=d.year;
    var k = DateFormat('MM');
    String dd = k.format(d);
    String dd1 = k.format(d);
    int dat=int.parse(dd1);
    String FinalMonth;
    int datec=0;
    datec = int.parse(dd1) ;
    int mont=0;
    // print('print all month of selected year$current_year-$current_month');
    if((int.parse(widget.selectedYear))<(current_year))
    {
      mont=12;

    }
    else if((int.parse(widget.selectedYear))>(current_year))
    {
      mont=0;
    }
    else
    {
      mont=current_month.toInt();

    }
    String chooseMonths='0$mont';
      // TODO: implement build
      //return Scaffold(
          // appBar: AppBar(
          //   title: Text("Expense"),
          //   //   actions: [
          //   //     Text('$totalexp')
          //   //   ],
          // ),
          //  body:
          Container(
            padding: EdgeInsets.only(top: 50),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            color: Color(0xff0293ee),
            child: Column(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Select Month:",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w900),),
                      Text("Select Year:",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w900),),
                    ]
                ),
                // ,FlatButton(
                //     onPressed: (){
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      DropdownButton(
                          hint: Text('Select Month'),
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

                          dropdownColor: selectColors[2],
                          hint: Text('Select Year'),
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
                ),

        FutureBuilder<databaseexp>(
               future: $Floordatabaseexp.databaseBuilder('budget_managment_app')
                   .build(),
               builder: (context, build) {
                 if (build.hasData) {
                   // return ListView.builder(
                   //     itemCount: dd.length,
                   //     itemBuilder: (context, index) {
                   //         final cchk='${widget.selectedYear}-0${index+1}-%';
                   //         debugPrint('${cchk} this is data');
                         return StreamBuilder<List<ExpEntity>>(

                             stream: (build.data.expdio.expPrevsMonths('${widget.selectedYear}-${chooseMonths}-%').asStream()),
                             builder: (BuildContext context, AsyncSnapshot<List<ExpEntity>> snapshot) {
                               if (snapshot.hasData) {
                                 //var listofmonth=new List <int>.generate(int.parse(getmonths), (index) => index+1);

                                 print('print all month of selected year$current_year-$mont');
                                 var ListAllExpenses = snapshot.data as List<ExpEntity>;
                                 debugPrint('${ListAllExpenses} this is data');
                                 return ListView.builder(
                                     itemCount: ListAllExpenses != null ?mont : 0,
                                     itemBuilder: (context, index) {
                                       for (int i = 0; i < ListAllExpenses.length; i++) {
                                         totalexp += ListAllExpenses[i].amount;
                                         print('Month Coming is: ${widget.selectedYear}');
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
                                                                   decoration: BoxDecoration(color: Colors.red,
                                                                       borderRadius: BorderRadius.all(Radius.circular(20)),
                                                                       boxShadow: [
                                                                         BoxShadow(
                                                                             blurRadius: 7.0,
                                                                             color: Colors
                                                                                 .black)
                                                                       ]
                                                                   ),
                                                                   child: Center(
                                                                       child: Text(
                                                                         ('${monthUpComing[index + 1]} \n ${widget.selectedYear}'),
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
                                                                               "Expense  :  "),
                                                                           Text(
                                                                               (totalexp)
                                                                                   .toString()),
                                                                         ]
                                                                     ),
                                                                     Chip(
                                                                       label: Text(
                                                                           "Information"),
                                                                       shadowColor: Colors
                                                                           .blue,
                                                                       backgroundColor: Colors
                                                                           .blue,
                                                                       elevation: 10,
                                                                       autofocus: true,
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
                               }
                             });
                       }
                  // );
                 }

              // }
               )
            ],
          ),
    );

             //       );
            //      }
           //     }
         //     })
     // );

  }
}
