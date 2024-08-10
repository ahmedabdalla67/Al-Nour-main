import 'package:flutter/material.dart';
import 'package:mesk/core/utils/colors.dart';
import 'package:mesk/features/home/presentation/screens/home_screen.dart';
import 'package:mesk/features/quran/presentation/screens/quran_screen.dart';
import 'package:mesk/features/settings/presentation/screens/settings_screen.dart';
import 'package:mesk/features/timing/presentation/screens/timing_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<Widget> screens = [
    const HomeScreen(),
    const QuranScreen(),
    const TimingScreen(),
    const SettingsScreen(),
  ];

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 60,
        backgroundColor: ManageColors.primary,
        onDestinationSelected: (int index){
          setState(() {
            currentPageIndex = index; 
          });
        },
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, color: ManageColors.selectedTab,),
            selectedIcon: Icon(Icons.home_filled),
             label: 'الرئيسية',
             ),
             NavigationDestination(
            icon: Icon(Icons.library_books_outlined, color: ManageColors.selectedTab,),
            selectedIcon: Icon(Icons.library_books),
            
             label: 'القراّن',
             ),
             NavigationDestination(
            icon: Icon(Icons.access_time, color: ManageColors.selectedTab,),
            selectedIcon: Icon(Icons.access_time_filled),
             label: 'المواقيت',
             ),
             NavigationDestination(
            icon: Icon(Icons.settings, color: ManageColors.selectedTab,),
            selectedIcon: Icon(Icons.settings, color: ManageColors.primary,),
             label: 'المزيد',
             ),
        ],
        ),
        body: screens[currentPageIndex],
    );
  }
}