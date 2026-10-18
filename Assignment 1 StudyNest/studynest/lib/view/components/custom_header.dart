import 'package:flutter/material.dart';
import 'package:studynest/utils/app_colors.dart';
import 'package:studynest/utils/global.dart';

class CustomHeader extends StatelessWidget {
  final Widget child;
  final double height;

  const CustomHeader({
    super.key,
    required this.child,
    this.height = 230,
  });

  // Reusable Pill Stat Card Widget
  Widget _statCard(String number, String label) {
    return Expanded(
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: AppColors.HomeHeaderBackgroundColor,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.greytextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Purple Container
        Container(
          height: height,
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
          decoration: const BoxDecoration(
            color: AppColors.HomeHeaderBackgroundColor,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
          ),
          child: child,
        ),

        // 3 Dynamic Stat Cards (Total, Pending, Done)
        Positioned(
          left: 20,
          right: 20,
          bottom: -35,
          child: Row(
            children: [
              _statCard("$totalSessions", "Total"),
              const SizedBox(width: 10),
              _statCard("$pendingSessions", "Pending"),
              const SizedBox(width: 10),
              _statCard("$doneSessions", "Done"),
            ],
          ),
        ),
      ],
    );
  }
}
