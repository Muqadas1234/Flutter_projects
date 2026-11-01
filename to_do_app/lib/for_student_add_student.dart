import 'dart:math';

import 'package:flutter/material.dart';
import 'main.dart';


class ForStudentAddStudent extends StatefulWidget {
  const ForStudentAddStudent({super.key});

  @override
  State<ForStudentAddStudent> createState() =>
      _ForStudentAddStudentState();
}

class _ForStudentAddStudentState
    extends State<ForStudentAddStudent> {



  final TextEditingController nameController =
  TextEditingController();

  final TextEditingController fatherNameController =
  TextEditingController();


  void saveStudent() {
    final newStudent = Student(
      id: Random().nextInt(1000000),
      name: nameController.text,
      fatherName: fatherNameController.text,
    );

    Navigator.pop(
      context,
      newStudent,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    fatherNameController.dispose();
    super.dispose();
  }

  // BUILD

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Student",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // NAME

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                hintText: "Enter name",
              ),
            ),

            const SizedBox(height: 20),

            // FATHER NAME

            TextField(
              controller: fatherNameController,
              decoration: const InputDecoration(
                labelText: "Father Name",
                hintText: "Enter father name",
              ),
            ),

            const SizedBox(height: 30),

            // ADD BUTTON

            ElevatedButton(
              onPressed: saveStudent,
              child: const Text(
                "Add",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// EDIT STUDENT SCREEN

class ForStudentsEditScreen extends StatefulWidget {

  // WHOLE STUDENT OBJECT

  final Student studentModelForEdit;

  const ForStudentsEditScreen({
    super.key,
    required this.studentModelForEdit,
  });

  @override
  State<ForStudentsEditScreen> createState() =>
      _ForStudentsEditScreenState();
}

class _ForStudentsEditScreenState
    extends State<ForStudentsEditScreen> {

  // CONTROLLERS

  final TextEditingController nameController =
  TextEditingController();

  final TextEditingController fatherNameController =
  TextEditingController();

  // INIT STATE

  @override
  void initState() {
    super.initState();

    nameController.text =
        widget.studentModelForEdit.name;

    fatherNameController.text =
        widget.studentModelForEdit.fatherName;
  }

  // SAVE EDIT STUDENT

  void saveEditStudent() {
    String name = nameController.text;

    String fatherName =
        fatherNameController.text;

    final newStudent = Student(
      id: widget.studentModelForEdit.id,
      name: name,
      fatherName: fatherName,
      subjects: widget.studentModelForEdit.subjects,
    );

    Navigator.pop(
      context,
      newStudent,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    fatherNameController.dispose();
    super.dispose();
  }

  // BUILD

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Student",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // STUDENT ID

            Text(
              "Student ID: ${widget.studentModelForEdit.id}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            // NAME

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
              ),
            ),

            const SizedBox(height: 20),

            // FATHER NAME

            TextField(
              controller: fatherNameController,
              decoration: const InputDecoration(
                labelText: "Father Name",
              ),
            ),

            const SizedBox(height: 30),

            // UPDATE BUTTON

            ElevatedButton(
              onPressed: saveEditStudent,
              child: const Text(
                "Update",
              ),
            ),
          ],
        ),
      ),
    );
  }
}