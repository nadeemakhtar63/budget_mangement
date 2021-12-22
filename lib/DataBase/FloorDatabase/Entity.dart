

import 'package:budget_mangement/main.dart';
import 'package:floor/floor.dart';


@Entity(tableName:'exp')
class ExpEntity{
  final int id;
  final int amount;
  final String ref;
  final String dateexp;
  final String discr;

  ExpEntity({this.id, this.amount, this.ref, this.dateexp, this.discr});

}
@Entity(tableName:'income')
class IncomEntity{
  @PrimaryKey(autoGenerate:true)
  final int id;
  final int amount;
  final String ref;
  final String dateexp;
  final String discr;

  IncomEntity({this.id, this.amount, this.ref, this.dateexp, this.discr});

}