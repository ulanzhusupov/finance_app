import 'package:finance_manager/model/ObligatorPayment.dart';
import 'package:flutter/cupertino.dart';

class ObligatorFactory {
  ObligatorPayment obligatorPayment;

  ObligatorFactory({@required this.obligatorPayment});

  ObligatorPayment getObligator() {
    return obligatorPayment;
  }
}
