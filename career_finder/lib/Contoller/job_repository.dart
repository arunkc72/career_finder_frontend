import 'dart:convert';
import 'package:career_finder/Model/jobadd_model.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../View/Utils/constants.dart';

final jobServiceProvider = Provider<JobService>((ref) {
  return JobService();
});

class JobService {
  Future<List<JobAdd>> getJob() async {
    // var headers = {"Content-type": "application/json"};
    // var uri = Uri.parse('http://127.0.0.1:5000//universities');
    var response = await http.get(
      Uri.parse('$myurl:3000/jobs/jobs'),
    );
    var decode = jsonDecode(response.body);
    List<JobAdd> universitylist =
        List.of(decode).map((e) => JobAdd.fromMap(e)).toList();
    return universitylist;
  }
}
