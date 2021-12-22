import 'package:budget_mangement/DataBase/FloorDatabase/DatabaseCreate.dart';
import 'package:budget_mangement/DataBase/FloorDatabase/Entity.dart';
import 'package:budget_mangement/ModleClass/Transection.dart';
import 'package:budget_mangement/widgets/ListTransection.dart';
import 'package:budget_mangement/widgets/NewTransection.dart';
import 'package:budget_mangement/widgets/chart.dart';
import 'package:budget_mangement/widgets/chartBar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'ListTransection_Income.dart';
import 'chart_incom.dart';

class Income_card extends StatefulWidget {

  @override
  _Income_cardState createState() => _Income_cardState();
}

class _Income_cardState extends State<Income_card> {

  final List<IncomEntity> _userTransection=[
    IncomEntity(id:null, amount:0, dateexp:"2020-02-12", discr:"")
    // ];
//   ExpEntity(
//       id: null,
//       amount: ,
//       ref: ,
//       dateexp: ,
//       discr: ,
//       )
  ];
  bool showCard=false;
  List<IncomEntity> get _recentTransection{
    return _userTransection.where((element) {
      DateTime dt=DateTime.parse(element.dateexp);
      return dt.isAfter(
          DateTime.now().subtract(Duration(days: 7))
      );
    }).toList();
  }
  void addnewTransection(String title,int amount,String datechoosen,String Discription){
    final newTx=new IncomEntity(id:null, amount:amount, dateexp:datechoosen, discr:Discription);
    setState(() {
      _userTransection.add(newTx);
    });
  }
  void _startAddnewTransection(BuildContext ctx){

    showModalBottomSheet(context: ctx,isScrollControlled: true,
        builder: (_){
          return GestureDetector(
            onTap: (){},
            child:NewTransection(addnewTransection,2),
            behavior: HitTestBehavior.opaque,
          );
        });

  }
  Future<int> delet(int id) async {
    final database1 = await $Floordatabaseexp.databaseBuilder(
        'budget_managment_app').build();
    final tableis = database1.expdio;
    tableis.deleteIncoms(IncomEntity(id: id));
  }
  void deleteTransection(int id){
    setState(() {
      delet(id);
      _userTransection.removeWhere((element) {
        return element.id==id;
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    final mediaQuery=MediaQuery.of(context);
    final islandscap=mediaQuery.orientation==Orientation.landscape;
    final appbar=AppBar(
      title: Text('Income'),
    );
    final txt=Container(
      color: Colors.cyan[700],
      height: (mediaQuery.size.height-appbar.preferredSize.height-mediaQuery.padding.top)*0.7,
      child: ListTransection_Income(_userTransection,deleteTransection),
    );
    return WillPopScope(
      onWillPop:(){ Navigator.pop(context,true);},
      child: MaterialApp(

        title: 'Income',
        theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            accentColor:Colors.indigoAccent,
            //fontFamily: 'Quicksand',
            textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                // fontFamily: "OpenSans",
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),
              button: TextStyle(color: Colors.white),
              display1: TextStyle(color: Colors.red),
            ),
            appBarTheme: AppBarTheme(
                textTheme:ThemeData.light().textTheme.copyWith(
                    title: TextStyle(
                      //             fontFamily:'OpenSans' ,
                        fontSize:20 ,
                        fontWeight:FontWeight.bold
                    )
                )
            )
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(

          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                if(islandscap)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                      // Text('show Card') ,
                      Switch(
                          value: showCard,
                          onChanged: (val){
                            setState(() {
                              showCard=val;
                            });
                          })
                    ],
                  ),
                if(!islandscap)
                  Container(
                    color: Colors.cyan[500],
                    height: (mediaQuery.size.height-appbar.preferredSize.height-mediaQuery.padding.top)*0.3,
                    child: Chart_Income(_recentTransection),
                  ),
                if(!islandscap)
                  txt,
                if(islandscap)
                  showCard ?Container(
                    height: (mediaQuery.size.height-appbar.preferredSize.height-mediaQuery.padding.top)*1,
                    child: Chart_Income(_recentTransection),
                  ):txt
              ],
            ),
          ),
          floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(

            child:Icon(Icons.add) ,
            onPressed:()=> _startAddnewTransection(context),

          ),
          backgroundColor: Colors.cyan[500],
        ),
      ),
    );

  }
}
