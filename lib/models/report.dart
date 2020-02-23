class Report {
  int _id;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String _type;
  double _totalSale;
  double _expenses;
  double _profit;
  double _loss;

  String get type => _type;

  set type(String value) {
    _type = value;
  }

  double get totalSale => _totalSale;

  double get loss => _loss;

  set loss(double value) {
    _loss = value;
  }

  double get profit => _profit;

  set profit(double value) {
    _profit = value;
  }

  double get expenses => _expenses;

  set expenses(double value) {
    _expenses = value;
  }

  set totalSale(double value) {
    _totalSale = value;
  }

  Map<String, dynamic> toMap(Report report) {
    var map = Map<String, dynamic>();
    map["type"] = type;
    map["totalSale"] = totalSale;
    map["expense"] = expenses;
    map["profit"] = profit;
    map["loss"] = loss;
    return map;
  }

  Report.fromMapToList(Map<String, dynamic> map) {
    type = map["type"];
    totalSale = map["totalSale"];
    expenses = map["expense"];
    profit = map["profit"];
    loss = map["loss"];
  }
}
