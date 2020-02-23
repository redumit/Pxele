import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Expences extends StatefulWidget {
  @override
  _ExpencesState createState() => _ExpencesState();
}

class _ExpencesState extends State<Expences> {
  // List<PopupMenuEntry> popups= [
  //   PopupMenuButton(itemBuilder: null)
  // ]
  final _formkey = GlobalKey<FormState>();

  List<String> _expences = ['Rent', 'Labor', 'purchases', 'other'];

  final purchasecontrol = TextEditingController();
  String _expenceName, _purchasecost;

  String _purchaseDate = DateFormat.yMd().format(DateTime.now()).toString();
  String _time = DateFormat.Hms().format(DateTime.now()).toString();

  onsave() {
    final form = _formkey.currentState;
    if (form.validate()) {
      print('saved');
    } else {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('empty fields'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('OtherExpence'),
      ),
      body: Container(
        padding: EdgeInsets.only(
            top: ScreenUtil().setWidth(30), left: ScreenUtil().setWidth(30)),
        child: Form(
          key: _formkey,
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 65,
                        width: MediaQuery.of(context).size.width / 1.8,
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(10)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(width: 0.80),
                        ),
                        child: DropdownButton(
                          icon: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.arrow_drop_down,
                                color: Colors.blue[300]),
                          ),
                          value: _expenceName,
                          hint: Text('Expence Name'),
                          onChanged: (String value) {
                            setState(() {
                              _expenceName = value;
                            });
                          },
                          items: _expences
                              .map(
                                (item) => DropdownMenuItem(
                                  child: Text(item),
                                  value: item,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setWidth(10),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.8,
                  child: TextFormField(
                    controller: purchasecontrol,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'purchasecost is requierd';
                      }
                      return null;
                    },
                    onSaved: (value) => _purchasecost = value,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.teal, width: 1.0)),
                      labelText: 'PurchaseCost',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setWidth(15),
              ),
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(3)),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Service Date')),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        margin: EdgeInsets.all(ScreenUtil().setWidth(5)),
                        padding: EdgeInsets.all(ScreenUtil().setWidth(5)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(width: 0.80),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('$_purchaseDate'),
                            IconButton(
                              icon: Icon(Icons.date_range, color: Colors.blue),
                              onPressed: () {
                                var format = DateFormat.yMd();
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2017),
                                        lastDate: DateTime(2021))
                                    .then((date) {
                                  setState(() {
                                    _purchaseDate =
                                        format.format(date).toString();
                                  });
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        padding: EdgeInsets.all(ScreenUtil().setWidth(3)),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Time')),
                      ),
                      Container(
                        margin: EdgeInsets.all(ScreenUtil().setWidth(5)),
                        padding: EdgeInsets.all(ScreenUtil().setWidth(5)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(width: 0.80),
                        ),
                        child: Row(
                          children: <Widget>[
                            Text('$_time'),
                            IconButton(
                              icon: Icon(
                                Icons.timer,
                                color: Colors.blue,
                              ),
                              onPressed: () {
                                showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now())
                                    .then((time) {
                                  setState(() {
                                    _time = time.format(context);
                                  });
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                        child: Text('Total Price')),
                    Container(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                        child: Text('Gross Profit'))
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(10),
                          right: ScreenUtil().setWidth(15)),
                      child: OutlineButton(
                        borderSide: BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () => Navigator.pop(context),
                        child: Row(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.only(
                                    right: ScreenUtil().setWidth(8)),
                                child:
                                    Icon(Icons.cancel, color: Colors.red[200])),
                            Text(
                              'cancel',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(15),
                          right: ScreenUtil().setWidth(10)),
                      child: OutlineButton(
                        borderSide: BorderSide(color: Colors.green),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: onsave,
                        child: Row(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.only(
                                    right: ScreenUtil().setWidth(8)),
                                child: Icon(Icons.mail_outline,
                                    color: Colors.green)),
                            Text(
                              'Save',
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () => Navigator.pop(context),
        child: Text(
          'X',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
