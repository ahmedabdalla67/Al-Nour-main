import 'package:flutter/material.dart';
import 'package:mesk/core/utils/theme_manager.dart';
import 'package:mesk/features/main_screen.dart';

void main() {
  runApp(const Mesk());
}

class Mesk extends StatelessWidget {
  const Mesk({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: getApplicationTheme().textTheme
      ),
    );
  }
}