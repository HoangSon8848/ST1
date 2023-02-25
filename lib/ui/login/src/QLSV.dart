import 'dart:io';

class Student {
  static String universityName = "ABC University";
  int? id;
  String? name;
  String? className;
  String? email;

  Student(this.id, this.name, this.className, this.email);
  // int get id => _id;

  // set id(int value) => _id = value;

  // String get name => _name;

  // set name(String value) => _name = value;

  // String get className => _className;

  // set className(String value) => _className = value;

  // String get email => _email;

  // set email(String value) => _email = value;

  // static String get universityName => _universityName;

  // static set universityName(String value) => _universityName = value;
}

List<Student> studentList = [];

void addStudent() {
  print("Nhập thông tin sinh viên:");
  print("ID: ");
  int id = int.parse(stdin.readLineSync()!);
  print("Tên: ");
  String name = stdin.readLineSync()!;
  print("Lớp: ");
  String className = stdin.readLineSync()!;
  print("Email: ");
  String email = stdin.readLineSync()!;
  Student newStudent = Student(id, name, className, email);
  studentList.add(newStudent);
}

void printStudentInfo(Student student) {
  print("Thông tin sinh viên:");
  print("ID: ${student.id}");
  print("Tên: ${student.name}");
  print("Lớp: ${student.className}");
  print("Email: ${student.email}");
}

void editStudentInfo(Student student) {
  print("Nhập thông tin mới cho sinh viên:");
  print("Tên: ");
  String name = stdin.readLineSync()!;
  print("Lớp: ");
  String className = stdin.readLineSync()!;
  print("Email: ");
  String email = stdin.readLineSync()!;
  student.name = name;
  student.className = className;
  student.email = email;
}

void printAllStudentInfo() {
  if (studentList.isEmpty) {
    print("Danh sách sinh viên trống!");
  } else {
    print("Danh sách sinh viên:");
    // for (Student student in studentList) {
    //   printStudentInfo(student);
    // }
    studentList.forEach((std) {
      printStudentInfo(std);
    });
  }
}

void main() {
  // Student s = Student();
  // s.name = "bbbbbb";
  // printStudentInfo(s);
  addStudent();
  printStudentInfo(studentList.first);
}
