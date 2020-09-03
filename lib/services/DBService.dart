import "dart:async";

abstract class DBService {
  Future<void> initializeUserInfo(String uid, double salary, double forInvestment, double obligatorPayments, double forRainyDays, double balance);

}