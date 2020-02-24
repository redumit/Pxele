import 'package:expenses/Pages/SallaryEdit.dart';
import 'package:expenses/Pages/updateSalary.dart';
import 'package:expenses/databaseHelper/salaryHelper.dart';
import 'package:expenses/models/salary.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';

class Salary extends StatefulWidget {
  @override
  _SalaryState createState() => _SalaryState();
}

class _SalaryState extends State<Salary> {
  SalaryHelper salaryHelper = new SalaryHelper();
  List<SalaryModel> salaryList;
  int count = 0;

  List<PopupMenuEntry<dynamic>> pops = [];

  @override
  Widget build(BuildContext context) {
    if (salaryList == null) {
      salaryList = List<SalaryModel>();
      updateListView();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Salary Expenses"),
      ),
      body: ListView.builder(
          itemCount: count,
          itemBuilder: (BuildContext context, index) {
            return Column(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.person),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text(
                            salaryList[index].employeeName,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "5000",
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Jan 2/2020"),
                        SizedBox(
                          width: 15,
                        ),
                        Text("2:30 AM")
                      ],
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    UpdateSalary(salaryList[index])));
                          }),
                    )),
                Divider()
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () {
          debugPrint("Pressed");
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SallaryEdit()));
        },
      ),
    );
  }

  void updateListView() {
    final Future<Database> dbfuture = salaryHelper.initializeDatebase();
    dbfuture.then((database) {
      Future<List<SalaryModel>> salaryListFuture = salaryHelper.getSalaryMap();
      salaryListFuture.then((salarylist) {
        setState(() {
          this.salaryList = salarylist;
          this.count = salarylist.length;
        });
      });
    });
  }
}
