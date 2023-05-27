import 'package:career_finder/View/Course/course_recommendation.dart';
import 'package:career_finder/View/Utils/constants.dart';
import 'package:career_finder/View/Utils/custom_backbotton.dart';
import 'package:career_finder/View/option_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Utils/routes.dart';

class InterestPage extends ConsumerWidget {
  const InterestPage({Key? key}) : super(key: key);

  void updateinterest(WidgetRef ref, int index) {
    ref.read(interestProvider.notifier).update((state) => index);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> interest = ref.watch(interestStateProvider);
    return Scaffold(
      body: Padding(
        padding: myPadding,
        child: Column(
          children: [
            const Spacer(flex: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBackButton(),
                CustomSkipButton(),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            Text('What interests you the most ?', style: myLargeTitle(context)),
            GridView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: interest.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    updateinterest(ref, index);
                    Navigator.pushNamed(context, MyRoutes.homePage);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      interest[index],
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
