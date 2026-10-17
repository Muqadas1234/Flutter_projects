import 'package:flutter/material.dart';
import 'package:expense_tracker/utils/app_colors.dart';
import 'package:expense_tracker/view/screens/main_screen/monthly_budget_screen.dart';
import 'package:expense_tracker/view/screens/main_screen/categories_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool light = false;
  bool light2 = true;

  Widget _actionRow(
      String title,
      IconData icon, {
        Color color = AppColors.BlackColor,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          Icon(icon, color: color, size: 22),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 6,
            right: 6,
            top: 6,
          ),
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.BlackColor,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Profile card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(23),
                      border: Border.all(
                        color: AppColors.pureWhiteColor,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 58,
                          height: 58,
                          decoration: const BoxDecoration(
                            color: Color(0xFFDDF3EB),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              'A',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: AppColors.greenColor,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 14),

                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Ayesha",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF152235),
                                ),
                              ),
                              Text(
                                "Data saved on this device",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.labelColor,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const Text(
                          "Edit",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: AppColors.greenColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    "Preferences",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.labelColor,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Preferences card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(23),
                      border: Border.all(
                        color: AppColors.pureWhiteColor,
                      ),
                    ),
                    child: Column(
                      children: [
                        // Currency
                        const Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Currency",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: AppColors.BlackColor,
                              ),
                            ),
                            Text(
                              "Pakistani Rupee (Rs)",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: AppColors.labelColor,
                              ),
                            ),
                          ],
                        ),

                        const Divider(
                          color: AppColors.borderColor,
                          height: 28,
                        ),

                        // Monthly budget
                        InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const MonthlyBudgetScreen(),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Monthly budget",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.BlackColor,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Rs 60,000",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.labelColor,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.chevron_right,
                                  color: AppColors.BlackColor,
                                ),
                              ],
                            ),
                          ),
                        ),

                        const Divider(
                          color: AppColors.borderColor,
                          height: 28,
                        ),

                        // Categories
                        InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const CategoriesScreen(),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Categories",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.BlackColor,
                                    ),
                                  ),
                                ),
                                Text(
                                  "8",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.labelColor,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.chevron_right,
                                  color: AppColors.BlackColor,
                                ),
                              ],
                            ),
                          ),
                        ),

                        const Divider(
                          color: AppColors.borderColor,
                          height: 28,
                        ),

                        // Dark Mode
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Dark Mode",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: AppColors.BlackColor,
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

                        const Divider(
                          color: AppColors.borderColor,
                          height: 28,
                        ),

                        // Daily reminder
                        Row(
                          children: [
                            const Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Daily reminder",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.BlackColor,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "Every day at 9:00 PM",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: AppColors.labelColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 10),

                            Switch(
                              value: light2,
                              activeThumbColor: AppColors.greenColor,
                              onChanged: (bool value) {
                                setState(() {
                                  light2 = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Other settings
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(23),
                      border: Border.all(
                        color: AppColors.pureWhiteColor,
                      ),
                    ),
                    child: Column(
                      children: [
                        _actionRow(
                          "Export as CSV",
                          Icons.file_download_outlined,
                        ),

                        const Divider(
                          height: 1,
                          color: AppColors.borderColor,
                        ),

                        _actionRow(
                          "Log out",
                          Icons.logout,
                        ),

                        const Divider(
                          height: 1,
                          color: AppColors.borderColor,
                        ),

                        _actionRow(
                          "Delete all data",
                          Icons.delete_outline,
                          color: AppColors.redColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
