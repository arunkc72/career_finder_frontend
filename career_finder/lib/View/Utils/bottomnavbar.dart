import '../home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constants.dart';

void _updatevalue(WidgetRef ref, int val) {
  ref.watch(indexValueProvider.notifier).update((state) => val);
}

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  _customnavdestinaton(String logoimage, String label) {
    return NavigationDestination(
      icon: Container(
        height: 30,
        width: 30,
        child: Image.asset(
          logoimage,
          color: Colors.grey,
        ),
      ),
      label: label,
      selectedIcon: Container(
        height: 35,
        width: 35,
        child: Image.asset(
          logoimage,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(indexValueProvider);
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: NavigationBarTheme(
            data: const NavigationBarThemeData(
                backgroundColor: Colors.white,
                indicatorColor: Colors.white,
                labelBehavior: NavigationDestinationLabelBehavior.alwaysShow),
            child: NavigationBar(
              height: 70,
              selectedIndex: value,
              onDestinationSelected: (value) {
                print(value);
                _updatevalue(ref, value);
              },
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              destinations: [
                _customnavdestinaton(universitynav, 'University'),
                _customnavdestinaton(coursenav, 'Course'),
                _customnavdestinaton(jobnav, 'Job'),
                _customnavdestinaton(collegenav, 'College'),
                _customnavdestinaton(profilenav, 'Profile'),
              ],
            ),
          )),
    );
  }
}
