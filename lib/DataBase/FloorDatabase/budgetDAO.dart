


import 'dart:math';

import 'package:budget_mangement/Sellery/Incom.dart';
import 'package:floor/floor.dart';

import 'Entity.dart';

@dao
abstract class budgetDao{

 //Income Table Queries
  @insert
  Future<void> insertIncom(IncomEntity incomEntity);
  @Query('select * from income where dateexp Like :choosedate')
  Future<List<IncomEntity>> incomePrevsMonths(String choosedate);
  @delete
  Future<int> deleteIncoms(IncomEntity incomEntity);

  //Expense table queries

  @insert
  Future<void> insertExp(ExpEntity expEntity);
  @Query('SELECT * FROM exp')
  Future<List<ExpEntity>> expgetonDate();

  @Query('select * from exp where dateexp =:d1')
  Future<List<ExpEntity>> selectMonth(int id);
  @delete
  Future<int> deleteExpense(ExpEntity expentity);
    @Query('Delete from exp where id=:id ')
    Stream<ExpEntity> deleteidcard(int id);

  @Query('select * from exp where dateexp Like :choosedate')
  Future<List<ExpEntity>> expPrevsMonths(String choosedate);

  // @Query("select strftime(dateexp) as dateexp from exp")
  @Query(" SELECT * from exp where ADDDATE(dateexp,MONTH(02))")
  Future<List<ExpEntity>> expMoth();
}