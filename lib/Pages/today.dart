import 'package:expenses/databaseHelper/serviceHelper.dart';
import 'package:expenses/models/service.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Today extends StatefulWidget {
  @override
  _Budget createState() => _Budget();
}

class _Budget extends State<Today> {
  bool _on = true;
  int _i = 0;
  Color _color2 = Colors.white;
  Color _color1 = Colors.blue;
  void colorchangService() {
    setState(() {
      _on = true;
      _color1 = Colors.blue;
      _color2 = Colors.white;
    });
  }

  void colorchangProduct() {
    setState(() {
      _on = !_on;
      _on = false;
      _color2 = Colors.blue;
      _color1 = Colors.white;
    });
  }

  Widget bodypage() {
    //colorchang();
    switch (_i) {
      case 0:
        return Services();
      case 1:
        return Product();

        break;
      default:
        return Services();
    }
  }

  //Database
  ServiceHelper serviceHelper = ServiceHelper();
  List<ServiceModel> serviceList;
  int count = 0;

  void updateListView() {
    final Future<Database> dbFuture = serviceHelper.initializeDatebase();
    dbFuture.then((database) {
      Future<List<ServiceModel>> serviceListFuture =
          serviceHelper.getServiceList();
      serviceListFuture.then((serviceList) {
        setState(() {
          this.serviceList = serviceList;
          this.count = serviceList.length;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (serviceList == null) {
      serviceList = List<ServiceModel>();
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Today'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 120,
            child: Center(
              child: Center(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 2,
                      padding: EdgeInsets.only(left: 10),
                      child: RaisedButton(
                        color: _color1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        onPressed: () {
                          colorchangService();
                          setState(() {
                            _i = 0;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Container(
                                child: Icon(
                              Icons.thumb_up,
                              size: 30,
                              color: _color2,
                            )),
                            Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                'Service',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: _color2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 2,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: RaisedButton(
                        elevation: 4,
                        color: _color2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        onPressed: () {
                          colorchangProduct();
                          setState(() {
                            _i = 1;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Container(
                                child: Icon(Icons.credit_card,
                                    size: 30, color: _color1)),
                            Container(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  'Product',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: _color1),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.black12,
            thickness: 11,
          ),
          bodypage(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint("Product");
          },
          backgroundColor: Colors.green,
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 40,
          )),
    );
  }
}

class Services extends StatelessWidget {
  const Services({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: ListTile(
              leading: Icon(Icons.touch_app),
              title: Row(
                children: <Widget>[
                  Text('Mentenance'),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0, top: 15),
                    child: Text('5,000'),
                  ),
                ],
              ),
              subtitle: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Text('Feb 2/2020'),
                  ),
                  Text('2:30 Am'),
                ],
              ),
              trailing: CircleAvatar(
                backgroundColor: Colors.blue[100],
                child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                    onPressed: () {}),
              ),
            ),
          ),
          Divider(
            thickness: 10,
            color: Colors.black12,
          ),
          Container(
            child: ListTile(
              leading: Icon(Icons.touch_app),
              title: Row(
                children: <Widget>[
                  Text('Mentenance'),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0, top: 15),
                    child: Text('5,000'),
                  ),
                ],
              ),
              subtitle: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Text('Feb 2/2020'),
                  ),
                  Text('2:30 Am'),
                ],
              ),
              trailing: CircleAvatar(
                backgroundColor: Colors.blue[100],
                child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                    onPressed: () {}),
              ),
            ),
          ),
          Divider(
            thickness: 10,
            color: Colors.black12,
          ),
          Divider(
            thickness: 10,
            color: Colors.black12,
          ),
          Container(
            child: ListTile(
              leading: Icon(Icons.touch_app),
              title: Row(
                children: <Widget>[
                  Text('Mentenance'),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0, top: 15),
                    child: Text('5,000'),
                  ),
                ],
              ),
              subtitle: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Text('Feb 2/2020'),
                  ),
                  Text('2:30 Am'),
                ],
              ),
              trailing: CircleAvatar(
                backgroundColor: Colors.blue[100],
                child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                    onPressed: () {}),
              ),
            ),
          ),
          Divider(
            thickness: 10,
            color: Colors.black12,
          ),
          Container(
            child: ListTile(
              leading: Icon(Icons.touch_app),
              title: Row(
                children: <Widget>[
                  Text('Mentenance'),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0, top: 15),
                    child: Text('5,000'),
                  ),
                ],
              ),
              subtitle: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Text('Feb 2/2020'),
                  ),
                  Text('2:30 Am'),
                ],
              ),
              trailing: CircleAvatar(
                backgroundColor: Colors.blue[100],
                child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                    onPressed: () {}),
              ),
            ),
          ),
          Divider(
            thickness: 10,
            color: Colors.black12,
          ),
          Container(
            child: ListTile(
              leading: Icon(Icons.touch_app),
              title: Row(
                children: <Widget>[
                  Text('Mentenance'),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0, top: 15),
                    child: Text('5,000'),
                  ),
                ],
              ),
              subtitle: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Text('Feb 2/2020'),
                  ),
                  Text('2:30 Am'),
                ],
              ),
              trailing: CircleAvatar(
                backgroundColor: Colors.blue[100],
                child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                    onPressed: () {}),
              ),
            ),
          ),
          Divider(
            thickness: 10,
            color: Colors.black12,
          ),
          Container(
            child: ListTile(
              leading: Icon(Icons.touch_app),
              title: Row(
                children: <Widget>[
                  Text('Mentenance'),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0, top: 15),
                    child: Text('5,000'),
                  ),
                ],
              ),
              subtitle: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Text('Feb 2/2020'),
                  ),
                  Text('2:30 Am'),
                ],
              ),
              trailing: CircleAvatar(
                backgroundColor: Colors.blue[100],
                child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                    onPressed: () {}),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Product extends StatelessWidget {
  const Product({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          child: ListTile(
            leading: Icon(Icons.credit_card),
            title: Row(
              children: <Widget>[
                Text('Generator'),
                Padding(
                  padding: const EdgeInsets.only(left: 100.0, top: 15),
                  child: Text('5,000'),
                ),
              ],
            ),
            subtitle: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Text('Feb 2/2020'),
                ),
                Text('2:30 Am'),
              ],
            ),
            trailing: CircleAvatar(
              backgroundColor: Colors.blue[100],
              child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),
                  onPressed: () {}),
            ),
          ),
        ),
        Divider(
          thickness: 10,
          color: Colors.black12,
        ),
        Container(
          child: ListTile(
            leading: Icon(Icons.credit_card),
            title: Row(
              children: <Widget>[
                Text('Generator'),
                Padding(
                  padding: const EdgeInsets.only(left: 100.0, top: 15),
                  child: Text('5,000'),
                ),
              ],
            ),
            subtitle: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Text('Feb 2/2020'),
                ),
                Text('2:30 Am'),
              ],
            ),
            trailing: CircleAvatar(
              backgroundColor: Colors.blue[100],
              child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),
                  onPressed: () {}),
            ),
          ),
        ),
        Divider(
          thickness: 10,
          color: Colors.black12,
        ),
        Container(
          child: ListTile(
            leading: Icon(Icons.credit_card),
            title: Row(
              children: <Widget>[
                Text('Generator'),
                Padding(
                  padding: const EdgeInsets.only(left: 100.0, top: 15),
                  child: Text('5,000'),
                ),
              ],
            ),
            subtitle: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Text('Feb 2/2020'),
                ),
                Text('2:30 Am'),
              ],
            ),
            trailing: CircleAvatar(
              backgroundColor: Colors.blue[100],
              child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),
                  onPressed: () {}),
            ),
          ),
        ),
        Divider(
          thickness: 10,
          color: Colors.black12,
        ),
      ],
    );
  }
}
