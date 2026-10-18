import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:studynest/Model/studynest_model.dart';
import 'package:studynest/utils/app_assets.dart';
import 'package:studynest/utils/app_colors.dart';
import 'package:studynest/utils/global.dart';
import 'package:studynest/view/components/custom_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Single Session Card Widget
  Widget _sessionCard(UpcomingSession session) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                session.title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.BlackColor,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: session.status == 'done'? AppColors.donetextColor.withValues(alpha: 0.12): AppColors.pendingtextColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(session.status == 'done' ? "Done" : "Pending",
                  style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold, color: session.status == 'done'? AppColors.donetextColor: AppColors.pendingtextColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(session.description, style: const TextStyle(fontSize: 13, color: AppColors.greytextColor),),
          const SizedBox(height: 10),

          // Date & Time using your saved SVG assets
          Row(
            children: [
              SvgPicture.asset(AppAssets.calenderIcon,
                width: 14,
                height: 14,
                color:AppColors.greytextColor

              ),
              const SizedBox(width: 5),
              Text(DateFormat('EEE, d MMM').format(session.createdAt),
                style: const TextStyle(fontSize: 12, color: AppColors.greytextColor),
              ),
              const SizedBox(width: 16),
              SvgPicture.asset(AppAssets.timeIcon,
                width: 14,
                height: 14,
                  color:AppColors.greytextColor,

              ),
              const SizedBox(width: 5),
              Text(
                DateFormat('h:mm a').format(session.createdAt),
                style: const TextStyle(fontSize: 12, color: AppColors.greytextColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Empty State Widget (When list is empty)
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: const BoxDecoration(
              color: AppColors.nostudysessionyeticonColor,
              shape: BoxShape.circle,
            ),

              child: Center(
                child: SvgPicture.asset(
                  AppAssets.LoginSignupIcon,
                  color: AppColors.HomeHeaderBackgroundColor,
                  width: 40,
                  height: 40,
                ),
              ),
            ),

          const SizedBox(height: 20),
          const Text("No study sessions yet", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.BlackColor,),),
          const SizedBox(height: 8),
          const Text("Tap the + button to plan your first session.\n(Lottie animation goes here.)",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: AppColors.greytextColor,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fieldandscreenbackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Reusable CustomHeader component
          CustomHeader(
            height: 220,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("StudyNest", style: TextStyle(fontSize: 15, color: AppColors.whiteColor)),
                const SizedBox(height: 4),
                const Text("Hello, Taba!", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: AppColors.whiteColor)),
                const SizedBox(height: 4),
                Text("You have $pendingSessions sessions planned.", style: const TextStyle(fontSize: 13, color: AppColors.whiteColor)),
              ],
            ),
          ),

          const SizedBox(height: 55),

          // If list is empty show empty state, otherwise show ListView
          Expanded(
            child: listOfSessions.isEmpty ? _buildEmptyState() : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Upcoming sessions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: listOfSessions.length,
                    itemBuilder: (context, index) {
                      return _sessionCard(listOfSessions[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}