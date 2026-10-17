import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:expense_tracker/utils/app_assets.dart';
import 'package:expense_tracker/utils/app_colors.dart';
import 'package:expense_tracker/view/components/custom_button.dart';
import 'package:expense_tracker/view/components/custom_text_field.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isChecked=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  border: Border.all(color: AppColors.borderColor),
                ),
                child: SvgPicture.asset(
                  AppAssets.backarrow,
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
              ),
            ),
            const SizedBox(height: 16),

            const Text("Create your account", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: AppColors.darkblueColor,
            ),
            ),
            const SizedBox(height: 8),
            const Text("Back up your expenses and use Kharcha on all your devices.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.labelColor,
            ),
            ),
            const SizedBox(height: 16),

            // Full name field
            const CustomTextField(
              label: "Full Name",
              hintText: "Enter your full name",
            ),

            const SizedBox(height: 16),

            // Email field
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

            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  activeColor: AppColors.greenColor,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    "I agree to the Terms and Privacy Policy.",
                    style: TextStyle(color: AppColors.labelColor, fontSize: 15),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            CustomButton(text: "Create Account",
                onPressed:(){

                }),

            //const Spacer(),
            const SizedBox(height: 24),



            // ================= Already Have Account =================
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      " Login",
                      style: TextStyle(
                        color: AppColors.greenColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
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
