import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/college_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../View/University-College/question_page.dart';
import '../View/Utils/constants.dart';

final collegeServiceProvider = Provider<CollegeService>((ref) {
  return CollegeService(ref);
});

class CollegeService {
  ProviderRef ref;
  CollegeService(this.ref);
  Future<List<College>> postcollege() async {
    var selectedValue = ref.watch(selectorNotifierProvider);
    var city = ref.watch(cityStateProvider);
    var gpa = ref.watch(gradeStateProvider);
    var body = jsonEncode({
      "rank": selectedValue.rank,
      "enrollment": selectedValue.enrollement,
      "expense": selectedValue.expensive,
      "city": city,
      "gpa": gpa,
      "address": "Lamachaur, Pokhara"
    });
    // var headers = {"Content-type": "application/json"};
    // var uri = Uri.parse('http://127.0.0.1:5000//universities');
    var response = await http.post(
      Uri.parse('$myurl:5000/recommendCollege'),
      headers: {
        "Content-type": "application/json",
      },
      body: body,
    );
    var decode = jsonDecode(response.body);
    List<College> collegelist =
        List.of(decode).map((e) => College.fromMap(e)).toList();
    return collegelist;
  }
}
