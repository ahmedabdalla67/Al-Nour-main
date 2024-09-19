import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesk/core/database/cache/cache_helper.dart';
import 'package:mesk/core/services/service_locator.dart';
import 'package:mesk/core/utils/app_data.dart';
import 'package:mesk/core/utils/bloc_observer.dart';
import 'package:mesk/core/utils/routes.dart';
import 'package:mesk/core/utils/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupServiceLocator();
  await getIT<CacheHelper>().init();
  await AppData.loadAllSurahs();
  runApp(const Mesk());
}

class Mesk extends StatelessWidget {
  const Mesk({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: getApplicationTheme().textTheme),
    );
  }
}
