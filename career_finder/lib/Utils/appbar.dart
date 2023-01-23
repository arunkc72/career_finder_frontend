import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  const MyAppBar({required this.title, super.key})
      : preferredSize = const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      title: Text(title, textScaleFactor: 1.4),
      actions: [
        IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: MySearchDelegate(),
            );
          },
          icon: const Icon(CupertinoIcons.search),
        ),
      ],
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> colleges = [
    'Gces',
    'PU',
    'KU',
    'Tu',
  ];
  final String image = 'assets/images/loginimage.png';
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(CupertinoIcons.back));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      FittedBox(
        child: TextButton(
            onPressed: () {
              query = '';
            },
            child: const Text('Clear')),
      ),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchedlist = [];
    String matchitems = '';
    for (matchitems in colleges) {
      if (matchitems.toLowerCase().contains(query.toLowerCase())) {
        matchedlist.add(matchitems);
      }
    }
    return ListView.builder(
      itemCount: matchedlist.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset(image),
          title: Text(matchedlist[index]),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchedlist = [];
    String matchitems = '';
    for (matchitems in colleges) {
      if (matchitems.toLowerCase().contains(query.toLowerCase())) {
        matchedlist.add(matchitems);
      }
    }
    return ListView.builder(
      itemCount: matchedlist.length,
      itemBuilder: (context, index) {
        return ListTile(
            leading: Image.asset(image),
            onTap: () {},
            title: Text(matchedlist[index]));
      },
    );
  }
}
