// models/habit.dart

class Habit {
  final int id;
  final String title;
  final String time;
  final String days; // Comma-separated values representing selected days
  final int goal;
  int progress;
  bool isDone;
  bool reminders;

  Habit({
    required this.id,
    required this.title,
    required this.time,
    required this.days,
    required this.goal,
    this.progress = 0,
    this.isDone = false,
    this.reminders = false,
  });

  // Convert a Habit object into a Map object for database storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'time': time,
      'days': days,
      'goal': goal,
      'progress': progress,
      'isDone': isDone ? 1 : 0,
      'reminders': reminders ? 1 : 0,
    };
  }

  // Convert a Map object back into a Habit object
  static Habit fromMap(Map<String, dynamic> map) {
    return Habit(
      id: map['id'],
      title: map['title'],
      time: map['time'],
      days: map['days'],
      goal: map['goal'],
      progress: map['progress'],
      isDone: map['isDone'] == 1,
      reminders: map['reminders'] == 1,
    );
  }
}
