import 'package:expenses/Pages/addLoan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loan extends StatefulWidget {
  @override
  _LoanState createState() => _LoanState();
}

class _LoanState extends State<Loan> {
  List<PopupMenuEntry> popups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Loan"),
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, index) {
            return Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.monetization_on),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Dedebit"),
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
              .push(MaterialPageRoute(builder: (context) => LoanAdd()));
        },
      ),
    );
  }
}
