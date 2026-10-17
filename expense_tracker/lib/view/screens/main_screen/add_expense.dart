import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'package:expense_tracker/utils/app_assets.dart';
import 'package:expense_tracker/utils/app_colors.dart';
import 'package:expense_tracker/utils/global.dart';
import 'package:expense_tracker/model/expense_model.dart';

import '../../components/custom_button.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  DateTime selectedDate = DateTime.now();
  String formattedDate = "Select Date";

  final TextEditingController amountController =
  TextEditingController();

  final TextEditingController nameController =
  TextEditingController();

  final TextEditingController noteController =
  TextEditingController();

  late ExpenseCategory selectedCategory;
  late List<ExpenseCategory> listOfCategories;

  @override
  void initState() {
    super.initState();

    listOfCategories = [
      ExpenseCategory(
        name: "Food",
        icon: AppAssets.foodIcon,
        color: AppColors.foodColor,
      ),
      ExpenseCategory(
        name: "Transport",
        icon: AppAssets.transportIcon,
        color: AppColors.transportColor,
      ),
      ExpenseCategory(
        name: "Bills",
        icon: AppAssets.billIcon,
        color: AppColors.billColor,
      ),
      ExpenseCategory(
        name: "Shopping",
        icon: AppAssets.shoppingIcon,
        color: AppColors.shoppingColor,
      ),
      ExpenseCategory(
        name: "Health",
        icon: AppAssets.healthIcon,
        color: AppColors.healthColor,
      ),
      ExpenseCategory(
        name: "Fun",
        icon: AppAssets.funIcons,
        color: AppColors.funColor,
      ),
    ];

    selectedCategory = listOfCategories[0];
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          DateTime.now().hour,
          DateTime.now().minute,
        );

        formattedDate =
            DateFormat('yyyy-MMM-dd').format(pickedDate);
      });
    }
  }

  void showGridViewBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Container(
              height: 500,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: AppColors.pureWhiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Choose category",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.BlackColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(sheetContext);
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: GridView.builder(
                      itemCount: listOfCategories.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.0,
                      ),
                      itemBuilder: (context, index) {
                        final category =
                        listOfCategories[index];

                        final bool isSelected =
                            selectedCategory.name ==
                                category.name;

                        return InkWell(
                          borderRadius:
                          BorderRadius.circular(16),
                          onTap: () {
                            setSheetState(() {
                              selectedCategory = category;
                            });

                            setState(() {
                              selectedCategory = category;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.greenColor
                                  .withValues(alpha: 0.12)
                                  : AppColors.pureWhiteColor,
                              borderRadius:
                              BorderRadius.circular(16),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.greenColor
                                    : AppColors.borderColor,
                                width: isSelected ? 1.5 : 1,
                              ),
                            ),
                            child: Stack(
                              children: [
                                if (isSelected)
                                  Positioned(
                                    top: 5,
                                    right: 5,
                                    child: Container(
                                      padding:
                                      const EdgeInsets.all(2),
                                      decoration:
                                      const BoxDecoration(
                                        color:
                                        AppColors.greenColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.check,
                                        color: AppColors
                                            .pureWhiteColor,
                                        size: 12,
                                      ),
                                    ),
                                  ),
                                Center(
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding:
                                        const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: category.color
                                              .withValues(alpha: 0.15),
                                          borderRadius:
                                          BorderRadius.circular(12),
                                        ),
                                        child: SvgPicture.asset(
                                          category.icon,
                                          width: 22,
                                          height: 22,
                                        ),
                                      ),
                                      const SizedBox(height: 7),
                                      Text(
                                        category.name,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight:
                                          FontWeight.w600,
                                          color:
                                          AppColors.BlackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomButton(
                    backgroundColor: AppColors.greenColor,
                    text: "Done",
                    textColor: AppColors.pureWhiteColor,
                    onPressed: () {
                      Navigator.pop(sheetContext);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // Add Expense To Global List
  void addExpenseToList() {
    final String expenseName =
    nameController.text.trim();

    final String amountText =
    amountController.text.trim();

    if (expenseName.isEmpty || amountText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please enter expense name and amount",
          ),
        ),
      );
      return;
    }

    final double? amount = double.tryParse(amountText);

    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a valid amount"),
        ),
      );
      return;
    }

    // Fixed: expenseID added
    listOfExpenses.add(
      ExpenseModel(
        expenseID: Random().nextInt(1000000),
        name: expenseName,
        category: selectedCategory,
        createdAt: selectedDate,
        expValue: amount,
      ),
    );

    Navigator.pop(context, true);
  }

  @override
  void dispose() {
    amountController.dispose();
    nameController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.pureWhiteColor,
                        border: Border.all(
                          color: AppColors.borderColor,
                        ),
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 20,
                        color: AppColors.BlackColor,
                      ),
                    ),
                  ),
                  const Text(
                    "Add expense",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.BlackColor,
                    ),
                  ),
                  const SizedBox(width: 44),
                ],
              ),

              const SizedBox(height: 24),

              const Text(
                "Amount",
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.labelColor,
                ),
              ),

              const SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Rs",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.BlackColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 180,
                    height: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.pureWhiteColor,
                      border: Border.all(
                        color: AppColors.borderColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: amountController,
                      keyboardType:
                      const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                      decoration: const InputDecoration(
                        hintText: "0",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.pureWhiteColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.borderColor,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 70,
                          child: Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.labelColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              hintText: "Biryani lunch",
                              border: InputBorder.none,
                              contentPadding:
                              EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Divider(color: AppColors.borderColor),

                    InkWell(
                      onTap: showGridViewBottomSheet,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 70,
                            child: Text(
                              "Category",
                              style: TextStyle(
                                color: AppColors.labelColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: selectedCategory.color
                                  .withValues(alpha: 0.15),
                              borderRadius:
                              BorderRadius.circular(12),
                            ),
                            child: SvgPicture.asset(
                              selectedCategory.icon,
                              width: 24,
                              height: 24,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              selectedCategory.name,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: AppColors.BlackColor,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: AppColors.BlackColor,
                          ),
                        ],
                      ),
                    ),

                    Divider(color: AppColors.borderColor),

                    Row(
                      children: [
                        const SizedBox(
                          width: 70,
                          child: Text(
                            "Date",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.labelColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: _selectDate,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    formattedDate,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.BlackColor,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.chevron_right,
                                  color: AppColors.BlackColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    Divider(color: AppColors.borderColor),

                    Row(
                      children: [
                        const SizedBox(
                          width: 70,
                          child: Text(
                            "Note",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.labelColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: noteController,
                            decoration: const InputDecoration(
                              hintText: "Lunch with Humza",
                              border: InputBorder.none,
                              contentPadding:
                              EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(),

              CustomButton(
                backgroundColor: AppColors.greenColor,
                text: 'Save Expense',
                textColor: AppColors.pureWhiteColor,
                onPressed: addExpenseToList,
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
