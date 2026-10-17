import 'dart:math';

import 'package:flutter/material.dart';
import 'package:expense_tracker/utils/app_colors.dart';
import 'package:expense_tracker/Model/expense_model.dart';
import 'package:expense_tracker/utils/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'package:intl/intl.dart';

class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({super.key});

  // CHANGE 1: switch methods are not needed anymore, icon and color
  // now come from the category model (category.icon / category.color)
  /*
  String getIcon(ExpenseCategory category) {
    switch (category) {
      case ExpenseCategory.food:
        return AppAssets.foodIcon;
      case ExpenseCategory.transport:
        return AppAssets.transportIcon;
      case ExpenseCategory.bill:
        return AppAssets.billIcon;
      case ExpenseCategory.shopping:
        return AppAssets.shoppingIcon;
      case ExpenseCategory.health:
        return AppAssets.foodIcon; // temporary
      case ExpenseCategory.fun:
        return AppAssets.foodIcon; // temporary
    }
  }

  Color getColor(ExpenseCategory category) {
    switch (category) {
      case ExpenseCategory.food:
        return Colors.orange;
      case ExpenseCategory.transport:
        return Colors.blue;
      case ExpenseCategory.health:
        return Colors.red;
      case ExpenseCategory.shopping:
        return Colors.pink;
      case ExpenseCategory.bill:
        return Colors.purple;
      case ExpenseCategory.fun:
        return Colors.teal;
    }
  }
  */

  // Section widget displaying expenses for a specific period
  Widget buildSection(String title, List<ExpenseModel> items) {
    if (items.isEmpty) return const SizedBox.shrink();

    double total = 0;
    for (final e in items) {
      total += e.expValue;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.BlackColor)),
            Text("Rs ${total.toStringAsFixed(0)}", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.BlackColor)),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.pureWhiteColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            separatorBuilder: (context, index) => Divider(height: 1, color: AppColors.borderColor),
            itemBuilder: (context, index) {
              final item = items[index];
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: item.category.color.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset(
                        item.category.icon,
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(item.category.color, BlendMode.srcIn),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                          Text(
                            "${item.category.name} · ${DateFormat('h:mm a').format(item.createdAt)}",
                            style: TextStyle(fontSize: 12, color: AppColors.labelColor),
                          ),
                        ],
                      ),
                    ),

                    // Amount
                    Text("Rs ${item.expValue.toStringAsFixed(0)}", style: const TextStyle(fontWeight: FontWeight.w700)),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // CHANGE 4: enum values (ExpenseCategory.food ...) no longer exist,
    // so each expense now creates its own ExpenseCategory (name, color, icon)
    /*
    List<ExpenseModel> listOfExpenses = <ExpenseModel>[
      ExpenseModel(name: "Biryani lunch", category: ExpenseCategory.food, createdAt: DateTime.now(), expValue: 850),
      ExpenseModel(name: "Careem ride", category: ExpenseCategory.transport, createdAt: DateTime.now(), expValue: 620),
      ExpenseModel(name: "Pharmacy", category: ExpenseCategory.health, createdAt: DateTime.now().subtract(const Duration(days: 1)), expValue: 940),
      ExpenseModel(name: "Daraz order", category: ExpenseCategory.shopping, createdAt: DateTime.now().subtract(const Duration(days: 1)), expValue: 3200),
      ExpenseModel(name: "K-Electric bill", category: ExpenseCategory.bill, createdAt: DateTime.now().subtract(const Duration(days: 13)), expValue: 7400),
      ExpenseModel(name: "Cinema tickets", category: ExpenseCategory.fun, createdAt: DateTime.now().subtract(const Duration(days: 13)), expValue: 1600),
    ];
    */
    List<ExpenseModel> listOfExpenses = <ExpenseModel>[
      ExpenseModel(
        expenseID: Random().nextInt(1000000),
        name: "Biryani lunch",
        category: ExpenseCategory(
          name: "Food",
          color: AppColors.foodColor,
          icon: AppAssets.foodIcon,
        ),
        createdAt: DateTime.now(),
        expValue: 850,
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
        expValue: 620,
      ),
      ExpenseModel(
        expenseID: Random().nextInt(1000000),
        name: "Pharmacy",
        category: ExpenseCategory(
          name: "Health",
          color: AppColors.healthColor,
          icon: AppAssets.healthIcon,
        ),
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        expValue: 940,
      ),
      ExpenseModel(
        expenseID: Random().nextInt(1000000),
        name: "Daraz order",
        category: ExpenseCategory(
          name: "Shopping",
          color: AppColors.shoppingColor,
          icon: AppAssets.shoppingIcon,
        ),
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        expValue: 3200,
      ),
      ExpenseModel(
        expenseID: Random().nextInt(1000000),
        name: "K-Electric bill",
        category: ExpenseCategory(
          name: "Bills",
          color: AppColors.billColor,
          icon: AppAssets.billIcon,
        ),
        createdAt: DateTime.now().subtract(const Duration(days: 13)),
        expValue: 7400,
      ),
      ExpenseModel(
        expenseID: Random().nextInt(1000000),
        name: "Cinema tickets",
        category: ExpenseCategory(
          name: "Fun",
          color: AppColors.funColor,
          icon: AppAssets.funIcons,
        ),
        createdAt: DateTime.now().subtract(const Duration(days: 13)),
        expValue: 1600,
      ),
    ];

    final now = DateTime.now();
    final todayDate = DateTime(now.year, now.month, now.day);
    int daysAgo(DateTime d) =>
        todayDate.difference(DateTime(d.year, d.month, d.day)).inDays;

    final todayList = listOfExpenses.where((e) => daysAgo(e.createdAt) == 0).toList();
    final yesterdayList = listOfExpenses.where((e) => daysAgo(e.createdAt) == 1).toList();
    final olderList = listOfExpenses.where((e) => daysAgo(e.createdAt) > 1).toList();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Expenses", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28, color: AppColors.BlackColor)),

              const SizedBox(height: 16),

              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  filled: true,
                  fillColor: AppColors.pureWhiteColor,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: AppColors.greenColor),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.chevron_left, color: AppColors.BlackColor, size: 24),
                      const SizedBox(width: 2),
                      Text(
                        DateFormat('MMMM yyyy').format(now),
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.BlackColor),
                      ),
                      const SizedBox(width: 2),
                      const Icon(Icons.chevron_right, color: AppColors.BlackColor, size: 24),
                    ],
                  ),
                  Text(
                    "Total Rs ${listOfExpenses.fold<double>(0, (sum, e) => sum + e.expValue).toStringAsFixed(0)}",
                    style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: AppColors.greenColor),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8,
                  children: [
                    _chip("All", true),
                    _chip("Food", false),
                    _chip("Transport", false),
                    _chip("Bills", false),
                    _chip("Shopping", false),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // ===== 3 sections =====
              buildSection("Today", todayList),
              buildSection("Yesterday", yesterdayList),
              buildSection(
                olderList.isEmpty ? "" : DateFormat('d MMM').format(olderList.first.createdAt),
                olderList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _chip(String title, bool isSelected) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: isSelected ? AppColors.greenColor : Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: AppColors.borderColor),
    ),
    child: Text(
      title,
      style: TextStyle(
        color: isSelected ? Colors.white : AppColors.BlackColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
