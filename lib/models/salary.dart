class SalaryModel {
  int id;
  String employeeName;
  int totalDay;
  int ratePerDay;
  String gender;
  String position;
  String date;
  int totalPayment;

  SalaryModel(this.id, this.employeeName, this.totalDay, this.ratePerDay,
      this.gender, this.position, this.date, this.totalPayment);

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['employeeName'] = employeeName;
    map['totalDay'] = totalDay;
    map['ratePerDay'] = ratePerDay;
    map['gender'] = gender;
    map['position'] = position;
    map['date'] = date;
    map['totalPayment'] = totalPayment;

    return map;
  }

  SalaryModel.fromMapToList(Map<String, dynamic> map) {
    id = map['id'];
    employeeName = map['employeeName'];
    totalDay = map['totalDay'];
    ratePerDay = map['ratePerDay'];
    gender = map['gender'];
    position = map['position'];
    date = map['date'];
    totalPayment = map['totalPayment'];
  }
}
