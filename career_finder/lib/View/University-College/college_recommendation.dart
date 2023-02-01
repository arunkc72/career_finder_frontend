import 'dart:convert';
import 'dart:developer';

import 'package:career_finder/Model/college_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final collegeFutureProvider = FutureProvider<List<College>>((ref) async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  var response = await http.get(url);
  var decode = jsonDecode(response.body);
  List<College> collegelist =
      List.of(decode).map((e) => College.fromMap(e)).toList();
  log('$collegelist');
  return collegelist;
});

class CollegeRecommendation extends ConsumerWidget {
  const CollegeRecommendation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: const [
         SizedBox(
          height: 30,
          child: Text('Recommended College'),
        ),
        
        // ref.watch(collegeFutureProvider).when(
        //   data: (data) {
        //     return Text('${data[0].city}');
        //   },
        //   error: (error, stackTrace) {
        //     return Text('$error');
        //   },
        //   loading: () {
        //     return const CircularProgressIndicator();
        //   },
        // )
      ],
    );
  }
}
