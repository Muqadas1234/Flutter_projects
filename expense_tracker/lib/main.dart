import 'package:flutter/material.dart';
import 'package:expense_tracker/view/screens/auth/login_screen.dart';
import 'package:expense_tracker/view/screens/auth/signup_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',



      home: const LoginScreen(),
    );
  }
}
