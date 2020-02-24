import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LoanAdd extends StatefulWidget {
  @override
  _LoanAddState createState() => _LoanAddState();
}

class _LoanAddState extends State<LoanAdd> with SingleTickerProviderStateMixin {
  TabController _tabController;

  // index
  int index = 0;
  Color colorVal;
  List<String> _items = ['Dedebit', 'Fana', 'Anbesa', 'ECB'];
  String _itemName, _segemnt;

  Widget _newLoan(BuildContext context) {
    //   String _date = DateFormat.yMd().format(DateTime.now()).toString();
    //   return Container(
    //     padding: EdgeInsets.only(top: 20, left: 30),
    //     child: ListView(
    //       children: <Widget>[
    //         Align(
    //           alignment: Alignment.topLeft,
    //           child: Container(
    //             padding: EdgeInsets.only(top: 8),
    //             width: MediaQuery.of(context).size.width / 1.6,
    //             child: TextFormField(
    //               validator: (value) {
    //                 if (value.isEmpty) {
    //                   return 'Lender required';
    //                 }
    //                 return null;
    //               },
    //               decoration: InputDecoration(
    //                 fillColor: Colors.white,
    //                 border: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(10),
    //                     borderSide: BorderSide(color: Colors.teal, width: 1.0)),
    //                 labelText: 'Lender',
    //               ),
    //             ),
    //           ),
    //         ),
    //         SizedBox(
    //           height: 15,
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(right: 10.0),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: <Widget>[
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: <Widget>[
    //                   Container(
    //                     width: MediaQuery.of(context).size.width * 0.50,
    //                     child: TextFormField(
    //                       keyboardType: TextInputType.number,
    //                       validator: (value) {
    //                         if (value.isEmpty) {
    //                           return 'Amount is requierd';
    //                         }
    //                         return null;
    //                       },
    //                       decoration: InputDecoration(
    //                         border: OutlineInputBorder(
    //                             borderRadius: BorderRadius.circular(10),
    //                             borderSide:
    //                                 BorderSide(color: Colors.teal, width: 1.0)),
    //                         labelText: 'Amount',
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               Container(
    //                 padding: EdgeInsets.only(left: 10),
    //                 width: MediaQuery.of(context).size.width * 0.30,
    //                 child: TextFormField(
    //                   keyboardType: TextInputType.number,
    //                   validator: (value) {
    //                     if (value.isEmpty) {
    //                       return 'Rate is requierd';
    //                     }
    //                     return null;
    //                   },
    //                   decoration: InputDecoration(
    //                     border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10),
    //                         borderSide:
    //                             BorderSide(color: Colors.teal, width: 1.0)),
    //                     labelText: 'Rate',
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(right: 10.0),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: <Widget>[
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: <Widget>[
    //                   Container(
    //                     padding: EdgeInsets.all(3),
    //                     child: Align(
    //                         alignment: Alignment.centerLeft,
    //                         child: Text('Taken Date')),
    //                   ),
    //                   Container(
    //                     width: MediaQuery.of(context).size.width * 0.50,
    //                     margin: EdgeInsets.all(5),
    //                     padding: EdgeInsets.all(5),
    //                     decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(10.0),
    //                       border: Border.all(width: 0.80),
    //                     ),
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: <Widget>[
    //                         Text('$_date'),
    //                         IconButton(
    //                           icon: Icon(Icons.date_range, color: Colors.blue),
    //                           onPressed: () {
    //                             var format = DateFormat.yMd();
    //                             showDatePicker(
    //                                     context: context,
    //                                     initialDate: DateTime.now(),
    //                                     firstDate: DateTime(1970),
    //                                     lastDate: DateTime(2021))
    //                                 .then((date) {
    //                               setState(() {
    //                                 _date = format.format(date).toString();
    //                               });
    //                             });
    //                           },
    //                         )
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               Container(
    //                 padding: EdgeInsets.only(left: 10),
    //                 width: MediaQuery.of(context).size.width * 0.30,
    //                 child: TextFormField(
    //                   keyboardType: TextInputType.number,
    //                   validator: (value) {
    //                     if (value.isEmpty) {
    //                       return 'Year required';
    //                     }
    //                     return null;
    //                   },
    //                   decoration: InputDecoration(
    //                     border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10),
    //                         borderSide:
    //                             BorderSide(color: Colors.teal, width: 1.0)),
    //                     labelText: 'For year',
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Padding(
    //           padding: EdgeInsets.only(top: 30),
    //           child: Align(
    //             alignment: Alignment.topRight,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: <Widget>[
    //                 Container(
    //                   padding: EdgeInsets.only(left: 10, right: 15),
    //                   child: OutlineButton(
    //                     borderSide: BorderSide(color: Colors.red),
    //                     shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(10)),
    //                     onPressed: () => Navigator.pop(context),
    //                     child: Row(
    //                       children: <Widget>[
    //                         Container(
    //                             padding: EdgeInsets.only(right: 8),
    //                             child:
    //                                 Icon(Icons.cancel, color: Colors.red[200])),
    //                         Text(
    //                           'cancel',
    //                           style: TextStyle(color: Colors.red),
    //                         ),
    //                       ],
    //                     ),
    //                     color: Colors.red,
    //                   ),
    //                 ),
    //                 Container(
    //                   padding: EdgeInsets.only(left: 15, right: 10),
    //                   child: OutlineButton(
    //                     onPressed: () {
    //                       debugPrint("Saved");
    //                     },
    //                     borderSide: BorderSide(color: Colors.green),
    //                     shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(10)),
    //                     child: Row(
    //                       children: <Widget>[
    //                         Container(
    //                             padding: EdgeInsets.only(right: 8),
    //                             child: Icon(Icons.mail_outline,
    //                                 color: Colors.green)),
    //                         Text(
    //                           'Save',
    //                           style: TextStyle(color: Colors.green),
    //                         ),
    //                       ],
    //                     ),
    //                     color: Colors.white,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
  }

  Widget _payLoan(BuildContext context) {
    String _date = DateFormat.yMd().format(DateTime.now()).toString();
    return Container(
      padding: EdgeInsets.only(top: 20, left: 30),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(width: 0.80),
                  ),
                  child: DropdownButton(
                    icon: Align(
                      alignment: Alignment.centerRight,
                      child:
                          Icon(Icons.arrow_drop_down, color: Colors.blue[300]),
                    ),
                    value: _itemName,
                    hint: Text('Item Name'),
                    onChanged: (String value) {
                      setState(() {
                        _itemName = value;
                      });
                    },
                    items: _items
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
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Amount is requierd';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.teal, width: 1.0)),
                          labelText: 'Amount',
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width * 0.30,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Rate is requierd';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.teal, width: 1.0)),
                      labelText: 'Rate',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(3),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Taken Date')),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.50,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(width: 0.80),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('$_date'),
                          IconButton(
                            icon: Icon(Icons.date_range, color: Colors.blue),
                            onPressed: () {
                              var format = DateFormat.yMd();
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1970),
                                      lastDate: DateTime(2021))
                                  .then((date) {
                                setState(() {
                                  _date = format.format(date).toString();
                                });
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width * 0.30,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Year required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.teal, width: 1.0)),
                      labelText: 'For year',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Align(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 15),
                    child: OutlineButton(
                      borderSide: BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () => Navigator.pop(context),
                      child: Row(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.only(right: 8),
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
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: OutlineButton(
                      onPressed: () {
                        debugPrint("save");
                      },
                      borderSide: BorderSide(color: Colors.green),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.only(right: 8),
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
          ),
        ],
      ),
    );
  }

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

  @override
  Widget build(BuildContext context) {
    //tabs
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Loan"),
          // bottom: TabBar(
          //   onTap: (currentIndex) {
          //     setState(() {
          //       index = currentIndex;
          //     });
          //   },
          //   controller: _tabController,
          //   tabs: <Widget>[
          //     Tab(
          //       text: "New Loan",
          //       icon: Icon(Icons.fiber_new),
          //     ),
          //     Tab(
          //       text: "Payment Loan",
          //       icon: Icon(Icons.payment),
          //     )
          //   ],
          // ),
        ),
        body: _payLoan(context));
  }
}
