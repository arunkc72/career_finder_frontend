import 'dart:convert';
import 'package:career_finder/Model/jobadd_model.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Model/job_model.dart';
import '../View/Job/job_question.dart';
import '../View/Utils/constants.dart';

final jobServiceProvider = Provider<JobService>((ref) {
  return JobService(ref);
});

class JobService {
  ProviderRef ref;
  JobService(this.ref);
  Future<List<JobAdd>> getJob() async {
    final job = ref.watch(jobProvider);
    final jobdata = Job(
        jobTitle: job.jobTitle,
        requiredQualification: job.requiredQualification,
        jobLocation: job.jobLocation,
        experience: job.experience,
        salary: job.salary,
        jobType: job.jobType);
    final response = await http.post(Uri.parse('$myurl:5000/recommendJobs'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jobdata.toJson());

    var decode = jsonDecode(response.body);
    List<JobAdd> universitylist =
        List.of(decode).map((e) => JobAdd.fromMap(e)).toList();
    return universitylist;
  }
}
