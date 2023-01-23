import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.2,
      child: Column(
        children: const [
          UserAccountsDrawerHeader(
            accountName: Text('AK'),
            accountEmail: Text('ak@ak.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: null,
            ),
          ),
          ListTile(),
        ],
      ),
    );
  }
}
