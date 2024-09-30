import 'package:go_router/go_router.dart';
import 'package:mesk/features/surah_details/presentation/screens/fehres_of_quran.dart';
import 'package:mesk/features/main_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/',
    builder: (context, state) => const MainScreen(),
    ),
    GoRoute(path: '/fehres',
    builder: (context, state) => const FehresOfQuran(),
    ),
    
  ]
  );