// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class University {
  final String? University_link;
  final String? Picture_Url;
  final String? University_Name;
  final String? Nation_flag_picture;
  final String? Country;
  final String? City;
  final String? Rank_In_World;
  final String? Description;
  final String? Global_Score;
  final double? Enrollment;
  University({
    this.University_link,
    this.Picture_Url,
    this.University_Name,
    this.Nation_flag_picture,
    this.Country,
    this.City,
    this.Rank_In_World,
    this.Description,
    this.Global_Score,
    this.Enrollment,
  });

  University copyWith({
    String? University_link,
    String? Picture_Url,
    String? University_Name,
    String? Nation_flag_picture,
    String? Country,
    String? City,
    String? Rank_In_World,
    String? Description,
    String? Global_Score,
    double? Enrollment,
  }) {
    return University(
      University_link: University_link ?? this.University_link,
      Picture_Url: Picture_Url ?? this.Picture_Url,
      University_Name: University_Name ?? this.University_Name,
      Nation_flag_picture: Nation_flag_picture ?? this.Nation_flag_picture,
      Country: Country ?? this.Country,
      City: City ?? this.City,
      Rank_In_World: Rank_In_World ?? this.Rank_In_World,
      Description: Description ?? this.Description,
      Global_Score: Global_Score ?? this.Global_Score,
      Enrollment: Enrollment ?? this.Enrollment,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'University_link': University_link,
      'Picture_Url': Picture_Url,
      'University_Name': University_Name,
      'Nation_flag_picture': Nation_flag_picture,
      'Country': Country,
      'City': City,
      'Rank_In_World': Rank_In_World,
      'Description': Description,
      'Global_Score': Global_Score,
      'Enrollment': Enrollment,
    };
  }

  factory University.fromMap(Map<String, dynamic> map) {
    return University(
      University_link: map['University_link'] != null ? map['University_link'] as String : null,
      Picture_Url: map['Picture_Url'] != null ? map['Picture_Url'] as String : null,
      University_Name: map['University_Name'] != null ? map['University_Name'] as String : null,
      Nation_flag_picture: map['Nation_flag_picture'] != null ? map['Nation_flag_picture'] as String : null,
      Country: map['Country'] != null ? map['Country'] as String : null,
      City: map['City'] != null ? map['City'] as String : null,
      Rank_In_World: map['Rank_In_World'] != null ? map['Rank_In_World'] as String : null,
      Description: map['Description'] != null ? map['Description'] as String : null,
      Global_Score: map['Global_Score'] != null ? map['Global_Score'] as String : null,
      Enrollment: map['Enrollment'] != null ? map['Enrollment'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory University.fromJson(String source) =>
      University.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'University(University_link: $University_link, Picture_Url: $Picture_Url, University_Name: $University_Name, Nation_flag_picture: $Nation_flag_picture, Country: $Country, City: $City, Rank_In_World: $Rank_In_World, Description: $Description, Global_Score: $Global_Score, Enrollment: $Enrollment)';
  }

  @override
  bool operator ==(covariant University other) {
    if (identical(this, other)) return true;

    return other.University_link == University_link &&
        other.Picture_Url == Picture_Url &&
        other.University_Name == University_Name &&
        other.Nation_flag_picture == Nation_flag_picture &&
        other.Country == Country &&
        other.City == City &&
        other.Rank_In_World == Rank_In_World &&
        other.Description == Description &&
        other.Global_Score == Global_Score &&
        other.Enrollment == Enrollment;
  }

  @override
  int get hashCode {
    return University_link.hashCode ^
        Picture_Url.hashCode ^
        University_Name.hashCode ^
        Nation_flag_picture.hashCode ^
        Country.hashCode ^
        City.hashCode ^
        Rank_In_World.hashCode ^
        Description.hashCode ^
        Global_Score.hashCode ^
        Enrollment.hashCode;
  }
}
