
class UpcomingSession {
  final String title;
  final String description;
  final DateTime createdAt;
  final String status;

  const UpcomingSession({
    required this.title,
    required this.description,
    required this.status,
    required this.createdAt,
  });

  bool get isDone => status == 'done';
}