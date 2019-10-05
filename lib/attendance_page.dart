import 'package:flutter/material.dart';
import 'package:table_app/student_services.dart';

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  List attendance = [];

  _AttendanceState() {
    loadStudent().then((val) => setState(() {
          attendance = val.studentAttendance;
        }));
  }

  List<DataRow> getRows() {
    List<DataRow> result = attendance
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
                    width: 120.0,
                    child: Text(
                      element["percent"],
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
          width: 120.0,
          padding: EdgeInsets.only(top: 8.0),
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.white, width: 1.0))),
          child: Text(
            "88.67%",
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
          title: const Text('My Attendance'),
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
                      width: 150.0,
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
                            width: 120.0,
                            padding: EdgeInsets.only(bottom: 8.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ))),
                            child: Text(
                              "ATTENDANCE",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Colors.blueAccent),
                            )))
                  ],
                  rows: getRows())),
        )
           );
  }
}
