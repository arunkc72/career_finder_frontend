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
                              Text(university.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                              Text('$country,$city',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .apply(
                                          color:
                                              Colors.black.withOpacity(0.5))),
                              RichText(
                                  text: TextSpan(
                                      text: 'World Rank : ',
                                      style: TextStyle(color: Colors.black),
                                      children: [
                                    TextSpan(
                                      text: '$worldRank',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ])),
                              RichText(
                                  text: TextSpan(
                                      text: 'Global Score : ',
                                      style: TextStyle(color: Colors.black),
                                      children: [
                                    TextSpan(
                                      text: '$globalScore',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ])),
                              RichText(
                                  text: TextSpan(
                                      text: 'Enrollment : ',
                                      style: TextStyle(color: Colors.black),
                                      children: [
                                    TextSpan(
                                      text: '$enrollment',
                                      style:
                                          const TextStyle(color: Colors.orange),
                                    ),
                                  ])),
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
