import 'package:career_finder/LoginandSignup/login_page.dart';
import 'package:career_finder/LoginandSignup/otp_page.dart';
import 'package:career_finder/LoginandSignup/new_password.dart';
import 'package:career_finder/LoginandSignup/signup_page.dart';
import 'package:career_finder/LoginandSignup/splash_page.dart';
import 'package:career_finder/Utils/apptheme.dart';
import 'package:career_finder/Utils/routes.dart';
import 'package:career_finder/pages/StartPages/ready_page.dart';
import 'package:career_finder/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'LoginandSignup/password_recovery.dart';
import 'LoginandSignup/verify_email.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
      initialRoute: MyRoutes.loginPage,
      routes: {
        MyRoutes.loginPage: (context) => const LoginPage(),
        MyRoutes.signupPage: (context) => const SignupPage(),
        MyRoutes.homePage: (context) => const HomePage(),
        MyRoutes.readyPage: (context) => const ReadyPage(),
        MyRoutes.splashPage: (context) => const SplashScreen(),
        MyRoutes.verifyEmailPage: (context) => const VerifyEmail(),
        MyRoutes.otpPage: (context) => const OtpPage(),
        MyRoutes.passwordRecovery: (context) => const PasswordRecovery(),
        MyRoutes.newPassword: (context) => const NewPassword(),
      },
    );
  }
}
