import 'package:finance_manager/model/ForARainyDay.dart';
import 'package:finance_manager/model/Investment.dart';
import 'package:finance_manager/model/Operation.dart';
import 'package:finance_manager/model/User.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  User currentUser;
  
  void addOperation(Operation operation) {
    currentUser.addOperation(operation);
  }

  void setInvesting(int percent) {
    int currentUserSalary = currentUser.getSalary();
    double summPermonth = currentUserSalary * (percent/100);
    final investing = Investment(percent: percent, summPerMonth: summPermonth);
    currentUser.setInvestment(investing);
  }

  void setObligators(String payment, int summ) {
    Map<String, dynamic> currentPayments = currentUser.getObligatoryPayments();

    currentPayments.putIfAbsent(payment, () => summ);

    currentUser.setObligatoryPayments(currentPayments);
  }

  void setForARainyDay(int percent) {
    final investings = currentUser.getInvestment();
    final obligatoryPayments = currentUser.getObligatoryPayments();

    ForARainyDay forARainyDay = ForARainyDay(percent: percent, );
    currentUser.setForARainyDay(forARainyDay);
  }
}