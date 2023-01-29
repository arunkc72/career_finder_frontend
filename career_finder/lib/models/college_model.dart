// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class College {
  final String? city;
  final String? country;
  final String? pictureUrl;
  final String? rankInAustralia;
  final String? rankInWorld;
  final String? universityName;
  final String? universityLink;
  final String? nationFlagPicture;

  College(
    this.city,
    this.country,
    this.pictureUrl,
    this.rankInAustralia,
    this.rankInWorld,
    this.universityName,
    this.universityLink,
    this.nationFlagPicture
  );

  College copyWith({
    String? city,
    String? country,
    String? pictureUrl,
    String? rankInAustralia,
    String? rankInWorld,
    String? universityName,
    String? universityLink,
    String? nationFlagPicture,
  }) {
    return College(
      city ?? this.city,
      country ?? this.country,
      pictureUrl ?? this.pictureUrl,
      rankInAustralia ?? this.rankInAustralia,
      rankInWorld ?? this.rankInWorld,
      universityName ?? this.universityName,
      universityLink ?? this.universityLink,
      nationFlagPicture ?? this.nationFlagPicture,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'city': city,
      'country': country,
      'pictureUrl': pictureUrl,
      'rankInAustralia': rankInAustralia,
      'rankInWorld': rankInWorld,
      'universityName': universityName,
      'universityLink': universityLink,
      'nationFlagPicture': nationFlagPicture,
    };
  }

  factory College.fromMap(Map<String, dynamic> map) {
    return College(
      map['city'] != null ? map['city'] as String : null,
      map['country'] != null ? map['country'] as String : null,
      map['pictureUrl'] != null ? map['pictureUrl'] as String : null,
      map['rankInAustralia'] != null ? map['rankInAustralia'] as String : null,
      map['rankInWorld'] != null ? map['rankInWorld'] as String : null,
      map['universityName'] != null ? map['universityName'] as String : null,
      map['universityLink'] != null ? map['universityLink'] as String : null,
      map['nationFlagPicture'] != null ? map['nationFlagPicture'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory College.fromJson(String source) => College.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'College(city: $city, country: $country, pictureUrl: $pictureUrl, rankInAustralia: $rankInAustralia, rankInWorld: $rankInWorld, universityName: $universityName, universityLink: $universityLink, nationFlagPicture: $nationFlagPicture)';
  }

  @override
  bool operator ==(covariant College other) {
    if (identical(this, other)) return true;
  
    return 
      other.city == city &&
      other.country == country &&
      other.pictureUrl == pictureUrl &&
      other.rankInAustralia == rankInAustralia &&
      other.rankInWorld == rankInWorld &&
      other.universityName == universityName &&
      other.universityLink == universityLink &&
      other.nationFlagPicture == nationFlagPicture;
  }

  @override
  int get hashCode {
    return city.hashCode ^
      country.hashCode ^
      pictureUrl.hashCode ^
      rankInAustralia.hashCode ^
      rankInWorld.hashCode ^
      universityName.hashCode ^
      universityLink.hashCode ^
      nationFlagPicture.hashCode;
  }
}
