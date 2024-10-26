// create_habit.dart

import 'package:flutter/material.dart';
import 'package:simple_habits/models/habit.dart';
import 'package:simple_habits/db/database_providers.dart';

class CreateHabit extends StatefulWidget {
  final Habit? habit; // Nullable for new habits
  final Function? updateList; // Callback for updating the list

  CreateHabit({Key? key, this.habit, this.updateList}) : super(key: key);

  @override
  _CreateHabitState createState() => _CreateHabitState();
}

class _CreateHabitState extends State<CreateHabit> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _daysController = TextEditingController();
  final TextEditingController _goalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.habit != null) {
      // Pre-fill fields if editing
      _titleController.text = widget.habit!.title;
      _timeController.text = widget.habit!.time;
      _daysController.text = widget.habit!.days;
      _goalController.text = widget.habit!.goal.toString();
    }
  }

  Future<void> _saveHabit() async {
    Habit habit = Habit(
      id: widget.habit?.id ?? 0, // Use 0 for new habits
      title: _titleController.text,
      time: _timeController.text,
      days: _daysController.text,
      goal: int.parse(_goalController.text),
    );

    if (widget.habit == null) {
      // Insert a new habit
      await DatabaseProvider.db.insert(habit); // Ensure DatabaseProvider is a singleton
    } else {
      // Update the existing habit
      await DatabaseProvider.db.update(habit); // Ensure DatabaseProvider is a singleton
    }

    // Call the updateList callback if provided
    if (widget.updateList != null) {
      widget.updateList!();
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.habit == null ? 'Add Habit' : 'Edit Habit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Habit Title'),
            ),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(labelText: 'Time'),
            ),
            TextField(
              controller: _daysController,
              decoration: InputDecoration(labelText: 'Days (comma-separated)'),
            ),
            TextField(
              controller: _goalController,
              decoration: InputDecoration(labelText: 'Goal'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveHabit,
              child: Text(widget.habit == null ? 'Add Habit' : 'Update Habit'),
            ),
          ],
        ),
      ),
    );
  }
}
