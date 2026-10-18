import 'package:studynest/Model/studynest_model.dart';

List<UpcomingSession> listOfSessions = [
  UpcomingSession(
    title: "Data Structures revision",
    description: "Chapters 4-5, practice tree problems",
    status: "pending",
    createdAt: DateTime.now(),
  ),
  UpcomingSession(
    title: "Flutter quiz prep",
    description: "Review ListView and Navigator",
    status: "pending",
    createdAt: DateTime.now(),
  ),
  UpcomingSession(
    title: "Calculus problem set",
    description: "Exercise 7.2, questions 1-10",
    status: "done",
    createdAt: DateTime.now(),
  ),
  UpcomingSession(
    title: "Group project meeting",
    description: "Finalize slides with the team",
    status: "pending",
    createdAt: DateTime.now(),
  ),
];

// Global session count getters
int get totalSessions => listOfSessions.length;
int get pendingSessions => listOfSessions.where((s) => s.status == 'pending').length;
int get doneSessions => listOfSessions.where((s) => s.status == 'done').length;
