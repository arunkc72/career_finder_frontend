import 'package:flutter/material.dart';

import '../Utils/constants.dart';

class IndividualCourse extends StatelessWidget {
  final String? image;
  final String? course;
  final String? university;
  final String description;
  const IndividualCourse(
      {this.image, this.course,this.university, required this.description, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String myimage =
        'https://plus.unsplash.com/premium_photo-1661930029003-0404b6e917f6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80';
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
                child: Image.network(
                  myimage,
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
                              Text(course ?? university.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                              const Text('Trending : \n Future Scope '),
                              const Text('Enrollment :'),
                              Text('Description : \n $description'),
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
