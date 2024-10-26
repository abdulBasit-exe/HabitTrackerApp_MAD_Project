// habit_list.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_habits/bloc/habit_bloc.dart';
import 'package:simple_habits/db/database_providers.dart';
import 'package:simple_habits/models/habit.dart';
import 'package:simple_habits/habit_card.dart';

class HabitList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitBloc, HabitState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.habits.length,
          itemBuilder: (context, index) {
            return HabitCard(habit: state.habits[index]);
          },
        );
      },
    );
  }
}
