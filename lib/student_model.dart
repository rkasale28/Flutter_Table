class Student{
  String studentName;
  int studentRoll;
  String studentBranch;

  Student({
    this.studentName,
    this.studentRoll,
    this.studentBranch
 });

Student.fromJson(Map<String, dynamic> parsedJson):
      studentName= parsedJson['name'],
      studentRoll = parsedJson['rollno'],
      studentBranch = parsedJson ['branch'];
    
}
