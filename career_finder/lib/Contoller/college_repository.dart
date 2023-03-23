import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../Model/college_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final collegeServiceProvider = Provider<CollegeService>((ref) {
  return CollegeService();
});

class CollegeService {
  Future<List<College>> postcollege() async {
    var body = jsonEncode(        {
                    "rank":2,
                    "enrollment" :"20,000",
                    "expense":0,
                    "city":"Pokhara",
                    "gpa":3.8,
                    "address":"Lamachaur, Pokhara"
                }
            );
    // var headers = {"Content-type": "application/json"};
    // var uri = Uri.parse('http://127.0.0.1:5000//universities');
    var response = await http.post(
      Uri.parse('https://careerfinderapi.onrender.com/recommendCollege'),
      headers: {
        "Content-type": "application/json",
      },
      body: body,
    );
    log(response.body);
    var decode = jsonDecode(response.body);
    List<College> collegelist =
        List.of(decode).map((e) => College.fromMap(e)).toList();
    log(collegelist.toString());
    return collegelist;
  }
}