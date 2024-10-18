import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesk/core/database/cache/cache_helper.dart';
import 'package:mesk/core/services/service_locator.dart';
import 'package:mesk/core/utils/app_data.dart';
import 'package:mesk/core/utils/bloc_observer.dart';
import 'package:mesk/core/utils/routes.dart';
import 'package:mesk/core/utils/theme_manager.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
      builder: (context, child) {
        return ResponsiveBreakpoints.builder(
          child: child!, 
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
          breakpointsLandscape: [
            const Breakpoint(start: 0, end: 1023, name: MOBILE),
            const Breakpoint(start: 1024, end: 1599, name: TABLET),
            const Breakpoint(start: 1600, end: double.infinity, name: DESKTOP),
          ],
        );
      },
      
    );
  }
}
