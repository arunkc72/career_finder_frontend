import 'package:career_finder/Utils/constants.dart';
import 'package:flutter/material.dart';

import '../Utils/appbar.dart';
import '../Utils/bottomnavbar.dart';
import '../Utils/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: const MyAppBar(title: 'Career Finder'),
      body: Container(
        color: mybackgroundcolor,
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
