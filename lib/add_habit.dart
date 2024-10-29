import 'package:flutter/material.dart';
import 'package:simple_habits/controller/habit_controller.dart';

class AddHabit extends StatefulWidget {
  const AddHabit({super.key});

  @override
  State<AddHabit> createState() => _AddHabitState();
}

class _AddHabitState extends State<AddHabit> {
  HabitController controller = HabitController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Add New Habit',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color.fromARGB(255, 48, 48, 48),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Select Frequency",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Checkbox(
                      value: controller.days.contains("Monday"),
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            controller.days.add("Monday");
                          } else {
                            controller.days.remove("Monday");
                          }
                        });
                      }),
                  const Text("Monday"),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: controller.days.contains("Tuesday"),
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            controller.days.add("Tuesday");
                          } else {
                            controller.days.remove("Tuesday");
                          }
                        });
                      }),
                  const Text("Tuesday"),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: controller.days.contains("Wednesday"),
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            controller.days.add("Wednesday");
                          } else {
                            controller.days.remove("Wednesday");
                          }
                        });
                      }),
                  const Text("Wednesday"),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: controller.days.contains("Thursday"),
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            controller.days.add("Thursday");
                          } else {
                            controller.days.remove("Thursday");
                          }
                        });
                      }),
                  const Text("Thursday"),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: controller.days.contains("Friday"),
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            controller.days.add("Friday");
                          } else {
                            controller.days.remove("Friday");
                          }
                        });
                      }),
                  const Text("Friday"),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: controller.days.contains("Saturday"),
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            controller.days.add("Saturday");
                          } else {
                            controller.days.remove("Saturday");
                          }
                        });
                      }),
                  const Text("Saturday"),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: controller.days.contains("Sunday"),
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            controller.days.add("Sunday");
                          } else {
                            controller.days.remove("Sunday");
                          }
                        });
                      }),
                  const Text("Sunday"),
                ],
              ),
              const SizedBox(
                height: 240,
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.addHabit(context);
                    //GetStorage().erase();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 48, 48, 48),
                      foregroundColor: Colors.white,
                      fixedSize: Size(MediaQuery.of(context).size.width, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  child: const Text("Add to Habits"))
            ],
          ),
        ),
      ),
    );
  }
}
