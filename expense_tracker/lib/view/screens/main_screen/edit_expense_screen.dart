import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/utils/app_colors.dart';
import 'package:expense_tracker/utils/app_assets.dart';
import 'package:expense_tracker/utils/global.dart';

import '../../components/custom_button.dart';

class EditExpenseScreen extends StatelessWidget {
  final ExpenseModel item;
  final VoidCallback? onDelete;

  const EditExpenseScreen({
    super.key,
    required this.item,
    this.onDelete,
  });

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.peachColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.borderColor,
                  ),
                ),
                child: SvgPicture.asset(
                  AppAssets.deleteIcon,
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    AppColors.redColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Delete this Expense',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: const Text(
            'Are you sure you want to delete this expense permanently?',
          ),
          actions: [
            Column(
              children: [
                CustomButton(
                  backgroundColor: AppColors.pureWhiteColor,
                  text: 'Cancel',
                  textColor: AppColors.BlackColor,
                  onPressed: () {
                    Navigator.pop(dialogContext);
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  backgroundColor: AppColors.redColor,
                  text: 'Delete',
                  textColor: AppColors.pureWhiteColor,
                  onPressed: () {
                    listOfExpenses.removeWhere((expense) =>
                    expense.expenseID == item.expenseID,
                    );

                    Navigator.pop(dialogContext);

                    if (onDelete != null) {
                      onDelete!();
                    }

                    Navigator.pop(context, true);
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }



    void _showEditBottomSheet(BuildContext context) {
    final TextEditingController nameController =
        TextEditingController(text: item.name);
    final TextEditingController amountController =
        TextEditingController(text: item.expValue.toStringAsFixed(0));

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparentColor,
      builder: (sheetContext) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(sheetContext).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: AppColors.pureWhiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Edit Expense",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.BlackColor,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(sheetContext),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Expense Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: amountController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Amount (Rs)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  backgroundColor: AppColors.greenColor,
                  text: "Save Changes",
                  textColor: AppColors.pureWhiteColor,
                  onPressed: () {
                    final String newName = nameController.text.trim();
                    final double? newAmount =
                        double.tryParse(amountController.text.trim());

                    if (newName.isEmpty || newAmount == null || newAmount <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please enter valid name and amount"),
                        ),
                      );
                      return;
                    }

                    // Update expense in global list by ID
                    final int index = listOfExpenses.indexWhere(
                      (expense) => expense.expenseID == item.expenseID,
                    );

                    if (index != -1) {
                      listOfExpenses[index] = ExpenseModel(
                        expenseID: item.expenseID,
                        name: newName,
                        category: item.category,
                        createdAt: item.createdAt,
                        expValue: newAmount,
                      );
                    }

                    Navigator.pop(sheetContext);
                    Navigator.pop(context, true);
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppColors.pureWhiteColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.borderColor,
                        ),
                      ),
                      child: SvgPicture.asset(
                        AppAssets.backarrow,
                        width: 20,
                        height: 20,
                        color: AppColors.BlackColor,
                      ),
                    ),
                  ),
                  const Text(
                    'Expense',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showDeleteDialog(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppColors.pureWhiteColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.borderColor,
                        ),
                      ),
                      child: SvgPicture.asset(
                        AppAssets.deleteIcon,
                        width: 24,
                        height: 24,
                        color: AppColors.redColor,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: item.category.color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SvgPicture.asset(
                  item.category.icon,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                item.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(item.category.name),

              const SizedBox(height: 10),

              Text(
                'Rs ${item.expValue.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.borderColor,
                  ),
                ),
                child: Column(
                  children: [
                    _detailRow(
                      'Category',
                      item.category.name,
                    ),
                    const Divider(
                      color: AppColors.borderColor,
                      height: 25,
                      thickness: 0.5,
                    ),
                    _detailRow(
                      'Date',
                      DateFormat('EEEE, d MMM yyyy')
                          .format(item.createdAt),
                    ),
                    const Divider(
                      color: AppColors.borderColor,
                      height: 25,
                      thickness: 0.5,
                    ),
                    _detailRow(
                      'Time',
                      DateFormat('h:mm a')
                          .format(item.createdAt),
                    ),
                    const Divider(
                      color: AppColors.borderColor,
                      height: 25,
                      thickness: 0.5,
                    ),
                    _detailRow('Paid With', 'Cash'),
                    const Divider(
                      color: AppColors.borderColor,
                      height: 25,
                      thickness: 0.5,
                    ),
                    _detailRow(
                      'Note',
                      'Created with Hamza',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

                CustomButton(
                backgroundColor: AppColors.greenColor,
                text: 'Edit Expense',
                textColor: AppColors.pureWhiteColor,
                onPressed: () {
                  _showEditBottomSheet(context);
                },
              ),

              const SizedBox(height: 10),

              CustomButton(
                backgroundColor: AppColors.pureWhiteColor,
                text: 'Delete Expense',
                textColor: AppColors.redColor,
                onPressed: () {
                  _showDeleteDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.labelColor,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.BlackColor,
            ),
          ),
        ),
      ],
    );
  }
}
