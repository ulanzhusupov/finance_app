import "package:cloud_firestore/cloud_firestore.dart";
import "dart:core";
import 'package:date_utils/date_utils.dart';

import 'package:finance_manager/services/DBService.dart';

class FirebaseDBService extends DBService {
  final query =
        FirebaseFirestore.instance.collection('users');

  @override
  Future<void> initializeUserInfo(double salary, double forInvestment, double obligatorPayments, double forRainyDays, double balance) {
    var currentDate = DateTime.now();
    var thisMonth = Utils.lastDayOfMonth(currentDate);
    print("### days"+thisMonth.toString());
    double dayBalance = (balance / 30);
    
    // query.add({
    //   'salary': salary,
    //   'forInvestment': forInvestment,
    //   'obligatorPayments': obligatorPayments,
    //   'forRainyDays': forRainyDays,
    //   'balance': balance,
    //   'balanceForEveryDay': 0.0,
    //   'balanceForToday': 
    // });
  }

}