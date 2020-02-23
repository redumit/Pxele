import 'package:expenses/Pages/HomePage.dart';
import 'package:expenses/Pages/userAccount.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense App',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Segoe UI'),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
