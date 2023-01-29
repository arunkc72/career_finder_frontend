import 'dart:convert';
import 'dart:developer';

import 'package:career_finder/Utils/constants.dart';
import 'package:career_finder/pages/Course/individual_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../models/university_model.dart';

final universityFutureProvider = FutureProvider<List<University>>((ref) async {
  var body = jsonEncode({"global_score": 5, "enrollment": 1});
  // var headers = {"Content-type": "application/json"};
  // var uri = Uri.parse('http://127.0.0.1:5000//universities');
  var response = await http.post(
    Uri.parse('http://192.168.1.65:5000/universities'),
    headers: {
      "Content-type": "application/json",
    },
    body: body,
  );
  var decode = jsonDecode(response.body);
  List<University> universitylist =
      List.of(decode).map((e) => University.fromMap(e)).toList();
  log('$universitylist');
  return universitylist;
});

class UniversityRecommendation extends ConsumerWidget {
  const UniversityRecommendation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: myPadding,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            alignment: Alignment.topLeft,
            height: 30,
            child: Text('Recommended Universities',
                textAlign: TextAlign.start, style: myLargeTitle(context)),
          ),
          ref.watch(universityFutureProvider).when(
            data: (data) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return IndividualCourse(
                            image: '',
                            university: data[index].University_Name.toString(),
                            description: data[index].Description.toString());
                      }));
                    },
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        height: 150,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Placeholder(
                              color: myPrimaryColor,
                            )),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index].University_Name.toString(),
                                  style: mytitlemedium(context),
                                ),
                                Text(data[index].Country.toString()),
                                Text(data[index].Rank_In_World.toString()),
                                Text(data[index].Rank_In_World.toString()),
                                Text(data[index].Enrollment.toString()),
                              ],
                            ))
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
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
