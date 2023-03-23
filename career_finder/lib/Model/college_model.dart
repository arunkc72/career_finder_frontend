// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class College {
  final String? address;
  final String? city;
  final String? college_link;
  final String? college_name;
  final String? contact_details;
  final String? course_list;
  final String? discussion;
  final String? review;
  final String? subject1;
  final String? subject1_ink;
  final String? subject2;
  final String? subject2_Link;
  final String? subject3;
  final String? subject3_Link;
  final String? subject4;
  final String? subject4_Link;
  College({
    this.address,
    this.city,
    this.college_link,
    this.college_name,
    this.contact_details,
    this.course_list,
    this.discussion,
    this.review,
    this.subject1,
    this.subject1_ink,
    this.subject2,
    this.subject2_Link,
    this.subject3,
    this.subject3_Link,
    this.subject4,
    this.subject4_Link,
  });

  College copyWith({
    String? address,
    String? city,
    String? college_link,
    String? college_name,
    String? contact_details,
    String? course_list,
    String? discussion,
    String? review,
    String? subject1,
    String? subject1_ink,
    String? subject2,
    String? subject2_Link,
    String? subject3,
    String? subject3_Link,
    String? subject4,
    String? subject4_Link,
  }) {
    return College(
      address: address ?? this.address,
      city: city ?? this.city,
      college_link: college_link ?? this.college_link,
      college_name: college_name ?? this.college_name,
      contact_details: contact_details ?? this.contact_details,
      course_list: course_list ?? this.course_list,
      discussion: discussion ?? this.discussion,
      review: review ?? this.review,
      subject1: subject1 ?? this.subject1,
      subject1_ink: subject1_ink ?? this.subject1_ink,
      subject2: subject2 ?? this.subject2,
      subject2_Link: subject2_Link ?? this.subject2_Link,
      subject3: subject3 ?? this.subject3,
      subject3_Link: subject3_Link ?? this.subject3_Link,
      subject4: subject4 ?? this.subject4,
      subject4_Link: subject4_Link ?? this.subject4_Link,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'city': city,
      'college_link': college_link,
      'college_name': college_name,
      'contact_details': contact_details,
      'course_list': course_list,
      'discussion': discussion,
      'review': review,
      'subject1': subject1,
      'subject1_ink': subject1_ink,
      'subject2': subject2,
      'subject2_Link': subject2_Link,
      'subject3': subject3,
      'subject3_Link': subject3_Link,
      'subject4': subject4,
      'subject4_Link': subject4_Link,
    };
  }

  factory College.fromMap(Map<String, dynamic> map) {
    return College(
      address: map['address'] != null ? map['address'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      college_link:
          map['college_link'] != null ? map['college_link'] as String : null,
      college_name:
          map['college_name'] != null ? map['college_name'] as String : null,
      contact_details: map['contact_details'] != null
          ? map['contact_details'] as String
          : null,
      course_list:
          map['course_list'] != null ? map['course_list'] as String : null,
      discussion:
          map['discussion'] != null ? map['discussion'] as String : null,
      review: map['review'] != null ? map['review'] as String : null,
      subject1: map['subject1'] != null ? map['subject1'] as String : null,
      subject1_ink:
          map['subject1_ink'] != null ? map['subject1_ink'] as String : null,
      subject2: map['subject2'] != null ? map['subject2'] as String : null,
      subject2_Link:
          map['subject2_Link'] != null ? map['subject2_Link'] as String : null,
      subject3: map['subject3'] != null ? map['subject3'] as String : null,
      subject3_Link:
          map['subject3_Link'] != null ? map['subject3_Link'] as String : null,
      subject4: map['subject4'] != null ? map['subject4'] as String : null,
      subject4_Link:
          map['subject4_Link'] != null ? map['subject4_Link'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory College.fromJson(String source) =>
      College.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'College(address: $address, city: $city, college_link: $college_link, college_name: $college_name, contact_details: $contact_details, course_list: $course_list, discussion: $discussion, review: $review, subject1: $subject1, subject1_ink: $subject1_ink, subject2: $subject2, subject2_Link: $subject2_Link, subject3: $subject3, subject3_Link: $subject3_Link, subject4: $subject4, subject4_Link: $subject4_Link)';
  }

  @override
  bool operator ==(covariant College other) {
    if (identical(this, other)) return true;

    return other.address == address &&
        other.city == city &&
        other.college_link == college_link &&
        other.college_name == college_name &&
        other.contact_details == contact_details &&
        other.course_list == course_list &&
        other.discussion == discussion &&
        other.review == review &&
        other.subject1 == subject1 &&
        other.subject1_ink == subject1_ink &&
        other.subject2 == subject2 &&
        other.subject2_Link == subject2_Link &&
        other.subject3 == subject3 &&
        other.subject3_Link == subject3_Link &&
        other.subject4 == subject4 &&
        other.subject4_Link == subject4_Link;
  }

  @override
  int get hashCode {
    return address.hashCode ^
        city.hashCode ^
        college_link.hashCode ^
        college_name.hashCode ^
        contact_details.hashCode ^
        course_list.hashCode ^
        discussion.hashCode ^
        review.hashCode ^
        subject1.hashCode ^
        subject1_ink.hashCode ^
        subject2.hashCode ^
        subject2_Link.hashCode ^
        subject3.hashCode ^
        subject3_Link.hashCode ^
        subject4.hashCode ^
        subject4_Link.hashCode;
  }
}
