import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:table_app/student_model.dart';

Future<String> _loadAStudentAsset() async {
  return await rootBundle.loadString('data/student.json');
}

Future <Student> loadStudent() async {
  String jsonString = await _loadAStudentAsset();
  final jsonResponse = json.decode(jsonString);
  Student student = new Student.fromJson(jsonResponse);
  return student;
}