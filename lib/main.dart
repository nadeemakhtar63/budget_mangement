import 'dart:convert';

import 'package:budget_mangement/DashBoard.dart';
import 'package:budget_mangement/Design/Home.dart';
import 'package:budget_mangement/Design/splash_screen.dart';
import 'package:budget_mangement/Expense/Expences.dart';
import 'package:budget_mangement/Expense/Expense_Month_show.dart';
import 'package:budget_mangement/Expense/Expense_show.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DataBase/:DatabaseCreate.dart';
import 'Authentication/Login.dart';
import 'DataBase/FloorDatabase/DatabaseCreate.dart';
import 'Splash_screen.dart';

Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
 // Firebase.initializeApp();
  final budgetAppDatabase=await $Floordatabaseexp.databaseBuilder('budget_managment_app').build();
  final expdeo=budgetAppDatabase.expdio;
  runApp(
          MaterialApp(

            debugShowCheckedModeBanner: false,

    home: AnimatedSplashScreen(),
      ));

}

