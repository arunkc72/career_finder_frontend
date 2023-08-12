import 'dart:convert';
import 'package:career_finder/View/University-College/question_page.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/university_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final universityServiceProvider = Provider<UniversityService>((ref) {
  return UniversityService(ref);
});

class UniversityService {
  ProviderRef ref;
  UniversityService(this.ref);
  Future<List<University>> postUniversity() async {
    var selectedValue = ref.watch(selectorNotifierProvider);
    var country = ref.watch(countryStateProvider);
    var city = ref.watch(cityStateProvider);
    var course = ref.watch(courseStateProvider);
    var gpa = ref.watch(gradeStateProvider);
    if (country == '' || city == '' || course == '') {
      return [];
    }
    // SharedPreferences universitySession = await SharedPreferences.getInstance();
    // // Save data in the session

    // String? global_score = await universitySession.getString('golbal_score');
    // String? enrollment = await universitySession.getString('enrollment"');
    // String? expense = await universitySession.getString('expense');
    // String? course = await universitySession.getString('course');
    // String? country = await universitySession.getString('country');
    // String? city = await universitySession.getString('city');
    // String? gpa = await universitySession.getString('gpa');
    // // await universitySession.setString('rank',);
    // if (country == null || city == null || course == null) {
    //   return [];
    // }
    var body = jsonEncode({
      "global_score": selectedValue.rank,
      "enrollment": selectedValue.enrollement,
      "expense": selectedValue.expensive,
      "course": course,
      "country": country,
      "city": city,
      "gpa": gpa,
      "rank": 1
    });
    // SharedPreferences universitySession = await SharedPreferences.getInstance();
    // // Save data in the session

    // await universitySession.setString(
    //     'golbal_score', selectedValue.rank.toString());
    // await universitySession.setString(
    //     'enrollment"', selectedValue.enrollement.toString());
    // await universitySession.setString(
    //     'expense', selectedValue.expensive.toString());
    // await universitySession.setString('course', course.toString());
    // await universitySession.setString('country', country.toString());
    // await universitySession.setString('city', city.toString());
    // await universitySession.setString('gpa', gpa.toString());
    // await universitySession.setString('rank', "5");

    // String? value = universitySession.getString('city');
    // print("The city value from session is");
    // print(value);
    // print("University Preferences Saved to Sesssion");

    var decodedBody = jsonDecode(body);
    print("The Selected Country is");
    print(decodedBody);

    var response = await http.post(
      Uri.parse('http://localhost:5000/recommendUniversities'),
      headers: {
        "Content-type": "application/json",
      },
      body: body,
    );
    var decode = jsonDecode(response.body);
    List<University> universitylist =
        List.of(decode).map((e) => University.fromMap(e)).toList();
    return universitylist;
  }
}
