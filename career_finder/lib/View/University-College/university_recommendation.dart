import 'dart:convert';

import 'package:career_finder/View/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Contoller/university_repository.dart';
import '../../Model/university_model.dart';
import 'individual_page.dart';
import '../Utils/routes.dart';

final universityFutureProvider = FutureProvider<List<University>>((ref) async {
  var university = ref.watch(universityServiceProvider);
  return university.postUniversity();
});

// final universityServiceProvider = Provider<UniversityService>((ref) {
//   return UniversityService(ref);
// });

// class UniversityService {
//   ProviderRef ref;
//   UniversityService(this.ref);
//   Future<List<University>> postUniversity() async {
//     var selectedValue = ref.watch(selectorNotifierProvider);
//     var country = ref.watch(countryStateProvider);
//     var city = ref.watch(cityStateProvider);
//     var course = ref.watch(courseStateProvider);
//     var gpa = ref.watch(gradeStateProvider);
//     if (country == '' || city == '' || course == '') {
//       return [];
//     }
//     // SharedPreferences universitySession = await SharedPreferences.getInstance();
//     // // Save data in the session

//     // String? global_score = await universitySession.getString('golbal_score');
//     // String? enrollment = await universitySession.getString('enrollment"');
//     // String? expense = await universitySession.getString('expense');
//     // String? course = await universitySession.getString('course');
//     // String? country = await universitySession.getString('country');
//     // String? city = await universitySession.getString('city');
//     // String? gpa = await universitySession.getString('gpa');
//     // // await universitySession.setString('rank',);
//     // if (country == null || city == null || course == null) {
//     //   return [];
//     // }
//     var body = jsonEncode({
//       "global_score": global_score,
//       "enrollment": enrollment,
//       "expense": expense,
//       "course": course,
//       "country": country,
//       "city": city,
//       "gpa": gpa,
//       "rank": 1
//     });
//     // SharedPreferences universitySession = await SharedPreferences.getInstance();
//     // // Save data in the session

//     // await universitySession.setString(
//     //     'golbal_score', selectedValue.rank.toString());
//     // await universitySession.setString(
//     //     'enrollment"', selectedValue.enrollement.toString());
//     // await universitySession.setString(
//     //     'expense', selectedValue.expensive.toString());
//     // await universitySession.setString('course', course.toString());
//     // await universitySession.setString('country', country.toString());
//     // await universitySession.setString('city', city.toString());
//     // await universitySession.setString('gpa', gpa.toString());
//     // await universitySession.setString('rank', "5");

//     String? value = universitySession.getString('city');
//     print("The city value from session is");
//     print(value);
//     print("University Preferences Saved to Sesssion");

//     var decodedBody = jsonDecode(body);
//     print("The Selected Country is");
//     print(decodedBody);

//     var response = await http.post(
//       Uri.parse('http://192.168.18.5:5000/recommendUniversities'),
//       headers: {
//         "Content-type": "application/json",
//       },
//       body: body,
//     );
//     var decode = jsonDecode(response.body);
//     List<University> universitylist =
//         List.of(decode).map((e) => University.fromMap(e)).toList();
//     return universitylist;
//   }
// }

class UniversityRecommendation extends ConsumerWidget {
  const UniversityRecommendation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10),
            alignment: Alignment.topLeft,
            height: 35,
            child: Text('Recommended Universities',
                textAlign: TextAlign.start, style: myLargeTitle(context)),
          ),
          ref.watch(universityFutureProvider).when(
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
                                          //     MyRoutes.universityQuestionPage);
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
                                  'assets/images/optionuniversity.png',
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
                      physics: ScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              print("The description is");
                              print(data[index].Description.toString());
                              return IndividualPage(
                                  image: 'assets/images/university.jpg',
                                  university:
                                      data[index].University_Name.toString(),
                                  country: data[index].Country.toString(),
                                  city: data[index].City.toString(),
                                  enrollment: data[index].Enrollment.toString(),
                                  globalScore:
                                      data[index].Global_Score.toString(),
                                  worldRank:
                                      data[index].Rank_In_World.toString(),
                                  description:
                                      data[index].Description.toString());
                            }));
                          },
                          child: Column(
                            children: [
                              Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
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
                                                'assets/images/university.jpg',
                                              ))),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            maxLines: 2,
                                            data[index]
                                                .University_Name
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                              maxLines: 2,
                                              '${data[index].City.toString()},${data[index].Country.toString()}'),
                                          Text(
                                            maxLines: 1,
                                            'World Rank :' +
                                                data[index]
                                                    .Rank_In_World
                                                    .toString(),
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                          Text(
                                            maxLines: 1,
                                            'Global Score :' +
                                                data[index]
                                                    .Global_Score
                                                    .toString(),
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          Text(
                                            maxLines: 1,
                                            'Enrollment :' +
                                                data[index]
                                                    .Enrollment
                                                    .toString(),
                                            style: TextStyle(
                                                color: Colors.deepPurpleAccent),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              )
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
                      Text("Matching Country,City,Rank...")
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
