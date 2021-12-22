
import 'dart:async';

import 'package:budget_mangement/DataBase/FloorDatabase/Entity.dart';
import 'package:budget_mangement/DataBase/FloorDatabase/budgetDAO.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';
part 'DatabaseCreate.g.dart';
@Database(version: 1, entities: [ExpEntity,IncomEntity])
abstract class databaseexp extends FloorDatabase
{
  budgetDao get expdio;
}