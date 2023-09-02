// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class JobAdd {
  final String jobTitle;
  final String companyName;
  final String requiredQualification;
  final String experience;
  final String salary;
  final String jobLocation;
  final String jobType;
  final String contactEmail;
  final String jobDescription;
  JobAdd({
    required this.jobTitle,
    required this.companyName,
    required this.requiredQualification,
    required this.experience,
    required this.salary,
    required this.jobLocation,
    required this.jobType,
    required this.contactEmail,
    required this.jobDescription,
  });

  JobAdd copyWith({
    String? jobTitle,
    String? companyName,
    String? requiredQualification,
    String? experience,
    String? salary,
    String? jobLocation,
    String? jobType,
    String? contactEmail,
    String? jobDescription,
  }) {
    return JobAdd(
      jobTitle: jobTitle ?? this.jobTitle,
      companyName: companyName ?? this.companyName,
      requiredQualification:
          requiredQualification ?? this.requiredQualification,
      experience: experience ?? this.experience,
      salary: salary ?? this.salary,
      jobLocation: jobLocation ?? this.jobLocation,
      jobType: jobType ?? this.jobType,
      contactEmail: contactEmail ?? this.contactEmail,
      jobDescription: jobDescription ?? this.jobDescription,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jobTitle': jobTitle,
      'companyName': companyName,
      'requiredQualification': requiredQualification,
      'experience': experience,
      'salary': salary,
      'jobLocation': jobLocation,
      'jobType': jobType,
      'contactEmail': contactEmail,
      'jobDescription': jobDescription,
    };
  }

  factory JobAdd.fromMap(Map<String, dynamic> map) {
    return JobAdd(
      jobTitle: map['jobTitle'] as String,
      companyName: map['companyName'] as String,
      requiredQualification: map['requiredQualification'] as String,
      experience: map['experience'] as String,
      salary: map['salary'] as String,
      jobLocation: map['jobLocation'] as String,
      jobType: map['jobType'] as String,
      contactEmail: map['contactEmail'] as String,
      jobDescription: map['jobDescription'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory JobAdd.fromJson(String source) =>
      JobAdd.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'JobAdd(jobTitle: $jobTitle, companyName: $companyName, requiredQualification: $requiredQualification, experience: $experience, salary: $salary, jobLocation: $jobLocation, jobType: $jobType, contactEmail: $contactEmail, jobDescription: $jobDescription)';
  }

  @override
  bool operator ==(covariant JobAdd other) {
    if (identical(this, other)) return true;

    return other.jobTitle == jobTitle &&
        other.companyName == companyName &&
        other.requiredQualification == requiredQualification &&
        other.experience == experience &&
        other.salary == salary &&
        other.jobLocation == jobLocation &&
        other.jobType == jobType &&
        other.contactEmail == contactEmail &&
        other.jobDescription == jobDescription;
  }

  @override
  int get hashCode {
    return jobTitle.hashCode ^
        companyName.hashCode ^
        requiredQualification.hashCode ^
        experience.hashCode ^
        salary.hashCode ^
        jobLocation.hashCode ^
        jobType.hashCode ^
        contactEmail.hashCode ^
        jobDescription.hashCode;
  }
}

class JobNotifier extends StateNotifier<JobAdd> {
  JobNotifier()
      : super(JobAdd(
          jobTitle: 'Frontend Developer',
          companyName: '',
          requiredQualification: '+2',
          experience: '1 year',
          salary: '<15K',
          jobLocation: 'Kathmandu',
          jobType: 'Remote',
          contactEmail: '',
          jobDescription: '',
        ));

  void setJobTitle(String title) {
    state = state.copyWith(jobTitle: title);
  }

  void setCompanyName(String name) {
    state = state.copyWith(companyName: name);
  }

  void setRequiredQualification(String qualification) {
    state = state.copyWith(requiredQualification: qualification);
  }

  void setExperience(String experience) {
    state = state.copyWith(experience: experience);
  }

  void setSalary(String salary) {
    state = state.copyWith(salary: salary);
  }

  void setJobLocation(String location) {
    state = state.copyWith(jobLocation: location);
  }

  void setJobType(String type) {
    state = state.copyWith(jobType: type);
  }

  void setContactEmail(String email) {
    state = state.copyWith(contactEmail: email);
  }

  void setJobDescription(String description) {
    state = state.copyWith(jobDescription: description);
  }
}
