import 'package:career_finder/Utils/constants.dart';
import 'package:career_finder/Utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home_page.dart';

class OptionPage extends StatelessWidget {
  const OptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: myPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(
            flex: 4,
          ),
          const CustomSkipButton(),
          const Spacer(
            flex: 2,
          ),
          Text('What are you looking for ?',
              style: Theme.of(context).textTheme.headlineSmall),
          const Spacer(
            flex: 2,
          ),
          const CustomOption(
              text: 'Course to Study', image: optioncourse, index: 1),
          const Spacer(flex: 1),
          const CustomOption(text: 'College', image: optioncollege, index: 3),
          const Spacer(flex: 1),
          const CustomOption(
              text: 'University', image: optionuniversity, index: 0),
          const Spacer(flex: 1),
          const CustomOption(text: 'Placement', image: optionjob, index: 2),
          const Spacer(flex: 15),
        ],
      ),
    ));
  }
}

class CustomSkipButton extends StatelessWidget {
  const CustomSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Skip', textScaleFactor: 1.5),
            Icon(CupertinoIcons.forward),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}

class CustomOption extends ConsumerWidget {
  final String text;
  final String image;
  final int index;
  const CustomOption({
    required this.text,
    required this.image,
    required this.index,
    super.key,
  });
  _updateindex(WidgetRef ref, int index) {
    ref.read(indexValueProvider.notifier).update((state) => index);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        _updateindex(ref, index);
        Navigator.pushNamed(context, MyRoutes.homePage);
      },
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 60,
          alignment: Alignment.center,
          child: Row(
            children: [
              SizedBox(width: mywidth(context) / 10),
              Image.asset(image, height: 35),
              SizedBox(
                width: mywidth(context) / 10,
              ),
              Text(
                text,
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
