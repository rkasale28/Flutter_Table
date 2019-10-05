import 'package:flutter/material.dart';
import 'package:table_app/attendance_page.dart';
import 'package:table_app/marks_page.dart';
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
      drawer: new Drawer(
        elevation: 2.0,
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border(
                  bottom: BorderSide(color: Colors.blue,width: 5.0)
                )
              ),
              accountName:Text(st.studentName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),),
              
              accountEmail: Text(st.studentInfo[1],
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),),
              
              currentAccountPicture: new CircleAvatar(
                backgroundColor: const Color(0xff2C5F2D),
                child: Text(st.studentName.substring(0,1),
                style: TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),),
              ),
            ),
            Container(
              child: new ListTile(
                title: Text("Marks",),
                leading: CircleAvatar(
                  backgroundColor: const Color(0xff2C5F2D),
                  child: Icon(Icons.assessment,
                  color: Colors.white),
                ), 
                onTap: () => Navigator.of(context).pushNamed("/second"),
              ),
            ),
            new Divider(),
            new ListTile(
              leading:CircleAvatar(
                backgroundColor: const Color(0xff2C5F2D),
                child: Icon(Icons.wc,
                color: Colors.white),
              ), 
              title: Text("Attendance"),
              onTap: () => Navigator.of(context).pushNamed("/third"),
            ),
            new Divider()
          ],
        ),
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
        ]),
    );
  }
}


