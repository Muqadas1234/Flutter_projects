import 'package:flutter/material.dart';
import 'package:expense_tracker/utils/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.labelColor,
          ),
        ),
        const SizedBox(height: 15),
        TextField(
          obscureText: widget.isPassword ? isPasswordHidden : false,
          decoration: InputDecoration(
            hintText: widget.hintText,
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            filled: true,
            fillColor: AppColors.pureWhiteColor,
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                isPasswordHidden
                    ? Icons.visibility_off
                    : Icons.remove_red_eye,
              ),
              onPressed: () {
                setState(() {
                  isPasswordHidden = !isPasswordHidden;
                });
              },
            )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.greenColor),
            ),
          ),
        ),
      ],
    );
  }
}
