import 'package:expenses/Pages/Analytic.dart';
import 'package:expenses/Pages/csvGenerate.dart';
import 'package:expenses/Pages/expenseList.dart';
import 'package:expenses/Pages/loan.dart';
import 'package:expenses/Pages/mailing.dart';
import 'package:expenses/Pages/materials.dart';
import 'package:expenses/Pages/salary.dart';
import 'package:expenses/Pages/setting.dart';
import 'package:expenses/Pages/todayActivity.dart';
import 'package:expenses/Pages/userAccount.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _height;
  Orientation _orientation = Orientation.portrait;
  final textstyle =
      TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      if (_orientation == Orientation.portrait) {
        _height = viewportConstraints.maxHeight;
      } else
        _height = viewportConstraints.maxWidth;
      return Scaffold(
        //Appbar
        appBar: AppBar(
          title: ListTile(
            title: Center(
              child: CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage('assets/Amete.jpg'),
              ),
            ),
          ),
          actions: <Widget>[
            Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ],
        ),
        drawer: _navDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.blue,
                height: 150,
                width: viewportConstraints.maxWidth,
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Hi, Abi",
                          style: textstyle,
                        )),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        '11:38 AM',
                        style: textstyle,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: WaveWidget(
//                wavePhase: 1,
                  duration: 3,
                  config: CustomConfig(
                    gradients: [
                      [Colors.blue, Colors.lightBlueAccent],
                      [Colors.lightBlueAccent, Colors.blue],
                      [Colors.white, Colors.lightBlue],
                      [Colors.white, Colors.lightBlueAccent]
                    ],
                    durations: [35000, 19440, 10800, 6000],
                    heightPercentages: [0.25, 0.5, 0.75, 1],
                    blur: MaskFilter.blur(BlurStyle.solid, 5),
                    gradientBegin: Alignment.bottomRight,
                    gradientEnd: Alignment.bottomLeft,
                  ),
                  waveAmplitude: 1.0,
                  backgroundColor: Colors.blue,
                  size: Size(double.infinity, 40.0),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TodayActivity()));
                            debugPrint("Today");
                          },
                          icon: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.blueGrey,
                                child: Icon(
                                  Icons.calendar_today,
                                  size: 32,
                                  color: Colors.amberAccent,
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Today'))
                            ],
                          ),
                          iconSize: 100,
                        ),
                        IconButton(
                          onPressed: () {
                            debugPrint("Analysis");
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ReportAnalitic()));
                          },
                          icon: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.blue[50],
                                child: Icon(Icons.insert_chart),
                              ),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Analtics'))
                            ],
                          ),
                          iconSize: 100,
                        ),
                        IconButton(
                          onPressed: () {
                            debugPrint("Salary");
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Salary()));
                          },
                          icon: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.pink[100],
                                child: Icon(
                                  Icons.money_off,
                                  size: 30,
                                  color: Colors.white70,
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Salary'))
                            ],
                          ),
                          iconSize: 100,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            debugPrint("Material");
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MaterialExpense()));
                          },
                          icon: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.deepOrange[200],
                                child: Icon(Icons.account_balance_wallet),
                              ),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Material'))
                            ],
                          ),
                          iconSize: 100,
                        ),
                        IconButton(
                          onPressed: () {
                            debugPrint("Loan");
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Loan()));
                          },
                          icon: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.blue[200],
                                child: Icon(Icons.airline_seat_legroom_normal),
                              ),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Loan'))
                            ],
                          ),
                          iconSize: 100,
                        ),
                        IconButton(
                          onPressed: () {
                            debugPrint("Other expenses");
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ExpenseList()));
                          },
                          icon: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.purple[100],
                                child: Icon(Icons.card_membership),
                              ),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'Expenses',
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(),
                                  ))
                            ],
                          ),
                          iconSize: 100,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => GenerateCSV()));
                            debugPrint("Generate");
                          },
                          icon: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.green[100],
                                child: Icon(Icons.folder_open),
                              ),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Generate'))
                            ],
                          ),
                          iconSize: 100,
                        ),
                        IconButton(
                          onPressed: () {
                            debugPrint("Sync");
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SendEmail()));
                          },
                          icon: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.green[200],
                                child: Icon(Icons.threed_rotation),
                              ),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Sync'))
                            ],
                          ),
                          iconSize: 100,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Setting()));
                          },
                          icon: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.purple[200],
                                child: Icon(
                                  Icons.settings,
                                  color: Colors.blue,
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Setting'))
                            ],
                          ),
                          iconSize: 100,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Forms(String s) {}

  Widget _navDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 191,
            child: DrawerHeader(
              padding: EdgeInsets.only(left: 50),
              decoration: BoxDecoration(
                color: Colors.blue[50],
              ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                currentAccountPicture: CircleAvatar(
                    radius: 45.5,
                    backgroundImage: AssetImage("assets/Amete.jpg")),
                accountName: Text(
                  "Selam Hagos",
                  style: TextStyle(color: Colors.blue),
                ),
                accountEmail: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Colors.blue,
                    ),
                    Text(
                      "0942255290",
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.email,
              color: Colors.blue,
            ),
            title: Text(
              "Send Report",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.email,
              color: Colors.blue,
            ),
            title: Text(
              "Send Report",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.email,
              color: Colors.blue,
            ),
            title: Text(
              "Send Report",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => UserAccount()));
            },
            leading: Icon(
              Icons.power_settings_new,
              color: Colors.blue,
            ),
            title: Text(
              "Log out",
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
