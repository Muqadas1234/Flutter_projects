import 'package:flutter/material.dart';
import 'package:expense_tracker/utils/app_assets.dart';
import 'package:expense_tracker/utils/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../components/custom_button.dart';

class MonthlyBudgetScreen extends StatefulWidget {
  const MonthlyBudgetScreen({super.key});

  @override
  State<MonthlyBudgetScreen> createState() =>
      _MonthlyBudgetScreenState();
}

class _MonthlyBudgetScreenState extends State<MonthlyBudgetScreen> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
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
                        width: 24,
                        height: 24,
                        color: AppColors.BlackColor,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Monthly budget",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: AppColors.BlackColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 54),
                ],
              ),

              const SizedBox(height: 16),

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
                    const Text(
                      "Total budget for October",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.pureWhiteColor,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Rs 60,000",
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w800,
                        color: AppColors.pureWhiteColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Rs 51,000 given to categories · Rs 9,000 not assigned",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.pureWhiteColor,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),


              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.pureWhiteColor,
                  border: Border.all(
                    color: AppColors.borderColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Warn me at 80%",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: AppColors.BlackColor,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Get a nudge before you overspend",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: AppColors.BlackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                      value: light,
                      activeThumbColor: AppColors.greenColor,
                      onChanged: (bool value) {
                        setState(() {
                          light = value;
                        });
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.pureWhiteColor,
                  border: Border.all(
                    color: AppColors.borderColor,
                  ),
                ),
                child: Column(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Food",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.BlackColor,
                          ),
                        ),
                        const Text(
                          "Rs 11,600 / 15,000",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.BlackColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: 11600 / 15000,
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.greenColor,
                      backgroundColor: AppColors.borderColor,
                    ),

                    const SizedBox(height: 16),
                    const Divider(color: AppColors.borderColor),
                    const SizedBox(height: 16),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Bills",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.BlackColor,
                          ),
                        ),
                        const Text(
                          "Rs 12,800 / 14,000",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.BlackColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: 8000 / 10000,
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.redColor,
                      backgroundColor: AppColors.borderColor,
                    ),

                    const SizedBox(height: 16),
                    const Divider(color: AppColors.borderColor),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Transport",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.BlackColor,
                          ),
                        ),
                        const Text(
                          "Rs 5,200 / 6,000",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.BlackColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: 3000 / 5000,
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.greenColor,
                      backgroundColor: AppColors.borderColor,
                    ),

                    const SizedBox(height: 16),
                    const Divider(color: AppColors.borderColor),
                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Shopping",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.BlackColor,
                          ),
                        ),
                        const Text(
                          "Rs 4,800 / 8,000",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.BlackColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: 5000 / 10000,
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.greenColor,
                      backgroundColor: AppColors.borderColor,
                    ),

                    const SizedBox(height: 16),
                    const Divider(color: AppColors.borderColor),
                    const SizedBox(height: 16),

                    // Health
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Health",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.BlackColor,
                          ),
                        ),
                        const Text(
                          "Rs 2,400 / 4,000",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.BlackColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: 2000 / 5000,
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.greenColor,
                      backgroundColor: AppColors.pureWhiteColor,
                    ),

                    const SizedBox(height: 16),
                    const Divider(color: AppColors.borderColor),
                    const SizedBox(height: 16),

                    // Fun
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Fun",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.BlackColor,
                          ),
                        ),
                        const Text(
                          "Rs 3,200 / 4,000",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.BlackColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: 1500 / 6000,
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.redColor,
                      backgroundColor: AppColors.pureWhiteColor,
                    ),



                  ],
                ),
              ),

              const SizedBox(height: 16),
              CustomButton(
                backgroundColor: AppColors.greenColor,
                text: 'Save Budget',
                textColor: AppColors.pureWhiteColor, onPressed: () {

              },
                //onPressed(){
              ),
            ],
          ),
        ),
      ),
    );
  }
}
