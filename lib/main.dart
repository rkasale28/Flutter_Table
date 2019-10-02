import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomePage(),
      routes: {'/second': (_) => Marks(), '/third': (_) => Attendance()},
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Color.fromRGBO(12, 104, 24, 4.0),
      ),
      body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
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
                      'Rohit R. Kasale',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color(0xff2C5F2D),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'TY IT A',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color(0xff2C5F2D),
                      ),
                    ),
                    Text(
                      'Roll No. : 1714026',
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
        ),
        Card(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.local_phone,
                  color: const Color(0xff2C5F2D),
                ),
              ),
              Text(
                '9664594525',
                style: TextStyle(
                  fontSize: 18,
                  color: const Color(0xff2C5F2D),
                ),
              ),
            ],
          ),
        ),
        Card(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.mail,
                  color: const Color(0xff2C5F2D),
                ),
              ),
              Text(
                'rohit.kasale@somaiya.edu',
                style: TextStyle(
                  fontSize: 18,
                  color: const Color(0xff2C5F2D),
                ),
              ),
            ],
          ),
        ),
        Card(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.school,
                  color: const Color(0xff2C5F2D),
                ),
              ),
              Text(
                'K. J. Somaiya College of Engineering',
                style: TextStyle(
                  fontSize: 18,
                  color: const Color(0xff2C5F2D),
                ),
              ),
            ],
          ),
        ),
        Card(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.home,
                  color: const Color(0xff2C5F2D),
                ),
              ),
              Text(
                'Lalbaug, Mumbai - 400 012',
                style: TextStyle(
                  fontSize: 18,
                  color: const Color(0xff2C5F2D),
                ),
              ),
            ],
          ),
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
                      //Basic way of navigation
                      Navigator.of(context).pushNamed("/second");
                    },
                  ),
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
        )
      ]),
    );
  }
}

class Marks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Marks'),
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
                          '10',
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
                          '8',
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
                          '8',
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
                          '9',
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
                          '10',
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
                          '10',
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
                          'Average',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                      TableCell(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          '9.17',
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

class Attendance extends StatelessWidget {
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