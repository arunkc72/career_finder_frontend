import 'dart:convert';
import 'package:career_finder/View/Course/individual_course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Utils/routes.dart';
import 'interest_page.dart';

final courseFutureProvider = FutureProvider.autoDispose<List>((ref) async {
  ref.watch(interestProvider);
  // List<String> interest = ref.read(interestProvider.notifier).state;
  // print(interest);
  // if (interest.isEmpty) {
  //   return [];
  // }
  // var body = jsonEncode({"interest": interest});
  SharedPreferences courseSession = await SharedPreferences.getInstance();
  // Save data in the session

  List<String>? value = courseSession.getStringList('interest');
  print("The interest value from session is");
  print(value);
  if (value == null) {
    return [];
  }
  List<int> intList = value.map((str) => int.parse(str)).toList();

  print("Course Preferences Saved to Sesssion");
  var body2 = jsonEncode({"interest": intList});
  var response = await http.post(
    Uri.parse('http://localhost:5000/recommendSubject'),
    headers: {
      "Content-type": "application/json",
    },
    body: body2,
  );
  print(body2);
  var decode = jsonDecode(response.body);
  List<Map<String, dynamic>> subjects = [];
  for (var sub in decode) {
    subjects.add(sub as Map<String, dynamic>);
  }

  return subjects;
});

class CourseRecommendation extends ConsumerWidget {
  const CourseRecommendation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final course = ref.watch(courseFutureProvider);
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
          course.when(
            data: (data) {
              print("The data is");
              print(data);
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
                                          // Navigator.pushNamed(
                                          //     context, MyRoutes.interestPage);
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
                                  'assets/images/optioncourse.png',
                                  height: 50,
                                  width: 50,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 15,
                                childAspectRatio: 1.5),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              print(data);
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return IndividualCourse(
                                      image: 'assets/images/course1.jpg',
                                      course: data[index]['subjectName'],
                                      description:
                                          "${data[index]['description']}");
                                },
                              ));
                            },
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '#${index + 1}',
                                        textAlign: TextAlign.center,
                                      ),
                                      const Spacer(flex: 2),
                                      Center(
                                        child: Text(
                                          data[index]['subjectName'],
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const Spacer(flex: 4),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
            },
            error: (error, stackTrace) => Center(
              child: Text(
                error.toString(),
                textScaleFactor: 2,
              ),
            ),
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
                      Text("Matching your interest ...")
                    ],
                  )),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
