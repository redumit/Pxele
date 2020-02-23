import 'package:expenses/Pages/addProduct.dart';
import 'package:expenses/Pages/addService.dart';
import 'package:expenses/databaseHelper/serviceHelper.dart';
import 'package:expenses/models/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sqflite/sqflite.dart';

class TodayActivity extends StatefulWidget {
  @override
  _TodayActivityState createState() => _TodayActivityState();
}

class _TodayActivityState extends State<TodayActivity>
    with SingleTickerProviderStateMixin {
  //tabcontroller
  TabController _tabController;
  // index
  int index = 0;
  Color colorVal;
  // service data
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      colorVal = Colors.blue;
    });
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
    var ht = MediaQuery.of(context).size.height;
    var wd = MediaQuery.of(context).size.width;
    ScreenUtil.init(context, width: wd, height: ht, allowFontScaling: true);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Today"),
          bottom: TabBar(
            onTap: (currentIndex) {
              setState(() {
                index = currentIndex;
              });
            },
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                text: "Service",
                icon: Icon(Icons.map),
              ),
              Tab(
                text: "Product",
                icon: Icon(Icons.work),
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [serviceTab(), productTab()],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon(Icons.add),
          onPressed: () {
            debugPrint("Pressed");
            if (index == 0) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Services()));
            } else {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Products()));
            }
          },
        ),
      ),
    );
  }

  Widget addService() {
    return SimpleDialog(
      title: Text("service"),
      children: <Widget>[Text("Content")],
    );
  }

  Widget addProduct() {
    return AlertDialog(
      title: Text("Product"),
      content: Text("content"),
    );
  }

  static Widget productTab() {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, index) {
          return Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.work),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Mentenance"),
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
                  child: IconButton(icon: Icon(Icons.edit), onPressed: null),
                ),
              ),
              Divider()
            ],
          );
        });
  }

  Widget serviceTab() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) {
          return Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.pan_tool),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Mentenance"),
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
                  child: IconButton(icon: Icon(Icons.edit), onPressed: null),
                ),
              ),
              Divider()
            ],
          );
        });
  }
}
