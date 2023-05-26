// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class University {
   final String? University_link;
  final String? Picture_Url;
  final String? University_Name;
  final String? nation_flag_picture;
  final String? Country;
  final String? City;
  final String? Rank_In_World;
  final String? Description;
  final double? Global_Score;
  final String? Enrollment;
  final double? country_latitude;
  final double? country_longitude;
  final double? city_latitude;
  final double? city_longitude;
  University({
    this.University_link,
    this.Picture_Url,
    this.University_Name,
    this.nation_flag_picture,
    this.Country,
    this.City,
    this.Rank_In_World,
    this.Description,
    this.Global_Score,
    this.Enrollment,
    this.country_latitude,
    this.country_longitude,
    this.city_latitude,
    this.city_longitude,
  });

  University copyWith({
    String? University_link,
    String? Picture_Url,
    String? University_Name,
    String? nation_flag_picture,
    String? Country,
    String? City,
    String? Rank_In_World,
    String? Description,
    double? Global_Score,
    String? Enrollment,
    double? country_latitude,
    double? country_longitude,
    double? city_latitude,
    double? city_longitude,
  }) {
    return University(
      University_link: University_link ?? this.University_link,
      Picture_Url: Picture_Url ?? this.Picture_Url,
      University_Name: University_Name ?? this.University_Name,
      nation_flag_picture: nation_flag_picture ?? this.nation_flag_picture,
      Country: Country ?? this.Country,
      City: City ?? this.City,
      Rank_In_World: Rank_In_World ?? this.Rank_In_World,
      Description: Description ?? this.Description,
      Global_Score: Global_Score ?? this.Global_Score,
      Enrollment: Enrollment ?? this.Enrollment,
      country_latitude: country_latitude ?? this.country_latitude,
      country_longitude: country_longitude ?? this.country_longitude,
      city_latitude: city_latitude ?? this.city_latitude,
      city_longitude: city_longitude ?? this.city_longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'University_link': University_link,
      'Picture_Url': Picture_Url,
      'University_Name': University_Name,
      'nation_flag_picture': nation_flag_picture,
      'Country': Country,
      'City': City,
      'Rank_In_World': Rank_In_World,
      'Description': Description,
      'Global_Score': Global_Score,
      'Enrollment': Enrollment,
      'country_latitude': country_latitude,
      'country_longitude': country_longitude,
      'city_latitude': city_latitude,
      'city_longitude': city_longitude,
    };
  }

  factory University.fromMap(Map<String, dynamic> map) {
    return University(
      University_link: map['University_link'] != null ? map['University_link'] as String : null,
      Picture_Url: map['Picture_Url'] != null ? map['Picture_Url'] as String : null,
      University_Name: map['University_Name'] != null ? map['University_Name'] as String : null,
      nation_flag_picture: map['nation_flag_picture'] != null ? map['nation_flag_picture'] as String : null,
      Country: map['Country'] != null ? map['Country'] as String : null,
      City: map['City'] != null ? map['City'] as String : null,
      Rank_In_World: map['Rank_In_World'] != null ? map['Rank_In_World'] as String : null,
      Description: map['Description'] != null ? map['Description'] as String : null,
      Global_Score: map['Global_Score'] != null ? map['Global_Score'] as double : null,
      Enrollment: map['Enrollment'] != null ? map['Enrollment'] as String : null,
      country_latitude: map['country_latitude'] != null ? map['country_latitude'] as double : null,
      country_longitude: map['country_longitude'] != null ? map['country_longitude'] as double : null,
      city_latitude: map['city_latitude'] != null ? map['city_latitude'] as double : null,
      city_longitude: map['city_longitude'] != null ? map['city_longitude'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory University.fromJson(String source) => University.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'University(University_link: $University_link, Picture_Url: $Picture_Url, University_Name: $University_Name, nation_flag_picture: $nation_flag_picture, Country: $Country, City: $City, Rank_In_World: $Rank_In_World, Description: $Description, Global_Score: $Global_Score, Enrollment: $Enrollment, country_latitude: $country_latitude, country_longitude: $country_longitude, city_latitude: $city_latitude, city_longitude: $city_longitude)';
  }

  @override
  bool operator ==(covariant University other) {
    if (identical(this, other)) return true;
  
    return 
      other.University_link == University_link &&
      other.Picture_Url == Picture_Url &&
      other.University_Name == University_Name &&
      other.nation_flag_picture == nation_flag_picture &&
      other.Country == Country &&
      other.City == City &&
      other.Rank_In_World == Rank_In_World &&
      other.Description == Description &&
      other.Global_Score == Global_Score &&
      other.Enrollment == Enrollment &&
      other.country_latitude == country_latitude &&
      other.country_longitude == country_longitude &&
      other.city_latitude == city_latitude &&
      other.city_longitude == city_longitude;
  }

  @override
  int get hashCode {
    return University_link.hashCode ^
      Picture_Url.hashCode ^
      University_Name.hashCode ^
      nation_flag_picture.hashCode ^
      Country.hashCode ^
      City.hashCode ^
      Rank_In_World.hashCode ^
      Description.hashCode ^
      Global_Score.hashCode ^
      Enrollment.hashCode ^
      country_latitude.hashCode ^
      country_longitude.hashCode ^
      city_latitude.hashCode ^
      city_longitude.hashCode;
  }
}
