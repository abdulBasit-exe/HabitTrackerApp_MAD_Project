// main.dart

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:simple_habits/homescreen.dart';
import 'package:simple_habits/providers/habit_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HabitProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Simple Habits',
        home: Homescreen(),
      ),
    );
  }
}
