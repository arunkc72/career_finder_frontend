// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../Utils/constants.dart';

class IndividualPage extends StatelessWidget {
  final String? image;
  final String? university;
  final String? country;
  final String? city;
  final String? worldRank;
  final String? globalScore;
  final String? enrollment;
  final String description;
  const IndividualPage({
    Key? key,
    this.image,
    this.university,
    this.country,
    this.city,
    this.worldRank,
    this.globalScore,
    this.enrollment,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String myimage = '$image';
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
                              Text(university.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Location:' + ' $country,$city',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .apply(
                                          color:
                                              Colors.black.withOpacity(0.5))),
                              SizedBox(
                                height: 10,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: 'World Rank : ',
                                      style:
                                          const TextStyle(color: Colors.black),
                                      children: [
                                    TextSpan(
                                      text: '$worldRank',
                                      style:
                                          const TextStyle(color: Colors.green),
                                    ),
                                  ])),
                              SizedBox(
                                height: 10,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: 'Global Score : ',
                                      style:
                                          const TextStyle(color: Colors.black),
                                      children: [
                                    TextSpan(
                                      text: '$globalScore',
                                      style:
                                          const TextStyle(color: Colors.green),
                                    ),
                                  ])),
                              SizedBox(
                                height: 10,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: 'Enrollment : ',
                                      style:
                                          const TextStyle(color: Colors.black),
                                      children: [
                                    TextSpan(
                                      text: '$enrollment',
                                      style:
                                          const TextStyle(color: Colors.orange),
                                    ),
                                  ])),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Description :$description'),
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
