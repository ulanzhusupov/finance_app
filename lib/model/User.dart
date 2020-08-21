import 'dart:core';

import 'package:finance_manager/model/CurrentFreeBalance.dart';
import 'package:finance_manager/model/ForARainyDay.dart';
import 'package:finance_manager/model/Investment.dart';
import 'package:finance_manager/model/Operation.dart';
import 'package:flutter/cupertino.dart';
import "package:uuid/uuid.dart";

class User extends ChangeNotifier {
  
  User({@required this.uuid, @required this.name, @required this.email});

  final Uuid uuid;
  String name;
  String email;

  int _salary;
  List<Operation> _operations;
  int _summForToday;

  Map<String, dynamic> _obligatoryPayments;
  Investment _investment;
  ForARainyDay _forARainyDay;
  CurrentFreeBalance _currentFreeBalance;


  // Email encapsulation
  String getEmail() => email;

  void setEmail(String email) {
    email = email;
  }

  //Salary encapsulation
  set setSalary(int newSalary) {
    _salary = newSalary;
  }

  int getSalary() {
    return _salary;
  }

  //SummForToday encapsulation
  void setSummForToday(int newSummForToday) {
    _summForToday = newSummForToday;
  }

  int getSummForToday() {
    return _summForToday;
  }

  //Operations encapsulations
  List<Operation> getOperations() {
    return _operations;
  }

  void addOperation(Operation operation) {
    _operations.add(operation);
  }

  //ObligatoryPayments encapsulation
  Map<String, dynamic>  getObligatoryPayments() => _obligatoryPayments;

  void setObligatoryPayments(Map<String, dynamic> obligatoryPayments) {
    _obligatoryPayments = obligatoryPayments;
  }

  //Investment encapsulation
  Investment getInvestment() => _investment;

  void setInvestment(Investment investment) {
    _investment = investment;
  }

  //For a rainy day Encapsulation
  ForARainyDay getForARainyDay() => _forARainyDay;

  void setForARainyDay(ForARainyDay forARainyDay) {
    _forARainyDay = forARainyDay;
  }

  //Current balance for use encapsulation
  CurrentFreeBalance getCurrentFreeBalance() => _currentFreeBalance;

  void setCurrentFreeBalance(CurrentFreeBalance currentFreeBalance) {
    _currentFreeBalance = currentFreeBalance;
  }
}