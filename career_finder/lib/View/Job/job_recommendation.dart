import 'package:career_finder/View/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/routes.dart';

class JobRecommendation extends StatelessWidget {
  const JobRecommendation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: myPadding,
      child: Column(
        children: [
          const SizedBox(height: 250),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Nothing to show,\n\n\n This page is \n under construction',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 30,
                    ),
                    // ElevatedButton.icon(
                    //     style: ElevatedButton.styleFrom(
                    //         elevation: 5,
                    //         backgroundColor: Colors.green.shade300),
                    //     onPressed: () {
                    //       Navigator.pushNamed(context, MyRoutes.optionPage);
                    //     },
                    //     icon: const Icon(
                    //       CupertinoIcons.add_circled_solid,
                    //       color: Colors.blue,
                    //     ),
                    //     label: const Text('Add your preference')),
                  ],
                ),
                Image.asset(
                  'assets/images/not_found.png',
                  height: 80,
                  width: 80,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
