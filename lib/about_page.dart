import 'package:flutter/material.dart';
import 'package:simple_habits/globals.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('About'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
            Card(
              elevation: 10,
              child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                height: 100,
                child: const Text(
                  'Simple Habits App',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Card(
              elevation: 10,
              child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                height: 100,
                child: const Text(
                  'Version: 1.0.5',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Card(
              elevation: 10,
              child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                height: 100,
                child: const Text(
                  'This app helps you track your daily habits and improve your productivity.',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
