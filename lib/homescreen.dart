import 'package:flutter/material.dart';
import 'package:simple_habits/add_habit.dart';
import 'package:simple_habits/providers/habit_provider.dart';
import 'package:simple_habits/habit_description.dart'; // Add this import
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<HabitProvider>(context).loadHabits();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Simple Habits',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color.fromARGB(255, 48, 48, 48),
      ),
      body: ListView.builder(
          itemCount: Provider.of<HabitProvider>(context).getHabits().length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return HabitDescription(habitIndex: index);
                }));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(162, 205, 205, 205),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  Provider.of<HabitProvider>(context).getHabits()[index]
                      ["title"],
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(235, 71, 71, 71),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const AddHabit();
          }));
        },
        backgroundColor: const Color.fromARGB(255, 48, 48, 48),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
