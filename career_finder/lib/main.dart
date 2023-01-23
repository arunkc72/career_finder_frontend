import 'package:career_finder/LoginandSignup/login_page.dart';
import 'package:career_finder/LoginandSignup/signup_page.dart';
import 'package:career_finder/Utils/apptheme.dart';
import 'package:career_finder/Utils/routes.dart';
import 'package:career_finder/pages/home_page.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyThemes.lighttheme,
      darkTheme: MyThemes.darktheme,
      initialRoute: MyRoutes.loginpage,
      routes: {
        MyRoutes.loginpage: (context) => const LoginPage(),
        MyRoutes.signuppage: (context) => const SignUpPage(),
        MyRoutes.homepage: (context) => const HomePage(),
      },
    );
  }
}
