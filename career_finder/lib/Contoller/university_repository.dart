import 'dart:convert';
import 'package:career_finder/View/University-College/question_page.dart';
import 'package:http/http.dart' as http;

import '../Model/university_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../View/Utils/constants.dart';

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
    // var headers = {"Content-type": "application/json"};
    // var uri = Uri.parse('http://127.0.0.1:5000//universities');
    var response = await http.post(
      Uri.parse('$myurl:5000/recommendUniversities'),
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
