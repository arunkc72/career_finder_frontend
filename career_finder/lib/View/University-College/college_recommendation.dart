import 'package:career_finder/Model/college_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Contoller/college_repository.dart';
import '../Utils/constants.dart';
import 'CollegeIndividualPage.dart';

final collegeFutureProvider = FutureProvider<List<College>>((ref) async {
  var college = ref.watch(collegeServiceProvider);
  return college.postcollege();
});

class CollegeRecommendation extends ConsumerWidget {
  const CollegeRecommendation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10),
            alignment: Alignment.topLeft,
            height: 35,
            child: Text('Recommended Colleges',
                textAlign: TextAlign.start, style: myLargeTitle(context)),
          ),
          ref.watch(collegeFutureProvider).when(
            data: (data) {
              return data.isEmpty
                  ? Padding(
                      padding: myPadding,
                      child: Column(
                        children: [
                          const SizedBox(height: 150),
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
                                        'Nothing to show,\n please complete your\n preference\n to get the\n recommendation',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 5,
                                            backgroundColor:
                                                Colors.green.shade300),
                                        onPressed: () {
                                          // Navigator.pushNamed(context,
                                          //     MyRoutes.collegeQuestionPage);
                                        },
                                        icon: const Icon(
                                          CupertinoIcons.add_circled_solid,
                                          color: Colors.blue,
                                        ),
                                        label:
                                            const Text('Add your preference')),
                                  ],
                                ),
                                Image.asset(
                                  'assets/images/optioncollege.png',
                                  height: 80,
                                  width: 80,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CollegeIndividualPage(
                                  image: 'assets/images/college.jpg',
                                  university:
                                      data[index].college_name.toString(),
                                  country:
                                      data[index].college_address.toString(),
                                  city:
                                      data[index].college_city_name.toString(),
                                  subject1: data[index].subject1.toString(),
                                  subject2: data[index].subject2.toString(),
                                  subject3: data[index].subject3.toString(),
                                  description: "");
                            }));
                          },
                          child: Column(
                            children: [
                              Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  height: 180,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                height: 180,
                                                fit: BoxFit.fitHeight,
                                                'assets/images/college.jpg',
                                              ))),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            maxLines: 2,
                                            data[index].college_name.toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            maxLines: 1,
                                            '${data[index].college_city_name.toString()},${data[index].college_address.toString()}',
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                          Text(
                                            maxLines: 1,
                                            "Available Subjects:",
                                            style:
                                                TextStyle(color: Colors.brown),
                                          ),

                                          Text(
                                            maxLines: 1,
                                            data[index].subject1.toString(),
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          Text(
                                            maxLines: 1,
                                            data[index].subject2.toString(),
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          // Text(maxLines: 1,data[index].subject3.toString()),
                                        ],
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      },
                    );
            },
            error: (error, stackTrace) {
              return Text('$error');
            },
            loading: () {
              return Column(
                children: [
                  SizedBox(
                    height: 300,
                  ),
                  Center(
                      child: Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Matching City,Address,Rank...")
                    ],
                  )),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
