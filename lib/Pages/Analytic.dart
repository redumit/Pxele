import 'package:expenses/models/report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

class ReportAnalitic extends StatefulWidget {
  @override
  _ReportAnaliticState createState() => _ReportAnaliticState();
}

class _ReportAnaliticState extends State<ReportAnalitic> {
  int _i = 0;

  Color _color2, _color3 = Colors.white;
  Color _color1 = Colors.blue;
  void colorchangeday() {
    setState(() {
      _color1 = Colors.blue;
      _color2 = Colors.white;
      _color3 = Colors.white;
    });
  }

  void colorchangweek() {
    setState(() {
      _color2 = Colors.blue;
      _color1 = Colors.white;
      _color3 = Colors.white;
    });
  }

  void colorchangmonth() {
    setState(() {
      _color2 = Colors.white;
      _color3 = Colors.blue;
      _color1 = Colors.white;
    });
  }

  final titlestyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
  Widget bodypage() {
    switch (_i) {
      case 0:
        return Dayliy();
      case 1:
        return Weekly();
      case 2:
        return Monthly();
        break;
      default:
        return Dayliy();
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
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
            child: Center(
              child: Center(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: ScreenUtil().setWidth(45),
                      width: MediaQuery.of(context).size.width / 3.3,
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                      child: FlatButton(
                        color: _color1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          colorchangeday();
                          setState(() {
                            _i = 0;
                          });
                        },
                        child: Text(
                          'Dayliy',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ),
                    ),
                    Container(
                      height: ScreenUtil().setWidth(45),
                      width: MediaQuery.of(context).size.width / 3.3,
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                      child: FlatButton(
                        color: _color2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          colorchangweek();
                          setState(() {
                            _i = 1;
                          });
                        },
                        child: Text(
                          'Weekliy',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ),
                    ),
                    Container(
                      height: ScreenUtil().setWidth(45),
                      width: MediaQuery.of(context).size.width / 3.3,
                      padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(10),
                      ),
                      child: FlatButton(
                          color: _color3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            colorchangmonth();
                            setState(() {
                              _i = 2;
                            });
                          },
                          child: Text(
                            'Monthly',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.black12,
            thickness: 1,
          ),
          bodypage(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: ScreenUtil().setWidth(40),
          )),
    );
  }
}

//

class Dayliy extends StatefulWidget {
  @override
  _DayliyState createState() => _DayliyState();
}

class _DayliyState extends State<Dayliy> {
  TextStyle txtstyle =
      TextStyle(fontSize: ScreenUtil().setSp(16), fontWeight: FontWeight.bold);
  String _nowdate = DateFormat.yMd().format(DateTime.now()).toString();
  Map<String, double> dataMap = Map();
  List<Color> colorList = [
    Colors.red,
    Colors.lightBlueAccent,
    Colors.yellow,
    Colors.grey,
  ];

  @override
  void initState() {
    super.initState();
    dataMap.putIfAbsent("Income", () => 5);
    dataMap.putIfAbsent("Outcome", () => 3);
    dataMap.putIfAbsent("Savings", () => 3);
    dataMap.putIfAbsent("Others", () => 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(ScreenUtil().setWidth(8)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
              decoration: BoxDecoration(
                  border: Border.all(width: .8),
                  borderRadius: BorderRadius.circular(8)),
              width: ScreenUtil().setWidth(150),
              child: Row(
                children: <Widget>[
                  Text('$_nowdate'),
                  IconButton(
                    icon: Icon(Icons.date_range, color: Colors.blue),
                    onPressed: () {
                      var format = DateFormat.yMd();
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(200),
                              lastDate: DateTime(2021))
                          .then((date) {
                        setState(() {
                          _nowdate = format.format(date).toString();
                        });
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        PieChart(
          legendStyle: TextStyle(
              color: Colors.indigo,
              fontSize: ScreenUtil().setSp(17),
              fontWeight: FontWeight.bold),
          dataMap: dataMap,
          animationDuration: Duration(milliseconds: 800),
          chartLegendSpacing: ScreenUtil().setWidth(40),
          chartRadius: MediaQuery.of(context).size.width / 2.5,
          showChartValuesInPercentage: true,
          showChartValues: true,
          showChartValuesOutside: false,
          chartValueBackgroundColor: Colors.grey[200],
          colorList: colorList,
          showLegends: true,
          legendPosition: LegendPosition.right,
          decimalPlaces: 1,
          showChartValueLabel: true,
          initialAngle: 0,
          chartValueStyle: defaultChartValueStyle.copyWith(
            color: Colors.blueGrey[900].withOpacity(0.9),
          ),
          chartType: ChartType.disc,
        ),
        Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(columns: <DataColumn>[
              DataColumn(
                  label: Text(
                'Type',
                style: txtstyle,
              )),
              DataColumn(
                  label: Text(
                'TotalSales',
                style: txtstyle,
                overflow: TextOverflow.visible,
              )),
              DataColumn(label: Text('EXpence', style: txtstyle)),
              DataColumn(label: Text('Profit', style: txtstyle)),
              DataColumn(label: Text('Loss', style: txtstyle)),
            ], rows: <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Center(
                    child: Text("Product", style: txtstyle),
                  )),
                  DataCell(Text('0')),
                  DataCell(Text("0")),
                  DataCell(Text("0")),
                  DataCell(Text("0")),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Center(
                    child: Text("Service", style: txtstyle),
                  )),
                  DataCell(Text("0")),
                  DataCell(Text("0")),
                  DataCell(Text("0")),
                  DataCell(Text("0")),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Center(
                    child: Text("Total", style: txtstyle),
                  )),
                  DataCell(Text("0")),
                  DataCell(Text("0")),
                  DataCell(Text("0")),
                  DataCell(Text("0")),
                ],
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

class Weekly extends StatefulWidget {
  @override
  _WeeklyState createState() => _WeeklyState();
}

class _WeeklyState extends State<Weekly> {
  TextStyle txtstyle =
      TextStyle(fontSize: ScreenUtil().setSp(16), fontWeight: FontWeight.bold);
  String _weekdate = DateFormat.yMd().format(DateTime.now()).toString();

  Map<String, double> dataMap = Map();
  List<Color> colorList = [
    Colors.red,
    Colors.lightBlueAccent,
    Colors.yellow,
    Colors.grey,
  ];

  @override
  void initState() {
    super.initState();
    dataMap.putIfAbsent("Income", () => 5);
    dataMap.putIfAbsent("Outcome", () => 3);
    dataMap.putIfAbsent("Savings", () => 3);
    dataMap.putIfAbsent("Others", () => 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(ScreenUtil().setWidth(8)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
              decoration: BoxDecoration(
                  border: Border.all(width: .8),
                  borderRadius: BorderRadius.circular(8)),
              width: ScreenUtil().setWidth(150),
              child: Row(
                children: <Widget>[
                  Text('$_weekdate'),
                  IconButton(
                    icon: Icon(Icons.date_range, color: Colors.blue),
                    onPressed: () {
                      var format = DateFormat.yMd();
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(200),
                              lastDate: DateTime(2021))
                          .then((date) {
                        setState(() {
                          _weekdate = format.format(date).toString();
                        });
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        PieChart(
          legendStyle: TextStyle(
              color: Colors.indigo,
              fontSize: ScreenUtil().setSp(17),
              fontWeight: FontWeight.bold),
          dataMap: dataMap,
          animationDuration: Duration(milliseconds: 800),
          chartLegendSpacing: ScreenUtil().setWidth(40),
          chartRadius: MediaQuery.of(context).size.width / 2.5,
          showChartValuesInPercentage: true,
          showChartValues: true,
          showChartValuesOutside: false,
          chartValueBackgroundColor: Colors.grey[200],
          colorList: colorList,
          showLegends: true,
          legendPosition: LegendPosition.right,
          decimalPlaces: 1,
          showChartValueLabel: true,
          initialAngle: 0,
          chartValueStyle: defaultChartValueStyle.copyWith(
            color: Colors.blueGrey[900].withOpacity(0.9),
          ),
          chartType: ChartType.disc,
        ),
        Center(
          child: DataTable(
              columnSpacing: ScreenUtil().setWidth(12),
              columns: <DataColumn>[
                DataColumn(
                    label: Text(
                  'Type',
                  style: txtstyle,
                )),
                DataColumn(
                    label: Text(
                  'TotalSales',
                  style: txtstyle,
                  overflow: TextOverflow.visible,
                )),
                DataColumn(label: Text('EXpence', style: txtstyle)),
                DataColumn(label: Text('Profit', style: txtstyle)),
                DataColumn(label: Text('Loss', style: txtstyle)),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Center(
                      child: Text("Product", style: txtstyle),
                    )),
                    DataCell(Text('0')),
                    DataCell(Text("0")),
                    DataCell(Text("0")),
                    DataCell(Text("0")),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Center(
                      child: Text("Service", style: txtstyle),
                    )),
                    DataCell(Text("0")),
                    DataCell(Text("0")),
                    DataCell(Text("0")),
                    DataCell(Text("0")),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Center(
                      child: Text("Total", style: txtstyle),
                    )),
                    DataCell(Text("0")),
                    DataCell(Text("0")),
                    DataCell(Text("0")),
                    DataCell(Text("0")),
                  ],
                ),
              ]),
        ),
      ],
    );
  }
}

class Monthly extends StatefulWidget {
  @override
  _MonthlyState createState() => _MonthlyState();
}

class _MonthlyState extends State<Monthly> {
  TextStyle txtstyle =
      TextStyle(fontSize: ScreenUtil().setSp(16), fontWeight: FontWeight.bold);
  String _monthdate = DateFormat.yMd().format(DateTime.now()).toString();
  Map<String, double> dataMap = Map();
  List<Color> colorList = [
    Colors.red,
    Colors.lightBlueAccent,
    Colors.yellow,
    Colors.grey,
  ];

  @override
  void initState() {
    super.initState();
    dataMap.putIfAbsent("Income", () => 5);
    dataMap.putIfAbsent("Outcome", () => 3);
    dataMap.putIfAbsent("Savings", () => 3);
    dataMap.putIfAbsent("Others", () => 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(ScreenUtil().setWidth(8)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
              decoration: BoxDecoration(
                  border: Border.all(width: .8),
                  borderRadius: BorderRadius.circular(8)),
              width: ScreenUtil().setWidth(150),
              child: Row(
                children: <Widget>[
                  Text('$_monthdate'),
                  IconButton(
                    icon: Icon(Icons.date_range, color: Colors.blue),
                    onPressed: () {
                      var format = DateFormat.yMd();
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(200),
                              lastDate: DateTime(2021))
                          .then((date) {
                        setState(() {
                          _monthdate = format.format(date).toString();
                        });
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        PieChart(
          legendStyle: TextStyle(
              color: Colors.indigo,
              fontSize: ScreenUtil().setSp(17),
              fontWeight: FontWeight.bold),
          dataMap: dataMap,
          animationDuration: Duration(milliseconds: 800),
          chartLegendSpacing: ScreenUtil().setWidth(40),
          chartRadius: MediaQuery.of(context).size.width / 2.5,
          showChartValuesInPercentage: true,
          showChartValues: true,
          showChartValuesOutside: false,
          chartValueBackgroundColor: Colors.grey[200],
          colorList: colorList,
          showLegends: true,
          legendPosition: LegendPosition.right,
          decimalPlaces: 1,
          showChartValueLabel: true,
          initialAngle: 0,
          chartValueStyle: defaultChartValueStyle.copyWith(
            color: Colors.blueGrey[900].withOpacity(0.9),
          ),
          chartType: ChartType.disc,
        ),
        Center(
          child: DataTable(
              columnSpacing: ScreenUtil().setWidth(12),
              columns: <DataColumn>[
                DataColumn(
                    label: Text(
                  'Type',
                  style: txtstyle,
                )),
                DataColumn(
                    label: Text(
                  'TotalSales',
                  style: txtstyle,
                  overflow: TextOverflow.visible,
                )),
                DataColumn(label: Text('EXpence', style: txtstyle)),
                DataColumn(label: Text('Profit', style: txtstyle)),
                DataColumn(label: Text('Loss', style: txtstyle)),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Center(
                      child: Text("Product", style: txtstyle),
                    )),
                    DataCell(Text('0')),
                    DataCell(Text("0")),
                    DataCell(Text("0")),
                    DataCell(Text("0")),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Center(
                      child: Text("Service", style: txtstyle),
                    )),
                    DataCell(Text("0")),
                    DataCell(Text("0")),
                    DataCell(Text("0")),
                    DataCell(Text("0")),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Center(
                      child: Text("Total", style: txtstyle),
                    )),
                    DataCell(Text("0")),
                    DataCell(Text("0")),
                    DataCell(Text("0")),
                    DataCell(Text("0")),
                  ],
                ),
              ]),
        ),
      ],
    );
  }

  void tableGenerate() {
    Report rp;
  }
}
