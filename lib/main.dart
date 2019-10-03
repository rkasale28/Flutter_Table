import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new UserOptions(),
    );
  }
}

class UserOptions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new UserOptionsState();
  }
}

class UserOptionsState extends State<UserOptions> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Score'),
          backgroundColor: Color.fromRGBO(12, 104, 24, 4.0),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: Table(
              columnWidths: <int,TableColumnWidth>{
                0:FixedColumnWidth(width*0.67),
                1:FixedColumnWidth(width*0.33)
              },
              border: TableBorder.all(width: 1.0, color: Colors.green),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              textDirection: TextDirection.ltr,
              children: [
                TableRow(
                  decoration: new BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.green,width: 1.0)
                  ),
                  children: [
                  TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text('SUBJECT',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.green[300],
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),),             
                          )),

                  TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text('POINTERS',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.green[300],
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),),
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
                            child: new Text('Applied Mathematics-IV',
                            style: TextStyle(color: Colors.white),),
                          )),

                  TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text('10',textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),),
                          )),                  
                ]),

                TableRow( decoration: new BoxDecoration(
                    color: Colors.black,
                  ),
                  children: [
                  TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text('Data Communication And Networking',
                            style: TextStyle(color: Colors.white),),
                          )),

                  TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text('8',textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),),
                          )),                  
                ]),

                TableRow( decoration: new BoxDecoration(
                    color: Colors.black,
                  ),
                  children: [
                  TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text('Analysis of Algorithms',
                            style: TextStyle(color: Colors.white),),
                          )),

                  TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text('8',textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),),
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
                            child: new Text('Computer Organization and Architecture',style: TextStyle(color: Colors.white),),
                          )),

                  TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text('9',textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),),
                          )),                  
                ]),

                TableRow( decoration: new BoxDecoration(
                    color: Colors.black,
                  ),
                  children: [
                  TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text('Web Programming',style: TextStyle(color: Colors.white),),
                          )),

                  TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text('10',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                          )),                  
                ]),

                TableRow( decoration: new BoxDecoration(
                    color: Colors.black,
                  ),
                  children: [
                  TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text('Programming Language-II',style: TextStyle(color: Colors.white),),
                          )),

                  TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text('10',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                          )),                  
                ]),
              ],
            ),
          ),
        ));
  }
}