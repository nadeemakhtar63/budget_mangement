
import 'package:budget_mangement/DataBase/FloorDatabase/DatabaseCreate.dart';
import 'package:budget_mangement/DataBase/FloorDatabase/Entity.dart';
import 'package:budget_mangement/ModleClass/Transection.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class ListTransection  extends StatelessWidget {
 List<ExpEntity> transection;
 final Function deleteTx;


 ListTransection(this.transection, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    final dating=DateTime.now();
    final formating=DateFormat('MM');
    String d=formating.format(dating);
    final cchk='%-$d-%';
  //  String completedate=DateTime(dating.year,dating.month-1,dating.day).toString();

   // String currentMonth=
    return transection.isEmpty ? LayoutBuilder(
        builder: (ctx,constraint){
          return Column(

            children: <Widget>[
              Text("No transection Add yet!",
              style: Theme.of(context).textTheme.title,),
              SizedBox(
                height: 30,
              ),
              Container(
               
                height: constraint.maxHeight*0.6,
                child: Image.asset("waiting.png",fit: BoxFit.cover,),
              )
            ],
          );
        }) :
       FutureBuilder<databaseexp>(
         future:$Floordatabaseexp.databaseBuilder('budget_managment_app').build(),
         builder: (context,build){
         if(!build.hasData)
            {
              return CircularProgressIndicator();
            }
         else
           {

          return StreamBuilder<List<ExpEntity>>(
             stream: (build.data.expdio.expPrevsMonths(cchk)).asStream(),
             builder: (BuildContext conx,AsyncSnapshot<List<ExpEntity>> snapshot) {
               if (!snapshot.hasData) {
           return CircularProgressIndicator();
               }
               else
                 {
                 var ListAllExpenses = snapshot.data as List<ExpEntity>;
                 return ListView.builder(
                   itemCount: ListAllExpenses != null ? ListAllExpenses.length : 0,
                   itemBuilder: (context, indix) {
                     print("all daata: $ListAllExpenses");
                         // transection=ListAllExpenses;
                     return Card(
                       color: Colors.cyan[100],
                       elevation: 10,
                       child: Row(
                         children: <Widget>[
                           Container(
                             margin: EdgeInsets.symmetric(
                               vertical: 10,
                               horizontal: 15,
                             ),
                             decoration: BoxDecoration(
                               border: Border.all(
                                   color: Theme
                                       .of(context)
                                       .primaryColor,
                                   width: 2
                               ),

                             ),
                             padding: EdgeInsets.all(10),
                             child: Text(
                               '${ListAllExpenses[indix].amount.toStringAsFixed(2)}',
                               style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   fontSize: 20,
                                   color: Theme
                                       .of(context)
                                       .primaryColor
                               ),

                             ),
                           ),
                           Expanded(
                               child: Column(
                                 children: <Widget>[
                                   Text('${ListAllExpenses[indix].ref}',
                                     style: Theme
                                         .of(context)
                                         .textTheme
                                         .title,
                                   ),
                                   // Text(DateFormat.yMMMd().format(
                                   //     transection[indix].date),
                                   Text('${ListAllExpenses[indix].dateexp}',
                                     style: TextStyle(color: Colors.grey),

                                   )
                                 ],
                               )),
                           IconButton(
                               icon: Icon(Icons.delete, color: Colors.pink,),
                               onPressed: () {
                 showDialog(
                 context: context, builder: (context) {
                 return  AlertDialog(
                 shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius
                     .circular(20)),
                 elevation: 16,
                 title:
                 Text("Are You Sure?", style: TextStyle(color: Colors.blue,)),
                 actions: [
                 FlatButton(onPressed: () {
                 deleteTx(
                 ListAllExpenses[indix].id,
                 );
                 Navigator.pop(context);
                 },
                 child: Text("YES", style: TextStyle(fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold))),
                 FlatButton(
                 onPressed: ()=>Navigator.pop(context),
                 child: Text("Cancel"),
                 )

                 ]

                 );
                 });



                               })
                         ],
                       ),
                     );
                   },
                 );
               }
             } );
                  }
             },
           );



    // ListView.builder(
    //     itemBuilder: (ctx,indix){
    //       return Card(
    //         elevation: 10,
    //         child: Row(
    //           children: <Widget>[
    //             Container(
    //               margin: EdgeInsets.symmetric(
    //                 vertical: 10,
    //                 horizontal: 15,
    //               ),
    //               decoration: BoxDecoration(
    //                 border: Border.all(
    //                   color: Theme.of(context).primaryColor,
    //                   width: 2
    //                 ),
    //
    //               ),
    //               padding: EdgeInsets.all(10),
    //               child: Text('${transection[indix].amount.toStringAsFixed(2)}',
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 20,
    //                   color: Theme.of(context).primaryColor
    //                 ),
    //
    //               ),
    //             ),
    //             Expanded(
    //                 child: Column(
    //                   children: <Widget>[
    //                     Text('${transection[indix].title}',
    //                       style: Theme.of(context).textTheme.title,
    //                       ),
    //                     Text(DateFormat.yMMMd().format(transection[indix].date),
    //                       style: TextStyle(color: Colors.grey),
    //
    //                     )
    //                   ],
    //                 )),
    //             IconButton(
    //                 icon: Icon(Icons.delete,color: Colors.pink,), onPressed: (){deleteTx(transection[indix].id);})
    //           ],
    //         ),
    //       );
    //
    //     },
    //     itemCount: transection.length,);
  }
}
