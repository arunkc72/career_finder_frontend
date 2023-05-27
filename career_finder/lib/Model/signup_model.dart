// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Signup {
  final String? email;
  final String? password;
  final String? username;
  final String? phoneNumber;
  final String confirmPassword;
  Signup({
    this.email,
    this.password,
    this.username,
    this.phoneNumber,
    required this.confirmPassword,
  });

  Signup copyWith({
    String? email,
    String? password,
    String? username,
    String? phoneNumber,
    String? confirmPassword,
  }) {
    return Signup(
      email: email ?? this.email,
      password: password ?? this.password,
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'username': username,
      'phoneNumber': phoneNumber,
      'confirmPassword': confirmPassword,
    };
  }

  factory Signup.fromMap(Map<String, dynamic> map) {
    return Signup(
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      phoneNumber: map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      confirmPassword: map['confirmPassword'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Signup.fromJson(String source) => Signup.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Signup(email: $email, password: $password, username: $username, phoneNumber: $phoneNumber, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(covariant Signup other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.password == password &&
      other.username == username &&
      other.phoneNumber == phoneNumber &&
      other.confirmPassword == confirmPassword;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      password.hashCode ^
      username.hashCode ^
      phoneNumber.hashCode ^
      confirmPassword.hashCode;
  }
}
