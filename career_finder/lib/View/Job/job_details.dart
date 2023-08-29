// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../Utils/appbar.dart';
import '../Utils/constants.dart';

class JobDetail extends StatelessWidget {
  final String jobTitle;
  final String companyName;
  final String experience;
  final String salary;
  final String jobLocation;
  final String jobType;
  final String contactEmail;
  final String jobDescription;

  const JobDetail(
      {required this.jobTitle,
      required this.companyName,
      required this.experience,
      required this.salary,
      required this.jobLocation,
      required this.jobType,
      required this.contactEmail,
      required this.jobDescription,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 20,
          left: 16,
          right: 16,
        ),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              fixedSize: Size(mywidth(context), 50),
            ),
            onPressed: () {},
            child: const Text('Apply to this job', textScaleFactor: 1.8)),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const MySliverAppBar(),
            SliverToBoxAdapter(
                child: SizedBox(
              width: mywidth(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: myheight(context),
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
                                Text(jobTitle.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall),
                                SizedBox(height: 10),
                                Text(jobLocation,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .apply(
                                            color:
                                                Colors.black.withOpacity(0.5))),
                                SizedBox(height: 10),
                                Text(companyName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .apply(
                                            color:
                                                Colors.black.withOpacity(0.5))),
                                Wrap(
                                  direction: Axis.horizontal,
                                  children: [
                                    Chip(
                                      label: Text(
                                        salary.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      backgroundColor: Colors.blue,
                                    ),
                                    SizedBox(width: 10),
                                    Chip(
                                      label: Text(
                                        jobType.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      backgroundColor: Colors.green,
                                    ),
                                    Chip(
                                      label: Text(
                                        'Required Experience : $experience',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  ],
                                ),
                                Text('Job Description :',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .apply(
                                            color:
                                                Colors.black.withOpacity(0.7))),
                                Text(jobDescription),
                                Text('Contact Email : $contactEmail',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .apply(
                                            color:
                                                Colors.black.withOpacity(0.7))),
                              ]),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
