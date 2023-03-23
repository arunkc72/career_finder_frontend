import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/university_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final universityServiceProvider = Provider<UniversityService>((ref) {
  return UniversityService();
});

class UniversityService {
  Future<List<University>> postUniversity() async {
    var body = jsonEncode({
      "global_score": 5,
      "enrollment": 1,
      "expense": 0,
      "country": "Australia",
      "city": "Sydney",
      "gpa": 3.8
    });
    // var headers = {"Content-type": "application/json"};
    // var uri = Uri.parse('http://127.0.0.1:5000//universities');
    var response = await http.post(
      Uri.parse('https://careerfinderapi.onrender.com/recommendUniversities'),
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
