// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class College {
  final String? college_name;
  final String? college_city_name;
  final String? college_address;
  final String? subject1;
  final String? subject2;
  final String? subject3;
  final String? subject4;
  final double? college_city_latitude;
  final double? college_city_longitude;
  final double? college_address_latitude;
  final double? college_address_longitude;
  final double? distance_rank;
  College({
    this.college_name,
    this.college_city_name,
    this.college_address,
    this.subject1,
    this.subject2,
    this.subject3,
    this.subject4,
    this.college_city_latitude,
    this.college_city_longitude,
    this.college_address_latitude,
    this.college_address_longitude,
    this.distance_rank,
  });

  College copyWith({
    String? college_name,
    String? college_city_name,
    String? college_address,
    String? subject1,
    String? subject2,
    String? subject3,
    String? subject4,
    double? college_city_latitude,
    double? college_city_longitude,
    double? college_address_latitude,
    double? college_address_longitude,
    double? distance_rank,
  }) {
    return College(
      college_name: college_name ?? this.college_name,
      college_city_name: college_city_name ?? this.college_city_name,
      college_address: college_address ?? this.college_address,
      subject1: subject1 ?? this.subject1,
      subject2: subject2 ?? this.subject2,
      subject3: subject3 ?? this.subject3,
      subject4: subject4 ?? this.subject4,
      college_city_latitude: college_city_latitude ?? this.college_city_latitude,
      college_city_longitude: college_city_longitude ?? this.college_city_longitude,
      college_address_latitude: college_address_latitude ?? this.college_address_latitude,
      college_address_longitude: college_address_longitude ?? this.college_address_longitude,
      distance_rank: distance_rank ?? this.distance_rank,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'college_name': college_name,
      'college_city_name': college_city_name,
      'college_address': college_address,
      'subject1': subject1,
      'subject2': subject2,
      'subject3': subject3,
      'subject4': subject4,
      'college_city_latitude': college_city_latitude,
      'college_city_longitude': college_city_longitude,
      'college_address_latitude': college_address_latitude,
      'college_address_longitude': college_address_longitude,
      'distance_rank': distance_rank,
    };
  }

  factory College.fromMap(Map<String, dynamic> map) {
    return College(
      college_name: map['college_name'] != null ? map['college_name'] as String : null,
      college_city_name: map['college_city_name'] != null ? map['college_city_name'] as String : null,
      college_address: map['college_address'] != null ? map['college_address'] as String : null,
      subject1: map['subject1'] != null ? map['subject1'] as String : null,
      subject2: map['subject2'] != null ? map['subject2'] as String : null,
      subject3: map['subject3'] != null ? map['subject3'] as String : null,
      subject4: map['subject4'] != null ? map['subject4'] as String : null,
      college_city_latitude: map['college_city_latitude'] != null ? map['college_city_latitude'] as double : null,
      college_city_longitude: map['college_city_longitude'] != null ? map['college_city_longitude'] as double : null,
      college_address_latitude: map['college_address_latitude'] != null ? map['college_address_latitude'] as double : null,
      college_address_longitude: map['college_address_longitude'] != null ? map['college_address_longitude'] as double : null,
      distance_rank: map['distance_rank'] != null ? map['distance_rank'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory College.fromJson(String source) => College.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'College(college_name: $college_name, college_city_name: $college_city_name, college_address: $college_address, subject1: $subject1, subject2: $subject2, subject3: $subject3, subject4: $subject4, college_city_latitude: $college_city_latitude, college_city_longitude: $college_city_longitude, college_address_latitude: $college_address_latitude, college_address_longitude: $college_address_longitude, distance_rank: $distance_rank)';
  }

  @override
  bool operator ==(covariant College other) {
    if (identical(this, other)) return true;
  
    return 
      other.college_name == college_name &&
      other.college_city_name == college_city_name &&
      other.college_address == college_address &&
      other.subject1 == subject1 &&
      other.subject2 == subject2 &&
      other.subject3 == subject3 &&
      other.subject4 == subject4 &&
      other.college_city_latitude == college_city_latitude &&
      other.college_city_longitude == college_city_longitude &&
      other.college_address_latitude == college_address_latitude &&
      other.college_address_longitude == college_address_longitude &&
      other.distance_rank == distance_rank;
  }

  @override
  int get hashCode {
    return college_name.hashCode ^
      college_city_name.hashCode ^
      college_address.hashCode ^
      subject1.hashCode ^
      subject2.hashCode ^
      subject3.hashCode ^
      subject4.hashCode ^
      college_city_latitude.hashCode ^
      college_city_longitude.hashCode ^
      college_address_latitude.hashCode ^
      college_address_longitude.hashCode ^
      distance_rank.hashCode;
  }
}
