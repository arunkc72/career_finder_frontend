// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class University {
  final String? university_link;
  final String? picture_url;
  final String? university_name;
  final String? nation_flag_picture;
  final String? country;
  final String? city;
  final String? rank_in_world;
  final String? description;
  final String? global_Score;
  final double? enrollment;
  University({
    this.university_link,
    this.picture_url,
    this.university_name,
    this.nation_flag_picture,
    this.country,
    this.city,
    this.rank_in_world,
    this.description,
    this.global_Score,
    this.enrollment,
  });
 

  University copyWith({
    String? university_link,
    String? picture_url,
    String? university_name,
    String? nation_flag_picture,
    String? country,
    String? city,
    String? rank_in_world,
    String? description,
    String? global_Score,
    double? enrollment,
  }) {
    return University(
      university_link: university_link ?? this.university_link,
      picture_url: picture_url ?? this.picture_url,
      university_name: university_name ?? this.university_name,
      nation_flag_picture: nation_flag_picture ?? this.nation_flag_picture,
      country: country ?? this.country,
      city: city ?? this.city,
      rank_in_world: rank_in_world ?? this.rank_in_world,
      description: description ?? this.description,
      global_Score: global_Score ?? this.global_Score,
      enrollment: enrollment ?? this.enrollment,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'university_link': university_link,
      'picture_url': picture_url,
      'university_name': university_name,
      'nation_flag_picture': nation_flag_picture,
      'country': country,
      'city': city,
      'rank_in_world': rank_in_world,
      'description': description,
      'global_Score': global_Score,
      'enrollment': enrollment,
    };
  }

  factory University.fromMap(Map<String, dynamic> map) {
    return University(
      university_link: map['university_link'] != null ? map['university_link'] as String : null,
      picture_url: map['picture_url'] != null ? map['picture_url'] as String : null,
      university_name: map['university_name'] != null ? map['university_name'] as String : null,
      nation_flag_picture: map['nation_flag_picture'] != null ? map['nation_flag_picture'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      rank_in_world: map['rank_in_world'] != null ? map['rank_in_world'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      global_Score: map['global_Score'] != null ? map['global_Score'] as String : null,
      enrollment: map['enrollment'] != null ? map['enrollment'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory University.fromJson(String source) => University.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'University(university_link: $university_link, picture_url: $picture_url, university_name: $university_name, nation_flag_picture: $nation_flag_picture, country: $country, city: $city, rank_in_world: $rank_in_world, description: $description, global_Score: $global_Score, enrollment: $enrollment)';
  }

  @override
  bool operator ==(covariant University other) {
    if (identical(this, other)) return true;
  
    return 
      other.university_link == university_link &&
      other.picture_url == picture_url &&
      other.university_name == university_name &&
      other.nation_flag_picture == nation_flag_picture &&
      other.country == country &&
      other.city == city &&
      other.rank_in_world == rank_in_world &&
      other.description == description &&
      other.global_Score == global_Score &&
      other.enrollment == enrollment;
  }

  @override
  int get hashCode {
    return university_link.hashCode ^
      picture_url.hashCode ^
      university_name.hashCode ^
      nation_flag_picture.hashCode ^
      country.hashCode ^
      city.hashCode ^
      rank_in_world.hashCode ^
      description.hashCode ^
      global_Score.hashCode ^
      enrollment.hashCode;
  }
}
