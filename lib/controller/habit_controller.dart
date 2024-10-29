import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:simple_habits/providers/habit_provider.dart';
import 'package:intl/intl.dart';

class HabitController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<String> days = [];

  addHabit(context) {
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        days.isEmpty) {
      // show error snackbar
      SnackBar snackBar = const SnackBar(
        content: Text('Please fill all fields'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      // add habit
      GetStorage storage = GetStorage();
      if (storage.read("habits") == null) {
        storage.write("habits", []);
      }
      var habits = jsonDecode(jsonEncode(storage.read("habits")));
      habits.add({
        "title": titleController.text,
        "description": descriptionController.text,
        "days": days,
      });
      storage.write("habits", habits);
      Provider.of<HabitProvider>(context, listen: false).addHabit({
        "title": titleController.text,
        "description": descriptionController.text,
        "days": days,
      });
      // show success snackbar
      SnackBar snackBar = const SnackBar(
        content: Text('Habit added successfully'),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    print(getHabits());
    titleController.clear();
    descriptionController.clear();
    days.clear();
    Navigator.pop(context);
  }

  getHabits() {
    GetStorage storage = GetStorage();
    return storage.read("habits") ?? [];
  }

  completeTask(context, index) {
    GetStorage storage = GetStorage();
    var habits = jsonDecode(jsonEncode(storage.read("habits")));
    habits[index]["completedDay"] =
        DateFormat.EEEE().format(DateTime.now()).toString();
    Provider.of<HabitProvider>(context, listen: false)
        .updateHabit(habits[index], index);
    GetStorage().write("habits", habits);
    print(
        Provider.of<HabitProvider>(context, listen: false).getHabits()[index]);
  }
}
