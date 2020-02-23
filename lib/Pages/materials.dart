import 'package:expenses/Pages/addMaterial.dart';
import 'package:flutter/material.dart';

class MaterialExpense extends StatefulWidget {
  @override
  _MaterialExpenseState createState() => _MaterialExpenseState();
}

class _MaterialExpenseState extends State<MaterialExpense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Material Expense"),
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, index) {
            return Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.computer),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Computer"),
                      Text("20,000 birr"),
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
              .push(MaterialPageRoute(builder: (context) => MaterialAdd()));
        },
      ),
    );
  }
}
