import 'package:flutter/material.dart';
import 'package:wheather_app/screens/Home_screen.dart';
import 'package:wheather_app/screens/screen1.dart';
import 'package:wheather_app/screens/screen2.dart';

void main() {
  runApp(const Climate());
}

class Climate extends StatelessWidget {
  const Climate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Screen1());
  }
}
