
import 'package:flutter/material.dart';
import 'package:expense_tracker/Model/expense_model.dart';
import 'package:expense_tracker/utils/app_colors.dart';
import 'package:expense_tracker/utils/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:expense_tracker/view/screens/auth/signup_screen.dart';
import 'package:expense_tracker/view/components/custom_button.dart';
import 'package:expense_tracker/view/components/custom_text_field.dart';

import '../main_screen/bottom_nav_home_screen.dart';

class  LoginScreen  extends StatefulWidget {
  const LoginScreen ({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(



      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: AppColors.greenColor, borderRadius: BorderRadius.circular(10)),


                child: SvgPicture.asset(
                  AppAssets.walletIcon,
                  width: 24,
                  height: 24,
                  color: AppColors.pureWhiteColor,
                ),
              ),

              const SizedBox(height: 10),



              const Text("Welcome Back", style: TextStyle(fontSize: 30,color: AppColors.welcomeColor,fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),

              const Text("Log in to see your expenses on any device.", style: TextStyle(color: AppColors.loginparagraphColor, fontSize: 15, fontWeight: FontWeight.w400),
              ),



              const SizedBox(height: 20),

              //Email field
              const CustomTextField(
                label: "Email",
                hintText: "you@gmail.com",
              ),

              const SizedBox(height: 16),

              // Password field
              const CustomTextField(
                label: "Password",
                hintText: "Enter your password",
                isPassword: true,
              ),


              const SizedBox(height: 16),

              //forgot passowrd text

              Align(
                alignment: Alignment.centerRight,
                child: Text("Forgot Password",style: TextStyle(color: AppColors.greenColor,fontSize: 14, fontWeight: FontWeight.w700)),),

              const SizedBox(height: 16),

              //Login button

              CustomButton(text: "Login", onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contexst) => const BottomNavHome(),
                  ),
                );
              },),



              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: Divider(
                    indent: 12,
                    endIndent: 12,
                    color: AppColors.labelColor,
                  )),

                  const Text("OR", style:TextStyle(fontSize: 13, fontWeight: FontWeight(600)),),

                  Expanded(child: Divider(indent: 12, endIndent: 12,color: AppColors.labelColor),),
                ],
              ),

              const SizedBox(height: 16),

              //continue with google, we can also do this with sizedbox

              CustomButton(text: "Continue with Google", onPressed:(){

              }),

              const SizedBox(height: 40),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Have Account?", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.labelColor),),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },

                      child: const Text("Login", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600,color: AppColors.greenColor),),

                    )
                  ],
                ),
              )

            ],

          ),


        ), ),
    );
  }
}
