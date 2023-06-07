import 'package:flutter/material.dart';

import '../Utils/constants.dart';

class IndividualCourse extends StatelessWidget {
  final String? image;
  final String? course;
  final String? university;
  final String description;
  const IndividualCourse(
      {this.image,
      this.course,
      this.university,
      required this.description,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? myimage = image;
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: mywidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                child: Image.asset(
                  myimage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
                flex: 3,
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(course ?? university.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                              SizedBox(
                                height: 10,
                              ),
                              const Text('Trending :'),
                              SizedBox(
                                height: 10,
                              ),
                              const Text('Future Scope :'),
                              SizedBox(
                                height: 10,
                              ),
                              const Text('Enrollment :'),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Description : \n\n$description'),
                            ]),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
