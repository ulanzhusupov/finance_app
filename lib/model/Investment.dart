

class Investment {
  int percent;
  double summPerMonth;
  int _totalAmount;

  Investment({this.percent, this.summPerMonth,});

  void setTotalAmount(int newTotalAmount) {
    _totalAmount = newTotalAmount;
  }
}