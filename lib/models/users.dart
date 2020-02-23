import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  // Open the database and store the reference.
  final Future<Database> database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'expense.db'),
// When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
// Run the CREATE TABLE statement on the database.
      return db.execute(
        "CREATE TABLE users(id INTEGER PRIMARY KEY, fullName TEXT, company TEXT, address TEXT, email TEXT, phone TEXT, password TEXT)",
      );
    },
// Set the version. This executes the onCreate function and provides a
// path to perform database upgrades and downgrades.
    version: 1,
  );

  // function that insert users to the database

  Future<void> insertUser(Users user) async {
    //get reference to the database
    final Database db = await database;
    //insert the user into the correct table
    //in this case replace any previous data
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Users>> users() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('users');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Users(
        maps[i]['id'],
        maps[i]['fullName'],
        maps[i]['company'],
        maps[i]['address'],
        maps[i]['email'],
        maps[i]['phone'],
        maps[i]['password'],
      );
    });
  }

  Future<void> updateUser(Users user) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'users',
      user.toMap(),
      // Ensure that the Dog has a matching id.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [user.id],
    );
  }

  Future<void> deleteUser(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'users',
      // Use a `where` clause to delete a specific dog.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  //Create a user and add it to the users table
  final me = Users(0, "Redae Berihu", "pexel", "Mekelle", "redu@mit.com",
      "0942255290", "password");

  await insertUser(me);

  // Print the list of dogs (only me for now).
  print(await users());

  // Print me's updated information.
  print(await users());

  // Delete Fido from the database.
  await deleteUser(me.id);

  // Print the list of dogs (empty).
  print(await users());
}

class Users {
  final int id;
  final String fullName;
  final String company;
  final String address;
  final String email;
  final String phone;
  final String password;

  Users(
    this.id,
    this.fullName,
    this.company,
    this.address,
    this.email,
    this.phone,
    this.password,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'company': company,
      'address': address,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }

  // Implement toString to make it easier to see information about
  // each user when using the print statement.
  @override
  String toString() {
    return 'User{id: $id, fullName: $fullName,company: $company, address: $address, email: $email, phone: $phone, password: $password}';
  }
}
