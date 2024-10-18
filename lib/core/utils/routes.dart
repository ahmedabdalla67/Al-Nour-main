import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mesk/features/azkari/domain/Entities/sub_entities/category_group_entity.dart';
import 'package:mesk/features/azkari/presentation/screens/azkar_screen.dart';
import 'package:mesk/features/azkari/presentation/screens/zekr_details_screen.dart';
import 'package:mesk/features/surah_details/presentation/screens/fehres_of_quran.dart';
import 'package:mesk/features/main_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/',
      pageBuilder: (context, state) => MaterialPage(
        child: wrapWithResponsiveScaling(context, const MainScreen(),
        ),
      ),
    ),
    GoRoute(path: '/fehres',
      pageBuilder: (context, state) => MaterialPage(child: wrapWithResponsiveScaling(
        context, 
        const FehresOfQuran(),
        ),
      ),
    ),
    GoRoute(path: '/azkar',
      pageBuilder: (context, state) => MaterialPage(child:  wrapWithResponsiveScaling(
        context, 
        const AzkarScreen(),
        ),
      ),
    ),
    GoRoute(path: '/zekrDetails',
      pageBuilder: (context, state) {
        final categoryGroup = state.extra as CategoryGroupEntity;
        return  MaterialPage(child: wrapWithResponsiveScaling(
          context, 
          ZekrDetailsScreen(categoryGroup: categoryGroup,),
          ),
        );
      },
    ) 
    
  ]
  );

  Widget wrapWithResponsiveScaling (BuildContext context, Widget child){
    return ResponsiveScaledBox(
      width: ResponsiveValue<double>(context, conditionalValues: [
        const Condition.between(start: 0, end: 450, value: 375),
        const Condition.between(start: 450, end: 800, value: 500),
        const Condition.between(start: 800, end: 1100, value: 600),
        const Condition.between(start: 1100, end: 1400, value: 680),
        const Condition.between(start: 1400, end: 9999, value: 900),
      ]).value, 
      child: child,
    );
  }