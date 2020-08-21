class CurrentFreeBalance {
  int _freeSummPerMonth;
  int _totalFreeAmount;

  CurrentFreeBalance({int freeSummPerMonth}) : _freeSummPerMonth = freeSummPerMonth;

  int get getFreeSummPerMonth => _freeSummPerMonth;

  set setFreeSummPerMonth(int freeSummPerMonth) {
    _freeSummPerMonth = freeSummPerMonth;
  }

  int get getTotalFreeAmount => _totalFreeAmount;

  set setTotalFreeAmount(int totalFreeAmount) {
    _totalFreeAmount = totalFreeAmount;
  }

}