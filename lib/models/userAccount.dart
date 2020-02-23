class User {
  int _id;
  String _fullName;
  String _company;
  String _address;
  String _email;
  String _phone;
  String _password;

  set id(int value) {
    _id = value;
  }

  User(
    this._id,
    this._fullName,
    this._company,
    this._address,
    this._email,
    this._phone,
    this._password,
  );
  int get id => _id;
  String get fullName => _fullName;

  String get company => _company;

  String get address => _address;

  String get email => _email;

  String get phone => _phone;

  String get password => _password;

  set fullName(String value) {
    if (value.length >= 3) {
      _fullName = value;
    }
  }

  set password(String value) {
    _password = value;
  }

  set phone(String value) {
    _phone = value;
  }

  set email(String value) {
    _email = value;
  }

  set address(String value) {
    _address = value;
  }

  set company(String value) {
    _company = value;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = _id;
    map["fullName"] = _fullName;
    map["company"] = _company;
    map["address"] = _address;
    map["email"] = _email;
    map["phone"] = _phone;
    map["password"] = _password;

    return map;
  }

  User.fromMapObject(Map<String, dynamic> map) {
    _id = map["id"];
    _fullName = map["fullName"];
    _company = map["company"];
    _address = map["address"];
    _email = map["email"];
    _phone = map["email"];
    _password = map["password"];
  }
}
