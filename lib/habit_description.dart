import 'package:flutter/material.dart';

import 'package:simple_habits/controller/habit_controller.dart';
import 'package:simple_habits/providers/habit_provider.dart';
import 'package:provider/provider.dart';

class HabitDescription extends StatelessWidget {
  const HabitDescription({super.key, required this.habitIndex});

  final int habitIndex;
  @override
  Widget build(BuildContext context) {
    var controller = HabitController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Habit Description',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color.fromARGB(255, 48, 48, 48),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Text(
              Provider.of<HabitProvider>(context).getHabits()[habitIndex]
                  ["title"],
              style: const TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 48, 48, 48),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
            child: Text(
              Provider.of<HabitProvider>(context).getHabits()[habitIndex]
                  ["description"],
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 137, 137, 137),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Provider.of<HabitProvider>(context)
                                  .getHabits()[habitIndex]["completedDay"] ==
                              "Monday"
                          ? Colors.green
                          : Colors.grey,
                    ),
                    SizedBox(width: 8.0),
                    Text('Monday', style: TextStyle(fontSize: 16))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Provider.of<HabitProvider>(context)
                                  .getHabits()[habitIndex]["completedDay"] ==
                              "Tuesday"
                          ? Colors.green
                          : Colors.grey,
                    ),
                    SizedBox(width: 8.0),
                    Text('Tuesday', style: TextStyle(fontSize: 16))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Provider.of<HabitProvider>(context)
                                  .getHabits()[habitIndex]["completedDay"] ==
                              "Wednesday"
                          ? Colors.green
                          : Colors.grey,
                    ),
                    SizedBox(width: 8.0),
                    Text('Wednesday', style: TextStyle(fontSize: 16))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Provider.of<HabitProvider>(context)
                                  .getHabits()[habitIndex]["completedDay"] ==
                              "Thursday"
                          ? Colors.green
                          : Colors.grey,
                    ),
                    SizedBox(width: 8.0),
                    Text('Thursday', style: TextStyle(fontSize: 16))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Provider.of<HabitProvider>(context)
                                  .getHabits()[habitIndex]["completedDay"] ==
                              "Friday"
                          ? Colors.green
                          : Colors.grey,
                    ),
                    SizedBox(width: 8.0),
                    Text('Friday', style: TextStyle(fontSize: 16))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Provider.of<HabitProvider>(context)
                                  .getHabits()[habitIndex]["completedDay"] ==
                              "Saturday"
                          ? Colors.green
                          : Colors.grey,
                    ),
                    SizedBox(width: 8.0),
                    Text('Saturday', style: TextStyle(fontSize: 16))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Provider.of<HabitProvider>(context)
                                  .getHabits()[habitIndex]["completedDay"] ==
                              "Sunday"
                          ? Colors.green
                          : Colors.grey,
                    ),
                    SizedBox(width: 8.0),
                    Text('Sunday', style: TextStyle(fontSize: 16))
                  ],
                )
              ],
            ),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.completeTask(context, habitIndex);
        },
        backgroundColor: const Color.fromARGB(255, 48, 48, 48),
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }
}
