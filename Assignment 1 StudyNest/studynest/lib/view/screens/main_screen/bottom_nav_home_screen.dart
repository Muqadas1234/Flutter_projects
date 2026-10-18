import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:studynest/utils/app_assets.dart';
import 'package:studynest/utils/app_colors.dart';
import 'package:studynest/view/components/custom_button.dart';
import 'package:studynest/view/screens/main_screen/bottom_nav_screen/home_screen.dart';
import 'package:studynest/view/screens/main_screen/bottom_nav_screen/profile_screen.dart';

import '../../../Model/studynest_model.dart';
import '../../../utils/global.dart';

class BottomNavHome extends StatefulWidget {
  const BottomNavHome({super.key});

  @override
  State<BottomNavHome> createState() => _BottomNavHomeState();
}

class _BottomNavHomeState extends State<BottomNavHome> {
  int _selectedIndex = 0;

  TimeOfDay selectedTime = TimeOfDay.now(); // Current time

  DateTime selectedDate = DateTime.now();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override

  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }



  Widget build(BuildContext context) {
    final List<Widget> listOfScreens = [
      HomeScreen(key: UniqueKey()),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: SafeArea(
        child: listOfScreens[_selectedIndex],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // I take this bottomsheet code from flutter website and redesgin it according to figma

          showModalBottomSheet<void>(
            context: context,
            backgroundColor: AppColors.whiteColor,
            builder: (BuildContext context) {


              return SizedBox(
                  width: double.infinity, // 👈 Yeh poori screen ki width dega
                  height: 400,

                child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("New study session", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800,color: AppColors.BlackColor),),

                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.nostudysessionyeticonColor,
                              shape: BoxShape.circle,
                            ),
                            child: CloseButton(
                              color: Colors.black,
                            ),
                          )
                        ],

                      ),

                      // Spacing
                      const SizedBox(height: 16),


                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          hintText: "TITLE",
                          filled: true,
                          fillColor: AppColors.fieldandscreenbackgroundColor,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),


                      const SizedBox(height: 16),


                      TextField(
                        controller: descController,
                        decoration: InputDecoration(
                          hintText: "Description",
                          filled: true,
                          fillColor: AppColors.fieldandscreenbackgroundColor,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //Date picker code , I have taken this fom flutter website
                        children: [
                          Expanded(child:
                          OutlinedButton.icon(
                            icon: const Icon(Icons.calendar_today, size: 12),
                            label: const Text('Select Date'),
                            onPressed: () async {
                              final DateTime? newSelectedDate = await showDialog<DateTime>(
                                context: context,
                                builder: (BuildContext context) {
                                  return DatePickerDialog(
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2021),
                                    lastDate: DateTime(2030),
                                  );
                                },
                              );
                              if (newSelectedDate != null) {
                                setState(() {
                                  selectedDate = newSelectedDate;
                                });
                              }
                            },
                          ),
                          ),
                          
                          //this is a timer picker
                          
                          const SizedBox(width: 14),

                          Expanded(
                            child: OutlinedButton.icon(
                              icon: const Icon(Icons.access_time, size: 12),
                              label: Text(selectedTime.format(context)),
                              onPressed: () async {

                                final TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: selectedTime,
                                );
                                if (pickedTime != null) {
                                  setState(() {
                                    selectedTime = pickedTime;
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      
                      const Spacer(),

                      CustomButton(
                        text: "Add Session",
                        onPressed: () {
                          // 1. Agar Title khali hai toh save mat karo
                          if (titleController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Please enter a title")),
                            );
                            return;
                          }

                          final DateTime sessionDateTime = DateTime(//combine the date and combine together
                            selectedDate.year,
                            selectedDate.month,
                            selectedDate.day,
                            selectedTime.hour,
                            selectedTime.minute,
                          );

                          listOfSessions.add(// it will save the new session in global list
                            UpcomingSession(
                              title: titleController.text.trim(),
                              description: descController.text.trim().isEmpty? "No description" : descController.text.trim(),
                              status: "pending",
                              createdAt: sessionDateTime,
                            ),
                          );
                          titleController.clear();
                          descController.clear();

                          // this code will close the sheet and refresh it.
                          Navigator.pop(context);
                          setState(() {});
                        },
                      ),

                    ],

                  ),

                ),
              );
            },
          );
        },
        backgroundColor: AppColors.loginButtonColor,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: AppColors.BlackColor,
          size: 28,
        ),
      ),






      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.HomeIcon,
              width: 24,
              height: 24,
            ),
            activeIcon: SvgPicture.asset(
              AppAssets.HomeIcon,
              width: 24,
              height: 24,
              color: AppColors.HomeHeaderBackgroundColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.ProfileIcon,
              width: 24,
              height: 24,
            ),
            activeIcon: SvgPicture.asset(
              AppAssets.ProfileIcon,
              width: 24,
              height: 24,
              color: AppColors.HomeHeaderBackgroundColor,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.HomeHeaderBackgroundColor,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}