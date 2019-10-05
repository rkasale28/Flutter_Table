class Student{
  String studentName,studentBranch;
  int studentRoll;
  List studentInfo,studentPointer,studentAttendance;
  
  Student({
    this.studentName,
    this.studentRoll,
    this.studentBranch,
    this.studentInfo,
    this.studentPointer,
    this.studentAttendance
 });

Student.fromJson(Map<String, dynamic> parsedJson):
  studentName= parsedJson['name'],
  studentRoll = parsedJson['rollno'] as int,
  studentBranch = parsedJson ['branch'],
  studentInfo=parsedJson['info'] as List,
  studentPointer=parsedJson['pointer'] as List,
  studentAttendance=parsedJson['attendance'] as List;
}
