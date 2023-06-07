import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      toolbarHeight: 70,
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
        child: Image.asset('assets/logos/Career_Finder_logo.png'),
      ),
      // leading: Image.asset(applogo),
      titleSpacing: 10,
      title: Text(
        'Career \n Finder',
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}
