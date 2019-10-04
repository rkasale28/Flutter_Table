class Student{
  String studentName,studentBranch;
  int studentRoll;
  List studentInfo;
  
  Student({
    this.studentName,
    this.studentRoll,
    this.studentBranch,
    this.studentInfo,
 });

Student.fromJson(Map<String, dynamic> parsedJson):
  studentName= parsedJson['name'],
  studentRoll = parsedJson['rollno'] as int,
  studentBranch = parsedJson ['branch'],
  studentInfo=parsedJson['info'] as List;
}
