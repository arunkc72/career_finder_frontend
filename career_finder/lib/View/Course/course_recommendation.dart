import 'dart:convert';
import 'package:career_finder/View/Course/individual_course.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'interest_page.dart';

final courseFutureProvider = FutureProvider.autoDispose<List>((ref) async {
  ref.watch(interestProvider);
  List<String> interest = ref.read(interestProvider.notifier).state;
  var body = jsonEncode({"interest": interest});
  var response = await http.post(
    Uri.parse('$myurl:5000/recommendSubject'),
    headers: {
      "Content-type": "application/json",
    },
    body: body,
  );
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
              return SingleChildScrollView(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1.4),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return IndividualCourse(
                                image: optionjob,
                                course: data[index]['subject_name'],
                                description: 'dglsglks');
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '#${index + 1}',
                                  textAlign: TextAlign.center,
                                ),
                                const Spacer(flex: 2),
                                Center(
                                  child: Text(
                                    data[index]['subject_name'],
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const Spacer(flex: 4)
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
              return const Center(child: CircularProgressIndicator());
            },
          )
        ],
      ),
    );
  }
}
