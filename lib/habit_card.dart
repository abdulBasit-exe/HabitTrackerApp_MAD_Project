// habit_card.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:simple_habits/bloc/habit_bloc.dart';
import 'package:simple_habits/db/database_providers.dart';
import 'package:simple_habits/globals.dart';
import 'package:simple_habits/models/habit.dart';
import 'package:simple_habits/create_habit.dart';

class HabitCard extends StatelessWidget {
  final Habit habit;

  const HabitCard({Key? key, required this.habit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(habit.title),
          subtitle: Text('Progress: ${habit.progress}/${habit.goal}'),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateHabit(habit: habit),
                ),
              );
            },
          ),
        ),
      ),
      secondaryActions: [
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            context.read<HabitBloc>().add(DeleteHabit(habit.id));
            DatabaseProvider().delete(habit.id);
          },
        ),
      ],
    );
  }
}
