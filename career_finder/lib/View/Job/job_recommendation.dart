import 'package:career_finder/Contoller/job_repository.dart';
import 'package:career_finder/View/Job/job_details.dart';
import 'package:career_finder/View/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Model/jobadd_model.dart';

final jobFutureProvider = FutureProvider<List<JobAdd>>((ref) async {
  var job = ref.watch(jobServiceProvider);
  return job.getJob();
});

class JobRecommendation extends ConsumerWidget {
  const JobRecommendation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: myPadding,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10),
            alignment: Alignment.topLeft,
            height: 35,
            child: Text('Recommended Jobs',
                textAlign: TextAlign.start, style: myLargeTitle(context)),
          ),
          ref.watch(jobFutureProvider).when(
            data: (data) {
              return ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return JobDetail(
                            jobTitle: data[index].jobTitle,
                            companyName: data[index].companyName,
                            experience: data[index].experience,
                            salary: data[index].salary,
                            jobLocation: data[index].jobLocation,
                            jobType: data[index].jobType,
                            contactEmail: data[index].contactEmail,
                            jobDescription: data[index].jobDescription);
                      }));
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index].jobTitle.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  data[index].companyName.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  data[index].jobLocation.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Flex(
                              direction: Axis.horizontal,
                              children: [
                                Chip(
                                  label: Text(
                                    data[index].salary.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  backgroundColor: Colors.blue,
                                ),
                                SizedBox(width: 10),
                                Chip(
                                  label: Text(
                                    data[index].jobType.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            error: (error, stackTrace) {
              return Text('$error');
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}

class AddPreference extends StatelessWidget {
  const AddPreference({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
                          elevation: 5, backgroundColor: Colors.green.shade300),
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
    );
  }
}
