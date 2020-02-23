import 'dart:io' as io;

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
    await db.execute(
        'CREATE TABLE $UserTable (id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'fullName TEXT, '
        'company TEXT, '
        'address TEXT , '
        'email TEXT, '
        'phone TEXT, '
        'password TEXT)');
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
}
