import 'package:career_finder/View/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobRecommendation extends StatelessWidget {
  const JobRecommendation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: myPadding,
      child: Column(
        children: [
          const SizedBox(height: 100),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Nothing to show,\n please enter your\n preference\n yo get the\n recommendation',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(fontWeight: FontWeight.bold)),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            elevation: 5,
                            backgroundColor: Colors.green.shade300),
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.add_circled_solid,
                          color: Colors.blue,
                        ),
                        label: const Text('Add your preference')),
                  ],
                ),
                Center(
                  child: Image.asset(
                    'assets/images/optionjob.png',
                    height: 70,
                    width: 70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
