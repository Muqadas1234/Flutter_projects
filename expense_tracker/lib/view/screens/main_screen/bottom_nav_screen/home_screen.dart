
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/utils/app_assets.dart';
import 'package:expense_tracker/utils/app_colors.dart';
import 'package:expense_tracker/utils/global.dart';
import 'package:expense_tracker/view/screens/main_screen/add_expense.dart';
import 'package:expense_tracker/view/screens/main_screen/edit_expense_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Open Add Expense Screen
  Future<void> _openAddExpense() async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => const AddExpenseScreen(),
      ),
    );

    if (!mounted) return;

    if (result == true) {
      setState(() {});
    }
  }

  // Expense Icon Container
  Widget _iconContainer(ExpenseCategory category) {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: category.color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SvgPicture.asset(
        category.icon,
        colorFilter: ColorFilter.mode(
          category.color,
          BlendMode.srcIn,
        ),
        fit: BoxFit.contain,
      ),
    );
  }

  // Open Expense Details
  Future<void> _openExpenseDetails(ExpenseModel item) async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => EditExpenseScreen(item: item),
      ),
    );

    if (!mounted) return;

    if (result == true) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Morning",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.labelColor,
                        ),
                      ),
                      Text(
                        "Ayesha",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: AppColors.BlackColor,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.borderColor,
                      ),
                      color: AppColors.pureWhiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "A",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: AppColors.greenColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Monthly Budget Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.greenColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "October Spending",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.pureWhiteColor,
                      ),
                    ),
                    Text(
                      "Rs 40,000",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: AppColors.pureWhiteColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    LinearProgressIndicator(
                      value: 40000 / 60000,
                      color: AppColors.pureWhiteColor,
                      backgroundColor:
                      AppColors.pureWhiteColor.withValues(alpha: 0.2),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "67% of Rs 60,000 budget",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.pureWhiteColor,
                          ),
                        ),
                        Text(
                          "Rs 20,000 left",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.pureWhiteColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Recent Expenses Heading
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: AppColors.BlackColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: AppColors.greenColor,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Expenses List
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.pureWhiteColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.borderColor,
                  ),
                ),
                child: listOfExpenses.isEmpty
                    ? const Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(
                    child: Text("No expenses yet"),
                  ),
                )
                    : ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listOfExpenses.length,
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 1,
                      indent: 12,
                      endIndent: 12,
                      color: AppColors.borderColor,
                    );
                  },
                  itemBuilder: (context, index) {
                    final item = listOfExpenses[index];

                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          _openExpenseDetails(item);
                        },
                        child: Row(
                          children: [
                            _iconContainer(item.category),

                            const SizedBox(width: 12),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "${item.category.name} · "
                                        "${DateFormat('d MMM, h:mm a').format(item.createdAt)}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.labelColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 8),

                            Text(
                              "Rs ${item.expValue.toStringAsFixed(0)}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Add Expense Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: _openAddExpense,
                  icon: const Icon(Icons.add),
                  label: const Text(
                    "Add Expense",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.greenColor,
                    foregroundColor: AppColors.pureWhiteColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
