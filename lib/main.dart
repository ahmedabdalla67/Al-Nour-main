import 'package:flutter/material.dart';
import 'package:mesk/core/database/cache/cache_helper.dart';
import 'package:mesk/core/services/service_locator.dart';
import 'package:mesk/core/utils/theme_manager.dart';
import 'package:mesk/features/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIT<CacheHelper>().init();
  runApp(const Mesk());
}

class Mesk extends StatelessWidget {
  const Mesk({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: getApplicationTheme().textTheme),
    );
  }
}
