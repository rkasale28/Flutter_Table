import 'package:flutter/material.dart';
import 'package:table_app/student_model.dart';
import 'package:table_app/student_services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomePage(),
      routes: {'/second': (_) => Marks(), '/third': (_) => Attendance()},
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Student st;

  List icon = [Icons.local_phone, Icons.mail, Icons.home, Icons.school];

  _HomePageState() {
    loadStudent().then((val) => setState(() {
          st = val;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Color.fromRGBO(12, 104, 24, 4.0),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.account_circle,
                    color: const Color(0xff2C5F2D),
                    size: 50.0,
                  ),
                  Text(
                    st.studentName,
                    style: TextStyle(
                      fontSize: 20,
                      color: const Color(0xff2C5F2D),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    st.studentBranch,
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color(0xff2C5F2D),
                    ),
                  ),
                  Text(
                    'Roll No. :' + st.studentRoll.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color(0xff2C5F2D),
                    ),
                  ),
                ],
              ),
            ),
          ),
          elevation: 2.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(
                color: const Color(0xff2C5F2D),
                width: 2.0,
              )),
        ),
        Expanded(
          child: new ListView.builder(
              itemCount: st.studentInfo.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return new Card(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          icon[index],
                          color: const Color(0xff2C5F2D),
                        ),
                      ),
                      Text(
                        st.studentInfo[index],
                        style: TextStyle(
                          fontSize: 18,
                          color: const Color(0xff2C5F2D),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Marks",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      color: Colors.white,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(
                            color: const Color(0xff2C5F2D),
                            width: 2.0,
                          )),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/second");
                      }),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Attendance",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    color: Colors.white,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(
                          color: const Color(0xff2C5F2D),
                          width: 2.0,
                        )),
                    onPressed: () {
                      //Basic way of navigation
                      Navigator.of(context).pushNamed("/third");
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

class Marks extends StatefulWidget {
  @override
  _MarksState createState() => _MarksState();
}

class _MarksState extends State<Marks> {
  List pointers = [];

  _MarksState() {
    loadStudent().then((val) => setState(() {
          pointers = val.studentPointer;
        }));
  }

  List<DataRow> getRows() {
    List<DataRow> result = pointers
        .map(
          ((element) => DataRow(
                cells: <DataCell>[
                  DataCell(Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      element["subject"],
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  )),
                  DataCell(Container(
                    width: 100.0,
                    child: Text(
                      element["marks"],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  )),
                ],
              )),
        )
        .toList();
    result.add(DataRow(cells: [
      DataCell(Container(
        width: 170.0,
        padding: EdgeInsets.only(top: 8.0),
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.white, width: 1.0))),
        child: Text(
          "Average",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      )),
      DataCell(Container(
          width: 100.0,
          padding: EdgeInsets.only(top: 8.0),
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.white, width: 1.0))),
          child: Text(
            "9.17",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ))),
    ]));
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Marks'),
          backgroundColor: Color.fromRGBO(12, 104, 24, 4.0),
        ),
        body: Container(
          color: Colors.black,
          child: Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: DataTable(
                  dataRowHeight: 50.0,
                  columnSpacing: 40.0,
                  columns: [
                    DataColumn(
                        label: Container(
                      width: 170.0,
                      padding: EdgeInsets.only(bottom: 8.0),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ))),
                      child: Text(
                        "SUBJECT",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: Colors.blueAccent),
                      ),
                    )),
                    DataColumn(
                        label: Container(
                            width: 100.0,
                            padding: EdgeInsets.only(bottom: 8.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ))),
                            child: Text(
                              "POINTERS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Colors.blueAccent),
                            )))
                  ],
                  rows: getRows())),
        ));
  }
}

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Attendance'),
          backgroundColor: Color.fromRGBO(12, 104, 24, 4.0),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: Table(
              columnWidths: <int, TableColumnWidth>{
                0: FixedColumnWidth(width * 0.67),
                1: FixedColumnWidth(width * 0.33)
              },
              border: TableBorder.all(width: 1.0, color: Colors.green),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              textDirection: TextDirection.ltr,
              children: [
                TableRow(
                    decoration: new BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.green, width: 1.0)),
                    children: [
                      TableCell(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          'SUBJECT',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.green[300],
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                      TableCell(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          'POINTERS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.green[300],
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                    ]),
                TableRow(
                    decoration: new BoxDecoration(
                      color: Colors.black,
                    ),
                    children: [
                      TableCell(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          'Applied Mathematics-IV',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                      TableCell(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          '90%',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                    ]),
                TableRow(
                    decoration: new BoxDecoration(
                      color: Colors.black,
                    ),
                    children: [
                      TableCell(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          'Data Communication And Networking',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                      TableCell(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          '86%',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                    ]),
                TableRow(
                    decoration: new BoxDecoration(
                      color: Colors.black,
                    ),
                    children: [
                      TableCell(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          'Analysis of Algorithms',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                      TableCell(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          '79%',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                    ]),
                TableRow(
                    decoration: new BoxDecoration(
                      color: Colors.black,
                    ),
                    children: [
                      TableCell(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          'Computer Organization and Architecture',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                      TableCell(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          '82%',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                    ]),
                TableRow(
                    decoration: new BoxDecoration(
                      color: Colors.black,
                    ),
                    children: [
                      TableCell(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          'Web Programming',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                      TableCell(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          '97%',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                    ]),
                TableRow(
                    decoration: new BoxDecoration(
                      color: Colors.black,
                    ),
                    children: [
                      TableCell(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          'Programming Language-II',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                      TableCell(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          '98%',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                    ]),
                TableRow(
                    decoration: new BoxDecoration(
                      color: Colors.black,
                    ),
                    children: [
                      TableCell(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          'Overall',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                      TableCell(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          '88.67%',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                    ]),
              ],
            ),
          ),
        ));
  }
}
