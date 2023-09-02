import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Job {
  final String jobTitle;
  final String requiredQualification;
  final String jobLocation;
  final String experience;
  final String salary;
  final String jobType;
  Job({
    required this.jobTitle,
    required this.requiredQualification,
    required this.jobLocation,
    required this.experience,
    required this.salary,
    required this.jobType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jobTitle': jobTitle,
      'requiredQualification': requiredQualification,
      'jobLocation': jobLocation,
      'experience': experience,
      'salary': salary,
      'jobType': jobType,
    };
  }

  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      jobTitle: map['jobTitle'] as String,
      requiredQualification: map['requiredQualification'] as String,
      jobLocation: map['jobLocation'] as String,
      experience: map['experience'] as String,
      salary: map['salary'] as String,
      jobType: map['jobType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Job.fromJson(String source) =>
      Job.fromMap(json.decode(source) as Map<String, dynamic>);

  Job copyWith({
    String? jobTitle,
    String? requiredQualification,
    String? jobLocation,
    String? experience,
    String? salary,
    String? jobType,
  }) {
    return Job(
      jobTitle: jobTitle ?? this.jobTitle,
      requiredQualification: requiredQualification ?? this.requiredQualification,
      jobLocation: jobLocation ?? this.jobLocation,
      experience: experience ?? this.experience,
      salary: salary ?? this.salary,
      jobType: jobType ?? this.jobType,
    );
  }

  @override
  String toString() {
    return 'Job(jobTitle: $jobTitle, requiredQualification: $requiredQualification, jobLocation: $jobLocation, experience: $experience, salary: $salary, jobType: $jobType)';
  }

  @override
  bool operator ==(covariant Job other) {
    if (identical(this, other)) return true;
  
    return 
      other.jobTitle == jobTitle &&
      other.requiredQualification == requiredQualification &&
      other.jobLocation == jobLocation &&
      other.experience == experience &&
      other.salary == salary &&
      other.jobType == jobType;
  }

  @override
  int get hashCode {
    return jobTitle.hashCode ^
      requiredQualification.hashCode ^
      jobLocation.hashCode ^
      experience.hashCode ^
      salary.hashCode ^
      jobType.hashCode;
  }
}

class JobPreferences extends StateNotifier<Job> {
  JobPreferences()
      : super(Job(
          jobTitle: 'Frontend Developer',
          requiredQualification: '+2',
          jobLocation: 'Kathmandu',
          experience: '1 year',
          jobType: 'Remote',
          salary: '<15K',
        ));
  void setjobTitle(String jobTitle) {
    state = state.copyWith(jobTitle: jobTitle);
  }

  void setrequiredQualification(String requiredQualification) {
    state = state.copyWith(requiredQualification: requiredQualification);
  }

  void setjobLocation(String jobLocation) {
    state = state.copyWith(jobLocation: jobLocation);
  }

  void setExperience(String experience) {
    state = state.copyWith(experience: experience);
  }

  void setSalary(String salary) {
    state = state.copyWith(salary: salary);
  }

  void setJobType(String type) {
    state = state.copyWith(jobType: type);
  }
}
