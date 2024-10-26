// main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_habits/bloc/habit_bloc.dart';
import 'package:simple_habits/db/database_providers.dart';
import 'package:simple_habits/habit_list.dart';
import 'package:simple_habits/create_habit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HabitBloc()),
      ],
      child: MaterialApp(
        title: 'Simple Habits',
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _loadHabits();
  }

  void _loadHabits() async {
    List<Habit> habits = await DatabaseProvider().getHabits();
    context.read<HabitBloc>().add(SetHabits(habits));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Habit Tracker'),
      ),
      body: HabitList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateHabit()),
          ).then((_) => _loadHabits());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
