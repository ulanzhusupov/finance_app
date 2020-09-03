import "package:cloud_firestore/cloud_firestore.dart";
import "dart:core";
import 'package:date_utils/date_utils.dart';

import 'package:finance_manager/services/DBService.dart';

class FirebaseDBService extends DBService {
  final query =
        FirebaseFirestore.instance.collection('users');

  @override
  Future<void> initializeUserInfo(String uid, double salary, double forInvestment, double obligatorPayments, double forRainyDays, double balance) async {

    double dayBalance = (balance / 30);
    
    await query.doc(uid).set({
      'salary': salary,
      'forInvestment': forInvestment,
      'obligatorPayments': obligatorPayments,
      'forRainyDays': forRainyDays,
      'balance': balance,
      'balanceForEveryDay': dayBalance.floor(),
      'balanceForToday': dayBalance.floor(),
      'balanceForTomorrow': dayBalance.floor()
    });
  }

}