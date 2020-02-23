import 'package:expenses/Pages/SallaryEdit.dart';
import 'package:flutter/material.dart';

class Salary extends StatefulWidget {
  @override
  _SalaryState createState() => _SalaryState();
}

class _SalaryState extends State<Salary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Salary Expenses"),
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, index) {
            return Column(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.person),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Hagos Berihu"),
                        Text("5000"),
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
                      child:
                          IconButton(icon: Icon(Icons.edit), onPressed: null),
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
}
