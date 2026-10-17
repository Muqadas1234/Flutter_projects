import 'dart:math';

import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/utils/app_assets.dart';
import 'package:expense_tracker/utils/app_colors.dart';


final List<ExpenseModel> listOfExpenses = [
  ExpenseModel(
    expenseID: Random().nextInt(1000000),
    name: "Biryani lunch",
    category: ExpenseCategory(
      name: "Food",
      color: AppColors.foodColor,
      icon: AppAssets.foodIcon,
    ),
    createdAt: DateTime.now(),
    expValue: 850.0,
  ),

  ExpenseModel(
    expenseID: Random().nextInt(1000000),
    name: "Careem ride",
    category: ExpenseCategory(
      name: "Transport",
      color: AppColors.transportColor,
      icon: AppAssets.transportIcon,
    ),
    createdAt: DateTime.now(),
    expValue: 620.0,
  ),

  ExpenseModel(
    expenseID: Random().nextInt(1000000),
    name: "Pharmacy",
    category: ExpenseCategory(
      name: "Health",
      color: AppColors.healthColor,
      icon: AppAssets.healthIcon,
    ),
    createdAt: DateTime.now().subtract(
      const Duration(days: 1),
    ),
    expValue: 940.0,
  ),

  ExpenseModel(
    expenseID: Random().nextInt(1000000),
    name: "Daraz order",
    category: ExpenseCategory(
      name: "Shopping",
      color: AppColors.shoppingColor,
      icon: AppAssets.shoppingIcon,
    ),
    createdAt: DateTime.now().subtract(
      const Duration(days: 1),
    ),
    expValue: 3200.0,
  ),

  ExpenseModel(
    expenseID: Random().nextInt(1000000),
    name: "K-Electric bill",
    category: ExpenseCategory(
      name: "Bills",
      color: AppColors.billColor,
      icon: AppAssets.billIcon,
    ),
    createdAt: DateTime.now().subtract(
      const Duration(days: 13),
    ),
    expValue: 7400.0,
  ),

  ExpenseModel(
    expenseID: Random().nextInt(1000000),
    name: "Cinema tickets",
    category: ExpenseCategory(
      name: "Fun",
      color: AppColors.funColor,
      icon: AppAssets.funIcons,
    ),
    createdAt: DateTime.now().subtract(
      const Duration(days: 13),
    ),
    expValue: 1600.0,
  ),
];
