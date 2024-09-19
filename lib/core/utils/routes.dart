import 'package:go_router/go_router.dart';
import 'package:mesk/features/main_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/',
    builder: (context, state) => const MainScreen(),
    ),
    
  ]
  );