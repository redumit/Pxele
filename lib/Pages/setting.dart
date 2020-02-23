import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String lang = "English";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/Amete.jpg"),
                radius: 28,
              ),
              title: Text("Selam Hagos"),
              subtitle: Text("Manager"),
              trailing: IconButton(
                onPressed: () {
                  debugPrint("Edit Profile");
                },
                icon: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.edit),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: 304,
                width: 311,
                color: Colors.blue[50],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.language, color: Colors.blue),
                        title: Text(
                          "Language",
                          style: TextStyle(color: Colors.blue),
                        ),
                        trailing: DropdownButton(
                          value: lang,
                          onChanged: (item) {
                            setState(() {
                              debugPrint("Language Changed");
                              lang = item;
                            });
                          },
                          items: <String>['English', "ትግርኛ", "ኣማርኛ"]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.settings, color: Colors.blue),
                        title: Text(
                          "General",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.person, color: Colors.blue),
                        title: Text(
                          "Account",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.lock, color: Colors.blue),
                        title: Text(
                          "Privacy",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.help, color: Colors.blue),
                        title: Text(
                          "help",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
