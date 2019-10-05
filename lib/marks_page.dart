import 'package:flutter/material.dart';
import 'package:table_app/student_services.dart';

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
        width: 190.0,
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
