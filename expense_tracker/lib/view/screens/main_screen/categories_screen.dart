import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/utils/app_colors.dart';
import 'package:expense_tracker/utils/global.dart';
import '../../components/custom_button.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color: AppColors.pureWhiteColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.borderColor),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                        color: AppColors.BlackColor,
                      ),
                    ),
                  ),
                  const Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.BlackColor,
                    ),
                  ),
                  const SizedBox(width: 44),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.pureWhiteColor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.borderColor),
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: listOfExpenses.length,
                          separatorBuilder: (context, index) => const Divider(
                            height: 1,
                            thickness: 0.8,
                            color: AppColors.borderColor,
                          ),
                          itemBuilder: (context, index) {
                            final ExpenseCategory category = listOfExpenses[index].category;

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 44,
                                    height: 44,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: category.color.withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: SvgPicture.asset(
                                      category.icon,
                                      colorFilter: ColorFilter.mode(
                                        category.color,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: Text(
                                      category.name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.BlackColor,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.drag_handle,
                                    color: AppColors.dragHandleColor,
                                    size: 20,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: AppColors.bannerBackgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text(
                          "Tap a category to rename it or change its color and icon. Drag the handle to reorder.",
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.bannerTextColor,
                            height: 1.4,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              CustomButton(
                backgroundColor: AppColors.greenColor,
                text: '+ Add category',
                textColor: AppColors.pureWhiteColor,
                onPressed: () {},
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
