//import 'dart:io';
//
//import 'package:path_provider/path_provider.dart';
//import 'package:sqflite/sqflite.dart';
//
//class ReportHelper {
//  static ReportHelper _helper;
//  static Database _database;
//
//  String serviceTable = 'report_table';
//
//  ReportHelper._createInstance();
//  factory ReportHelper() {
//    if (_helper == null) {
//      _helper = ReportHelper._createInstance();
//    }
//    return _helper;
//  }
//
//  Future<Database> get database async {
//    if (_database == null) {
//      _database = await initializeDatebase();
//    }
//    return _database;
//  }
//
//  Future<Database> initializeDatebase() async {
//    Directory directiry = await getApplicationDocumentsDirectory();
//    String path = directiry.path + 'expenses.db';
//
//    var serviceDatabase =
//        await openDatabase(path, version: 1, onCreate: _createDb);
//    return serviceDatabase;
//  }
//
//  void _createDb(Database db, int newVersion) async {
//    await db.execute(
//        "create table $serviceTable(id INTEGER PRIMARY KEY AUTOINCREMENT, type TEXT, totalSale double, expense double, profit double, loss double)");
//  }
//
//  Future<List<Map<String, dynamic>>> getReportMapList() async {
//    Database db = await this.database;
//
//    var result = await db.query(serviceTable, orderBy: 'id ASC');
//    return result;
//  }
//
//  Future<int> updateService(ServiceModel serviceModel) async {
//    var db = await this.database;
//    var result = await db.update(serviceTable, serviceModel.toMap(),
//        where: 'id= ?', whereArgs: [serviceModel.id]);
//    return result;
//  }
//
//  Future<int> deleteService(int id) async {
//    var db = await this.database;
//    int result = await db.delete(serviceTable, where: 'id=?', whereArgs: [id]);
//    return result;
//  }
//
//  Future<List<ServiceModel>> getServiceList() async {
//    var serviceMapList = await getServiceMapList();
//    int count = serviceMapList.length;
//
//    List<ServiceModel> serviceList = List<ServiceModel>();
//    for (int i = 0; i < count; i++) {
//      serviceList.add(ServiceModel.fromMapObject(serviceMapList[i]));
//    }
//    return serviceList;
//  }
//}
