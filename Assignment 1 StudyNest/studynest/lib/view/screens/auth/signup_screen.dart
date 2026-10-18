import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../../../utils/app_assets.dart';

import '../../../utils/app_colors.dart';
import '../../components/custom_button.dart';
import '../../components/custom_text_field.dart';
import 'login_screen.dart';
class SignupScreen extends StatelessWidget {
  const SignupScreen ({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.loginbackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 40),

              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.loginSignupIconColor,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppAssets.LoginSignupIcon,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              Text("StudyNest", style: TextStyle(fontWeight: FontWeight.w800,fontSize: 17,color: AppColors.whiteColor),),

              const SizedBox(height: 14),

              Text("Welcome back! Plan your study sessions and\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t  \t\t\stay on track.", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: AppColors.whiteColor),),

              const SizedBox(height: 16),
              const CustomTextField(
                //label: "Email",
                hintText: "Name",
              ),
              const SizedBox(height: 16),


              const CustomTextField(
                //label: "Email",
                hintText: "you@gmail.com",
              ),
              const SizedBox(height: 16),

              const CustomTextField(
                //label: "Password",
                hintText: "Enter your password",
                isPassword: true,
              ),


              const SizedBox(height: 16),

              Align(
                alignment: Alignment.centerRight,
                child: Text("Forgot Password?",style: TextStyle(color: AppColors.whiteColor,fontSize: 14, fontWeight: FontWeight.w700)),),

              const SizedBox(height: 16),

              CustomButton(text: "Signup", //textColor: AppColors.whiteColor, backgroundColor: AppColors.loginButtonColor,
                onPressed: () {  },),
              /*onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contexst) => const LoginScreen(),
                  ),
                );
              },*/

              const SizedBox(height: 16),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an Account ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.whiteColor,),),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text("Login",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
