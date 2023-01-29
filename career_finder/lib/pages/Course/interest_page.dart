import 'package:career_finder/Utils/constants.dart';
import 'package:career_finder/Utils/custom_backbotton.dart';
import 'package:career_finder/pages/option_page.dart';
import 'package:flutter/material.dart';

class InterestPage extends StatelessWidget {
  const InterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: myPadding,
        child: Column(
          children: [
            const Spacer(flex: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
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
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    interest[index],
                    textAlign: TextAlign.center,
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
