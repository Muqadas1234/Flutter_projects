import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'for_student_add_student.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const StudentApp());
}

class Student {
  int id;
  String name;
  String fatherName;
  List<String>? subjects;

  Student({
    required this.id,
    required this.name,
    required this.fatherName,
    this.subjects,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'fatherName': fatherName,
      'subjects': subjects,
    };
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'] as int,
      name: json['name'] as String,
      fatherName: json['fatherName'] as String,
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((subject) => subject.toString())
          .toList(),
    );
  }
}

class StudentApp extends StatelessWidget {
  const StudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentListScreen(),
    );
  }
}

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() =>
      _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  final GetStorage storage = GetStorage();

  static const String studentsKey = 'students';

  List<Student> students = [
    Student(
      id: 1,
      name: "name1",
      fatherName: "fatherName1",
    ),
    Student(
      id: 2,
      name: "name2",
      fatherName: "fatherName2",
    ),
    Student(
      id: 3,
      name: "name3",
      fatherName: "fatherName3",
    ),
    Student(
      id: 4,
      name: "Muhib",
      fatherName: "Arif",
    ),
  ];

  @override
  void initState() {
    super.initState();
    loadStudents();
  }

  Future<void> loadStudents() async {
    final String? savedData = storage.read<String>(studentsKey);

    if (savedData != null) {
      try {
        final List<dynamic> decodedData = jsonDecode(savedData);

        final List<Student> savedStudents = decodedData.map((item) {
          return Student.fromJson(
            Map<String, dynamic>.from(item as Map),
          );
        }).toList();

        if (!mounted) return;

        setState(() {
          students = savedStudents;
        });
      } catch (error) {
        debugPrint('Error loading students: $error');
      }
    } else {
      await saveStudents();
    }
  }

  Future<void> saveStudents() async {
    final String encodedData = jsonEncode(
      students.map((student) => student.toJson()).toList(),
    );

    await storage.write(studentsKey, encodedData);
  }


  Future<void> addStudent() async {
    final result = await Navigator.push<Student>(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ForStudentAddStudent();
        },
      ),
    );

    if (result != null) {
      setState(() {
        students.add(result);
      });

      await saveStudents();
    }
  }

  // DELETE STUDENT

  Future<void> removeStudent(int index) async {
    setState(() {
      students.removeAt(index);
    });

    await saveStudents();
  }

  // EDIT STUDENT

  Future<void> editStudent(Student studentModelToEdit) async {
    final result = await Navigator.push<Student>(
      context,
      MaterialPageRoute(
        builder: (context) => ForStudentsEditScreen(
          studentModelForEdit: studentModelToEdit,
        ),
      ),
    );

    if (result == null) return;

    final int foundIndex = students.indexWhere(
          (student) => student.id == result.id,
    );

    if (foundIndex == -1) return;

    setState(() {
      students[foundIndex] = result;
    });

    await saveStudents();
  }

  // STUDENT CARD

  Widget myStudentCard({
    required Student student,
    required int index,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // STUDENT INFORMATION

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  student.fatherName,
                ),
                const SizedBox(height: 5),
                Text(
                  "ID: ${student.id}",
                ),
              ],
            ),
          ),

          // EDIT

          InkWell(
            onTap: () {
              editStudent(student);
            },
            child: const Icon(
              Icons.edit,
              color: Colors.blue,
            ),
          ),

          const SizedBox(width: 15),

          // DELETE

          InkWell(
            onTap: () {
              removeStudent(index);
            },
            child: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  // BUILD

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Student Manager",
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: students.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return myStudentCard(
              student: students[index],
              index: index,
            );
          },
        ),
      ),

      // ADD BUTTON

      floatingActionButton: FloatingActionButton(
        onPressed: addStudent,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}