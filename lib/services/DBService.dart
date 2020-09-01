import "dart:async";

abstract class DBService {
  Future<void> initializeUserInfo(double salary, double forInvestment, double obligatorPayments, double forRainyDays, double balance);

}