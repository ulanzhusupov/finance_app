import 'package:finance_manager/model/ForARainyDay.dart';
import 'package:finance_manager/model/Investment.dart';
import 'package:finance_manager/model/Operation.dart';
import 'package:finance_manager/model/User.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  String uid;
  double salary;
  double balance;
  double forObligators;
  double forInvestment;
  double forRainyDays;
  double balanceForEveryDay;
  double balanceForToday;
  double balanceForTomorrow;
  double balanceForYesterday;

  UserProvider({
    this.salary,
    this.forObligators,
    this.forInvestment,
    this.forRainyDays,
    this.balanceForEveryDay
  });

  void setUid(String uid) {
    this.uid = uid;
    notifyListeners();
  }

  void setBalance(double balance) {
    this.balance = balance;
    notifyListeners();
  }

  void setSalary(double salary) {
    this.salary = salary;
    notifyListeners();
  }

  void setForObligators(double obligator) {
    this.forObligators = obligator;
    notifyListeners();
  }

  void setForInvestment(double investment) {
    this.forInvestment = investment;
    notifyListeners();
  }

  void setForRainyDays(double forRainyDays) {
    this.forRainyDays = forRainyDays;
    notifyListeners();
  }

  void setBalanceForEveryDay(double balanceForEveryDay) {
    this.balanceForEveryDay = balanceForEveryDay;
    notifyListeners();
  }

  void setBalanceForToday(double balanceForToday) {
    this.balanceForToday = balanceForToday;
    notifyListeners();
  }

  void setBalanceForTomorrow(double balanceForTomorrow) {
    this.balanceForTomorrow = balanceForTomorrow;
    notifyListeners();
  }

  void setBalanceForYesterday(double balanceForYesterday) {
    this.balanceForYesterday = balanceForYesterday;
    notifyListeners();
  }
}
