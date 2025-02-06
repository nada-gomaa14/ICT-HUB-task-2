import 'package:flutter/material.dart';
import 'package:task2/screen.dart';


void main() {
  runApp(Task2());
}

class Task2 extends StatelessWidget{
  const Task2({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen(),
    );
  }
}