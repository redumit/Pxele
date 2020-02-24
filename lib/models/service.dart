class ServiceModel {
  int _id;

  String _serviceName;
  String _segment;
  double _laborCost;
  double _otherExpense;
  double _sellingPrice;
  int _hourWork;
  String _date;
  String _time;

  ServiceModel(
      this._id,
      this._serviceName,
      this._segment,
      this._laborCost,
      this._otherExpense,
      this._sellingPrice,
      this._hourWork,
      this._date,
      this._time);

  String get serviceName => _serviceName;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  set serviceName(String value) {
    _serviceName = value;
  }

  String get segment => _segment;

  set segment(String value) {
    _segment = value;
  }

  double get laborCost => _laborCost;

  set laborCost(double value) {
    _laborCost = value;
  }

  double get otherExpense => _otherExpense;

  set otherExpense(double value) {
    _otherExpense = value;
  }

  double get sellingPrice => _sellingPrice;

  set sellingPrice(double value) {
    _sellingPrice = value;
  }

  int get hourWork => _hourWork;

  set hourWork(int value) {
    _hourWork = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  String get time => _time;

  set time(String value) {
    _time = value;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = _id;
    map['serviceName'] = _serviceName;
    map['segment'] = _segment;
    map['laborCost'] = _laborCost;
    map['expenses'] = _otherExpense;
    map['sellingPrice'] = _sellingPrice;
    map['hourWork'] = _hourWork;
    map['date'] = _date;
    map['time'] = _time;
  }

  ServiceModel.fromMapObject(Map<String, dynamic> map) {
    _id = map['id'];
    _serviceName = map['serviceName'];
    _segment = map['segment'];
    _laborCost = map['laborCost'];
    _otherExpense = map['expenses'];
    _sellingPrice = map['sellingPrice'];
    _hourWork = map['hourWork'];
    _date = map['date'];
    _time = map['time'];
  }
}
