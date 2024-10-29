import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class HabitProvider extends ChangeNotifier {
  List _habits = [];

  loadHabits() {
    _habits = jsonDecode(jsonEncode(GetStorage().read("habits") ?? []));
    notifyListeners();
  }

  addHabit(habit) {
    _habits.add(habit);
    notifyListeners();
  }

  getHabits() {
    return _habits;
  }

  updateHabit(habit, index) {
    _habits[index] = habit;
    notifyListeners();
  }
}
