import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Job {
  final String position;
  final String qualification;
  final String city;
  final int experience;
  Job({
    required this.position,
    required this.qualification,
    required this.city,
    required this.experience,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'position': position,
      'qualification': qualification,
      'city': city,
      'experience': experience,
    };
  }

  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      position: map['position'] as String,
      qualification: map['qualification'] as String,
      city: map['city'] as String,
      experience: map['experience'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Job.fromJson(String source) =>
      Job.fromMap(json.decode(source) as Map<String, dynamic>);

  Job copyWith({
    String? position,
    String? qualification,
    String? city,
    int? experience,
  }) {
    return Job(
      position: position ?? this.position,
      qualification: qualification ?? this.qualification,
      city: city ?? this.city,
      experience: experience ?? this.experience,
    );
  }
}

class JobPreferences extends StateNotifier<Job> {
  JobPreferences() : super(
    Job(position: '', qualification: '', city: '', experience: 0)
  );
  void setPosition(String position) {
    state = state.copyWith(position: position);
  }
  void setQualification(String qualification) {
    state = state.copyWith(qualification: qualification);
  }
  void setcity(String city) {
    state = state.copyWith(city: city);
  }
  void setExperience(int experience) {
    state = state.copyWith(experience: experience);
  }


}
