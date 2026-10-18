import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studynest/utils/app_assets.dart';
import 'package:studynest/utils/app_colors.dart';
import 'package:studynest/view/components/custom_button.dart';
import 'package:studynest/view/components/custom_header.dart';
import 'package:studynest/view/screens/auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fieldandscreenbackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //these are reusable custom header components created once use again and again

            CustomHeader(
              height: 250,
              child: Column(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                      color: AppColors.loginButtonColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text("TS", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800,color: AppColors.BlackColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),


                  const Text("Taba Sualeh",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800,color: AppColors.whiteColor),),
                  const SizedBox(height: 4),

                  const Text("taba@studynest.app", style: TextStyle(fontSize: 13, color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 55),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Next session container
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Next session", style: TextStyle(fontSize: 14, color: AppColors.greytextColor),),
                        Text("Data Structures revision", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.BlackColor),
                        ),
                      ],
                    ),
                  ),

                  // Completion rate container
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Completion rate", style: TextStyle(fontSize: 14, color: AppColors.greytextColor),
                        ),
                        Text("75%", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.BlackColor),
                        ),
                      ],
                    ),
                  ),

                  // Member since container
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Member since",
                          style: TextStyle(fontSize: 14, color: AppColors.greytextColor),
                        ),
                        Text("Sep 2026",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.BlackColor),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  //  Logout Button with SVG
                  CustomButton(
                    text: "Logout",
                    backgroundColor: Colors.transparent,
                    textColor: AppColors.HomeHeaderBackgroundColor,
                    borderSide: const BorderSide(
                      color: AppColors.HomeHeaderBackgroundColor,
                      width: 1.5,
                    ),
                    icon: SvgPicture.asset(
                      AppAssets.logoutIcon,
                      width: 20,
                      height: 20,
                      color: AppColors.HomeHeaderBackgroundColor,

                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
