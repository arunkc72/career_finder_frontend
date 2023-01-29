import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 80,
      leading: Image.asset('assets/logos/Career_Finder_logo.png'),
      // leading: Image.asset(applogo),
      titleSpacing: 10,
      title: Text(
        'Career \n Finder',
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}
