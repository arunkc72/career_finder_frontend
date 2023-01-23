import '/Utils/constants.dart';
import 'package:flutter/material.dart';
class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int destination = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
          indicatorColor: myPrimaryColor,
          indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          )),
      child: NavigationBar(
        height: 60,
        onDestinationSelected: (value) {
          setState(() {
            destination = value;
          });
        },
        selectedIndex: destination,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            label: 'College',
            selectedIcon: Icon(Icons.school),
          ),
          NavigationDestination(
            icon: Icon(Icons.work_outline),
            label: 'Job',
            selectedIcon: Icon(Icons.work),
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorites',
            selectedIcon: Icon(Icons.favorite),
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
            selectedIcon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}