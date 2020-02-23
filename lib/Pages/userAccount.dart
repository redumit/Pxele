import 'package:expenses/Pages/HomePage.dart';
import 'package:expenses/databaseHelper/databaseHelper.dart';
import 'package:expenses/models/userAccount.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';

class UserAccount extends StatefulWidget {
  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  //database
  DatabaseHelper databaseHelper = DatabaseHelper();
  User userAccount;
  List<User> users;

  //controller for input forms
  final _fullName = TextEditingController();
  final _companyName = TextEditingController();
  final _address = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _photo = TextEditingController();
  final _password = TextEditingController();

  String fullName, company, address, email, phone, password;

  //form key
  final _userAccountForm = GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
//  File _profile ;
//    Future getImage() async{
//      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//      setState(() {
//        _profile = image;
//      });
//    }
  var _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Form(
                  key: _userAccountForm,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      //title
                      Container(
                        margin: EdgeInsets.only(top: 37),
                        alignment: Alignment.topCenter,
                        child: Text(
                          "User Account",
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontFamily: 'Segoe UI',
                              fontSize: 20),
                        ),
                      ),
                      //fullname
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 49.0, top: 30),
                          child: Text(
                            "Full Name",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 36.0, top: 7),
                            child: Container(
                              width: viewportConstraints.maxWidth * 0.65,
                              height: 44,
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    fullName = value;
                                  });
                                },
                                controller: _fullName,
                                keyboardType: TextInputType.text,
                                textAlign: TextAlign.left,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Name',
                                    hasFloatingPlaceholder: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)))),
                              ),
                            )),
                      ),
                      //company
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 49.0, top: 15),
                          child: Text(
                            "Company",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 36.0, top: 7),
                            child: Container(
                              width: viewportConstraints.maxWidth * 0.65,
                              height: 44,
                              child: TextFormField(
                                onChanged: (value) {
                                  company = value;
                                },
                                controller: _companyName,
                                keyboardType: TextInputType.text,
                                textAlign: TextAlign.left,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Company',
                                    hasFloatingPlaceholder: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)))),
                              ),
                            )),
                      ),
                      //address
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 49.0, top: 15),
                          child: Text(
                            "Address",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 36.0, top: 7),
                            child: Container(
                              width: viewportConstraints.maxWidth * 0.65,
                              height: 44,
                              child: TextFormField(
                                onChanged: (value) {
                                  address = value;
                                },
                                controller: _address,
                                keyboardType: TextInputType.text,
                                textAlign: TextAlign.left,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Address',
                                    hasFloatingPlaceholder: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)))),
                              ),
                            )),
                      ),
                      //email && phone
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5.0, top: 15),
                                  child: Text(
                                    "Email",
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 36.0, top: 7),
                                    child: Container(
                                      width:
                                          viewportConstraints.maxWidth * 0.45,
                                      height: 44,
                                      child: TextFormField(
                                        onChanged: (value) {
                                          email = value;
                                        },
                                        controller: _email,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        textAlign: TextAlign.left,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Email',
                                            hasFloatingPlaceholder: true,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)))),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 15),
                                  child: Text(
                                    "Phone",
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, top: 7),
                                    child: Container(
                                      width:
                                          viewportConstraints.maxWidth * 0.40,
                                      height: 44,
                                      child: TextFormField(
                                        onChanged: (value) {
                                          phone = value;
                                        },
                                        controller: _phone,
                                        keyboardType: TextInputType.phone,
                                        textAlign: TextAlign.left,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Phone',
                                            hasFloatingPlaceholder: true,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)))),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                      //password
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 49.0, top: 15),
                          child: Text(
                            "Pssword",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 36.0, top: 7),
                                child: Container(
                                  width: viewportConstraints.maxWidth * 0.65,
                                  height: 44,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      password = value;
                                    },
                                    controller: _password,
                                    obscureText: _obscureText,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(),
                                    textAlign: TextAlign.left,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Password',
                                        hasFloatingPlaceholder: true,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)))),
                                  ),
                                )),
                          ),
                          new FlatButton(
                              onPressed: _toggle,
                              child: new Text(_obscureText ? "Show" : "Hide")),
                        ],
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 36.0, top: 19),
                          child: CircleAvatar(
                            radius: 48,
                            backgroundImage: AssetImage("assets/Amete.jpg"),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: FlatButton(
                                onPressed: () {
                                  debugPrint("Button Pressed");
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.deepPurple,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 13.0),
                          child: RaisedButton(
                            elevation: 8,
                            onPressed: () {
                              userAccount = User(null, fullName, company,
                                  address, email, phone, password);
                              _showSnackBar(userAccount.toMap().toString());
                              print(databaseHelper.insertUser(userAccount));
                              Future<List<User>> result =
                                  databaseHelper.getUserList();
                              result.then((user) {
                                _showSnackBar(user.toString());
                              });

                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => HomePage()));
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                              side: BorderSide(color: Colors.blue),
                            ),
                            child: Container(
                              height: 40,
                              width: 70,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    Icons.person,
                                    color: Colors.blue,
//                                  size: 48,
                                  ),
//                                ImageIcon(
//                                  AssetImage(""),
//                                  size: 48,
//                                  color: Colors.blue,
//                                ),
                                  Text(
                                    "Save",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          );
        },
      ),
//      floatingActionButton:
    );
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }
}
