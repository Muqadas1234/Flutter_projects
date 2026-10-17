import 'package:flutter/material.dart';

class ExpenseModel {
  final int expenseID;
  final String name;
  final ExpenseCategory category;
  final DateTime createdAt;
  final double expValue;

  const ExpenseModel({
    required this.expenseID,
    required this.name,
    required this.category,
    required this.createdAt,
    required this.expValue,
  });
}

class ExpenseCategory {
  final String name;
  final String icon;
  final Color color;
  bool isSelected;

  ExpenseCategory({
    required this.name,
    required this.icon,
    required this.color,
    this.isSelected = false,
  });
}
