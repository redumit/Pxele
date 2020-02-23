import 'package:expenses/Pages/expence.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatefulWidget {
  @override
  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  List<PopupMenuEntry> popups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of ExpenseList"),
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, index) {
            return Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.home),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Rent"),
                      Text("5000"),
                    ],
                  ),
                  subtitle: Text("Jan 2/2020"),
                  trailing: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: IconButton(icon: Icon(Icons.edit), onPressed: null),
                  ),
                ),
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
              .push(MaterialPageRoute(builder: (context) => Expences()));
        },
      ),
    );
  }
}
