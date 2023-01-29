import 'package:career_finder/pages/Course/individual_course.dart';
import 'package:flutter/material.dart';

import '../../Utils/constants.dart';

class CourseRecommendation extends StatelessWidget {
  const CourseRecommendation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: myPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Text(
            'Recommended Course',
            style: myLargeTitle(context),
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1.4),
            itemCount: course.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return IndividualCourse(
                          image: optionjob,
                          course: course[index],
                          description: 'dglsglks');
                    },
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '#$index',
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(flex: 2),
                      Center(
                        child: Text(
                          course[index],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Spacer(flex: 4)
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
