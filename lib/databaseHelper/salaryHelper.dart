import 'dart:io';

import 'package:expenses/models/salary.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SalaryHelper {
  static SalaryHelper _helper;
  static Database _database;

  String salaryTable = 'salray_table';

  SalaryHelper._createInstance();
  factory SalaryHelper() {
    if (_helper == null) {
      _helper = SalaryHelper._createInstance();
    }
    return _helper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatebase();
    }
    return _database;
  }

  Future<Database> initializeDatebase() async {
    Directory directiry = await getApplicationDocumentsDirectory();
    String path = directiry.path + '/expenses.db';

    var serviceDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return serviceDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "create table $salaryTable(id INTEGER PRIMARY KEY AUTOINCREMENT, empleyeeName TEXT, totalDay INTEGER, ratePerDay INTEGER,"
        "gender TEXT, position TEXT, date DATE)");
  }

  Future<List<Map<String, dynamic>>> getSalaryMapList() async {
    try {
      Database db = await this.database;

      var result = await db.query(salaryTable, orderBy: 'id ASC');
      return result;
    } catch (e) {
      print(e);
    }
  }

  Future<int> updatSalary(SalaryModel salary) async {
    var db = await this.database;
    var result = await db.update(salaryTable, salary.toMap(),
        where: 'id= ?', whereArgs: [salary.id]);
    return result;
  }

  Future<int> insertSalary(SalaryModel salary) async {
    var db = await this.database;
//    var result = await db.insert(serviceTable, serviceModel.toMap());
    var result = await db.insert(salaryTable, salary.toMap());
//    debugPrint("the result of insert $result");
    print(await db.query(salaryTable));
    return result;
  }

  Future<int> deleteSalary(int id) async {
    var db = await this.database;
    int result = await db.delete(salaryTable, where: 'id=?', whereArgs: [id]);
    return result;
  }

  Future<List<SalaryModel>> getSalaryMap() async {
    var salaryMapList = await getSalaryMapList();
    int count = salaryMapList.length;

    List<SalaryModel> salaryList = List<SalaryModel>();
    for (int i = 0; i < count; i++) {
      salaryList.add(SalaryModel.fromMapToList(salaryMapList[i]));
    }
    return salaryList;
  }
}
