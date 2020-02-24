import 'dart:io' as io;

import 'package:expenses/models/salary.dart';
import 'package:expenses/models/service.dart';
import 'package:expenses/models/userAccount.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _instance; //singlton database helper
  DatabaseHelper._createInstance(); // named constractor to create
  // instance of database helper
  String UserTable = "users";
  String loanTable = "loan";
  String salaryTable = "salary";
  String serviceTable = "service";
  String productTable = "product";
  String materialTable = "material";
  String otherExpTable = "otherExpense";

  factory DatabaseHelper() {
    if (_instance == null) {
      _instance = DatabaseHelper._createInstance();
    }
    return _instance;
  }
  static Database _db;
  static Database database;

  initDb() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "/expenses.db");
    _db = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Database get db {
    if (_db == null) {
      _db = initDb();
    }
    return _db;
  }

  void _onCreate(Database db, int version) async {
    // when creating the db, create the table
    //user table
    await db.execute(
        'CREATE TABLE $UserTable (id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'fullName TEXT, '
        'company TEXT, '
        'address TEXT , '
        'email TEXT, '
        'phone TEXT, '
        'password TEXT)');
    //service table
    await db.execute(
        "create table $serviceTable(id INTEGER PRIMARY KEY AUTOINCREMENT, serviceName TEXT, segment TEXT, laborCost INTEGER,"
        "expenses INTEGER, sellingPrice INTEGER, hourWork INTEGER, date DATE, time TEXT)");
    //sallary table
    await db.execute(
        "create table $salaryTable(id INTEGER PRIMARY KEY AUTOINCREMENT, employeeName TEXT, totalDay INTEGER, ratePerDay INTEGER,"
        "gender TEXT, position TEXT, date DATE, totalPayment INTEGER)");
  }

  //feach Operation: fetch users from the database
  Future<List<Map<String, dynamic>>> getUserMapList() async {
    Database db = await _db;
    User user;
    var result = await db.rawQuery("SELECT * FROM users WHERE 1");
    return result;
  }

  Future<List<User>> getUserList() async {
    var userMapList = await getUserMapList(); // Get 'Map List' from database
    int count =
        userMapList.length; // Count the number of map entries in db table

    List<User> userList = List<User>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      userList.add(User.fromMapObject(userMapList[i]));
    }

    return userList;
  }

  // Insert Operation: Insert user to the database
  Future<int> insertUser(User user) async {
    try {
      Database db = await _db;
      var result = await db.insert("users", user.toMap());
      return result;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Update Operation: Update a user and save it to database
  Future<int> updateUser(User user) async {
    Database db = await _db;
    var result = await db
        .update("users", user.toMap(), where: 'id=?', whereArgs: [user.id]);
    return result;
  }

  // Delete Operation: Delete a user object from database
  Future<int> deleteUser(int id) async {
    var db = await _db;
    int result = await db.delete("users", where: "id=?", whereArgs: [id]);
    return result;
  }
  // Get number of user object in database

//serive database functions
  Future<List<Map<String, dynamic>>> getServiceMapList() async {
    Database db = await _db;

    var result = await db.query(serviceTable, orderBy: 'id ASC');
    return result;
  }

  Future<int> updateService(ServiceModel serviceModel) async {
    var db = await _db;
    var result = await db.update(serviceTable, serviceModel.toMap(),
        where: 'id= ?', whereArgs: [serviceModel.id]);

    return result;
  }

  Future<int> insertService(ServiceModel serviceModel) async {
    var db = await _db;
//    var result = await db.insert(serviceTable, serviceModel.toMap());
    var result = await db.rawInsert(
        "insert into $serviceTable values( id =?, serviceName = ?, segment=?, expenses=?,"
        "sellingPrice=? ,hourWork =? , date=?, time=?)",
        [
          serviceModel.id,
          serviceModel.serviceName,
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
    var db = await _db;
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

  Future<List<Map<String, dynamic>>> getSalaryMapList() async {
    try {
      Database db = await _db;

      var result = await db.query(salaryTable, orderBy: 'id DESC');
      return result;
    } catch (e) {
      print(e);
    }
  }

  Future<int> updatSalary(SalaryModel salary) async {
    var db = await _db;
    var result = await db.update(salaryTable, salary.toMap(),
        where: 'id= ?', whereArgs: [salary.id]);
    return result;
  }

  Future<int> insertSalary(SalaryModel salary) async {
    var db = await _db;
//    var result = await db.insert(serviceTable, serviceModel.toMap());
    var result = await db.insert(salaryTable, salary.toMap());
//    debugPrint("the result of insert $result");
    print(await db.query(salaryTable));
    return result;
  }

  Future<int> deleteSalary(int id) async {
    var db = await _db;
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
