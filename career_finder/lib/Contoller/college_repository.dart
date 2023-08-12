import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../Model/college_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../View/University-College/question_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    var address = ref.watch(addressStateProvider);
    if (city == '' || address == '') {
      return [];
    }
    // print("Taking College Preferences from Sesssion");
    // SharedPreferences collegeSession = await SharedPreferences.getInstance();
    // // Save data in the session
    // String? rank = await collegeSession.getString('rank');
    // String? enrollment = await collegeSession.getString('enrollment');
    // String? expense = await collegeSession.getString('expense');
    // String? city = await collegeSession.getString('city');
    // String? gpa = await collegeSession.getString('gpa');
    // String? address = await collegeSession.getString('address');
    // if (city == null || address == null) {
    //   return [];
    // }

    var body = jsonEncode({
      "rank": selectedValue.rank,
      "enrollment": selectedValue.enrollement,
      "expense": selectedValue.expensive,
      "city": city,
      "gpa": gpa,
      "address": address
    });
    print(jsonDecode(body));
    // SharedPreferences collegeSession = await SharedPreferences.getInstance();
    // // Save data in the session
    // await collegeSession.setString('rank', selectedValue.rank.toString());
    // await collegeSession.setString(
    //     'enrollment', selectedValue.enrollement.toString());
    // await collegeSession.setString(
    //     'expense', selectedValue.expensive.toString());
    // await collegeSession.setString('city', city.toString());
    // await collegeSession.setString('gpa', gpa.toString());
    // await collegeSession.setString('address', address.toString());
    // String? value = collegeSession.getString('address');
    // print("The address value from session is");
    // print(value);
    // print("College Preferences Saved to Sesssion");

    // var headers = {"Content-type": "application/json"};
    // var uri = Uri.parse('http://127.0.0.1:5000//universities');
    var response = await http.post(
      Uri.parse('http://localhost:5000/recommendCollege'),
      headers: {
        "Content-type": "application/json",
      },
      body: body,
    );
    log(response.body);
    var decode = jsonDecode(response.body);
    List<College> collegelist =
        List.of(decode).map((e) => College.fromMap(e)).toList();
    return collegelist;
  }
}
