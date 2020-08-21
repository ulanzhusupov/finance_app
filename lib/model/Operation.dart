import 'package:flutter/cupertino.dart';

enum Type {
  food,
}

class Operation {
  DateTime date;
  String title;
  String subtitle;
  int summ;
  bool isProfit = false;

  Operation(
      {@required this.date,
      @required this.title,
      @required this.summ,
      @required this.isProfit,
      this.subtitle});
}
