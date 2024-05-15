import 'package:flutter/material.dart';
import 'package:lesson_36/homeworks/temprature_pzge.dart';
import 'package:lesson_36/homeworks/timer_page.dart';
import 'package:lesson_36/homeworks/todo_page.dart';
import 'package:lesson_36/pages/home_page.dart';
import 'package:lesson_36/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
