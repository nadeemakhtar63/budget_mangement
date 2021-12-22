import 'dart:ffi';

import 'package:budget_mangement/DataBase/FloorDatabase/DatabaseCreate.dart';
import 'package:budget_mangement/DataBase/FloorDatabase/Entity.dart';
import 'package:budget_mangement/DataBase/FloorDatabase/budgetDAO.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransection  extends StatefulWidget {
  final Function addtxt;
  final int i;

  NewTransection(this.addtxt,this.i);

  @override
  _NewTransectionState createState() => _NewTransectionState();
}

class _NewTransectionState extends State<NewTransection> {
  final _titileControl=TextEditingController();
  final _amountControl=TextEditingController();
  final _description=TextEditingController();
  DateTime _selectedDateTime;
bool _titlevalidate=false;
  bool _amountvalidate=false;
  bool _descripValidate=false;
  void _submitteDate()
  {
    if(_amountControl.text.isEmpty)
      {
        return ;
      }
    final enterdTitle=_titileControl.text;
    final enterdAmount=int.parse(_amountControl.text);
    final endiscription=_description.text;
    final datechoose=_selectedDateTime.toString();
  if(enterdTitle.isEmpty ||enterdAmount<=0 || _selectedDateTime==null || endiscription.isEmpty)
    {
      return;
    }
  widget.addtxt(

    enterdTitle,
      enterdAmount,
    datechoose,
    endiscription,
  );
  Navigator.of(context).pop();
  }
  void presentDatePicker(){
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime.now()).then((pickedDate)
        {
          if(pickedDate==null){
            return 'Select date';
          }
          setState(() {
            _selectedDateTime=pickedDate;
          });
        }
        );
}
budgetDao dio;
    Future floordatasave ()
    async {
      final budgetAppDatabase = await $Floordatabaseexp.databaseBuilder(
          'budget_managment_app').build();
      var dateformat = DateFormat('yyyy-MM-dd');
      String dating = dateformat.format(_selectedDateTime);

      dio = budgetAppDatabase.expdio;
      final enterdTitle = _titileControl.text;
      final enterdAmount = int.parse(_amountControl.text);
      final endiscription = _description.text;
      // final dat=_selectedDateTime.toString();
      if (enterdTitle.isEmpty || enterdAmount <= 0 ||
          _selectedDateTime == null || endiscription.isEmpty) {
        return;
      }

      if (widget.i==1) {
        final datasave = ExpEntity(

          id:null,
          amount:enterdAmount,
         ref: enterdTitle,
          dateexp:dating,
         discr: endiscription,

        );
        dio.insertExp(datasave);
      }
      else if (widget.i==2) {
        final datasave = IncomEntity(
          id:null,
          amount:enterdAmount,
          ref: enterdTitle,
          dateexp:dating,
          discr: endiscription,
        );
        dio.insertIncom(datasave);
      }
    }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:(){ Navigator.pop(context,true);},
      child: SingleChildScrollView(
        child: Card(
          color: Colors.cyan[100],
          elevation: 5,
          child: Container(
            padding: EdgeInsets.only(
              top: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom+10,
              left: 10,
              right: 10
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextField(
                  maxLength: 45,
                  decoration: InputDecoration(
                    labelText: 'Title',

                    errorText: _titlevalidate?'Title Can not be empty':null
                  ),


                  controller: _titileControl,
                    keyboardType: TextInputType.text,

                ),
                TextField(
                  maxLength: 11,
                  decoration: InputDecoration(

                    labelText: "Amount",
                      errorText: _amountvalidate?'Amount Can not be empty':null
                  ),

                  controller: _amountControl,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onSubmitted: (_)=>presentDatePicker(),
                ),
                TextField(
                  maxLength: 200,
                  maxLines: 4,
                  decoration: InputDecoration(labelText: 'Description', errorText: _descripValidate?'Description Can not be empty':null,),
                  controller: _description,


                  onSubmitted: (_) =>presentDatePicker(),
                  //   onChanged: (val) => amountInput = val,
                ),
                Container(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                            _selectedDateTime==null?"No Date Choosen":'Picked Date :${DateFormat.yMd().format(_selectedDateTime)}'
                          )),
                      FlatButton(
                          textColor: Theme.of(context).primaryColor,
                          onPressed: presentDatePicker,
                          child: Text(
                            "Choose Date",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                      ),


                    ],
                  ),
                ),
                RaisedButton(
                  onPressed:() {
                    setState(() {
                      _titileControl.text.isEmpty ? _titlevalidate = true : _titlevalidate = false;
                      _amountControl.text.isEmpty ? _amountvalidate = true : _amountvalidate = false;
                      _description.text.isEmpty ? _descripValidate = true : _descripValidate = false;
                    });
                    _submitteDate();
                    floordatasave();

                  },
                    child: Text("Add"),

      color: Colors.blue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
