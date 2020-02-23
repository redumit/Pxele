import 'dart:io';

import 'package:expenses/models/service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ServiceHelper {
  static ServiceHelper _helper;
  static Database _database;

  String serviceTable = 'service_table';

  ServiceHelper._createInstance();
  factory ServiceHelper() {
    if (_helper == null) {
      _helper = ServiceHelper._createInstance();
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
        "create table $serviceTable(id INTEGER PRIMARY KEY AUTOINCREMENT, itemName TEXT, segment TEXT, laborCost INTEGER,"
        "expenses INTEGER, sellingPrice INTEGER, hourWork INTEGER, date DATE, time TEXT)");
  }

  Future<List<Map<String, dynamic>>> getServiceMapList() async {
    Database db = await this.database;

    var result = await db.query(serviceTable, orderBy: 'id ASC');
    return result;
  }

  Future<int> updateService(ServiceModel serviceModel) async {
    var db = await this.database;
    var result = await db.update(serviceTable, serviceModel.toMap(),
        where: 'id= ?', whereArgs: [serviceModel.id]);
    return result;
  }

  Future<int> insertService(ServiceModel serviceModel) async {
    var db = await this.database;
//    var result = await db.insert(serviceTable, serviceModel.toMap());
    var result = await db.rawInsert(
        "insert into $serviceTable values( id =?, itemName = ?, segment=?, expenses=?,"
        "sellingPrice=? ,hourWork =? , date=?, time=?)",
        [
          serviceModel.id,
          serviceModel.itemName,
          serviceModel.segment,
          serviceModel.otherExpense,
          serviceModel.sellingPrice,
          serviceModel.hourWork,
          serviceModel.date,
          serviceModel.time
        ]);
//    debugPrint("the result of insert $result");
    print(await db.query(serviceTable));
    return result;
  }

  Future<int> deleteService(int id) async {
    var db = await this.database;
    int result = await db.delete(serviceTable, where: 'id=?', whereArgs: [id]);
    return result;
  }

  Future<List<ServiceModel>> getServiceList() async {
    var serviceMapList = await getServiceMapList();
    int count = serviceMapList.length;

    List<ServiceModel> serviceList = List<ServiceModel>();
    for (int i = 0; i < count; i++) {
      serviceList.add(ServiceModel.fromMapObject(serviceMapList[i]));
    }
    return serviceList;
  }
}
