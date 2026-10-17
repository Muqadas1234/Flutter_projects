import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'package:expense_tracker/view/screens/main_screen/add_expense.dart';

import 'package:expense_tracker/utils/app_assets.dart';
import 'package:expense_tracker/utils/app_colors.dart';

import 'package:expense_tracker/view/screens/main_screen/bottom_nav_screen/expense_screen.dart';
import 'package:expense_tracker/view/screens/main_screen/bottom_nav_screen/home_screen.dart';
import 'package:expense_tracker/view/screens/main_screen/bottom_nav_screen/setting_screen.dart';
import 'package:expense_tracker/view/screens/main_screen/bottom_nav_screen/summary_screen.dart';
import 'package:expense_tracker/utils/global.dart';

class BottomNavHome extends StatefulWidget {
  const BottomNavHome({super.key});

  @override
  State<BottomNavHome> createState() => _BottomNavHomeState();
}

class _BottomNavHomeState extends State<BottomNavHome> {
  int _selectedIndex = 0;

  late List<Widget> listOfScreens;

  @override
  void initState() {
    super.initState();

    listOfScreens = [
      const HomeScreen(),
      const SummaryScreen(),
      const SettingScreen(),
    ];
  }

  void _onItemTapped(int index) {
    if (index >= listOfScreens.length) {
      return;
    }

    setState(() {
      _selectedIndex = index;
    });
  }

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
      setState(() {
        listOfScreens[0] = HomeScreen(key: UniqueKey());
        _selectedIndex = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listOfScreens[_selectedIndex],

      floatingActionButton: InkWell(
        onTap: _openAddExpense,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.greenColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.add,
            color: AppColors.pureWhiteColor,
            size: 30,
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.homeIcon),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.summaryIcon),
            label: 'Summary',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.settingIcon),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.greenColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
