import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timer/screen/time_up.dart';
import 'package:timer/screen/timer_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimerHome(),
    );
  }
}
