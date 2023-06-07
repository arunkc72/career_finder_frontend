import 'package:career_finder/View/LoginandSignup/login_page.dart';
import 'package:career_finder/View/LoginandSignup/otp_page.dart';
import 'package:career_finder/View/LoginandSignup/new_password.dart';
import 'package:career_finder/View/LoginandSignup/signup_page.dart';
import 'package:career_finder/View/LoginandSignup/splash_page.dart';
import 'package:career_finder/View/Utils/apptheme.dart';
import 'package:career_finder/View/Utils/routes.dart';
import 'package:career_finder/View/Course/interest_page.dart';
import 'package:career_finder/View/Profile/profile_page.dart';
import 'package:career_finder/View/home_page.dart';
import 'package:career_finder/View/ready_page.dart';
import 'package:career_finder/View/option_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'View/LoginandSignup/password_recovery.dart';
import 'View/LoginandSignup/verify_email.dart';
import 'View/University-College/question_page.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemes.lighttheme,
      initialRoute: MyRoutes.splashPage,
      routes: {
        MyRoutes.splashPage: (context) => const SplashScreen(),
        MyRoutes.loginPage: (context) => const LoginPage(),
        MyRoutes.signupPage: (context) => const SignupPage(),
        MyRoutes.readyPage: (context) => const ReadyPage(),
        MyRoutes.verifyEmailPage: (context) => const VerifyEmail(),
        MyRoutes.otpPage: (context) => const OtpPage(),
        MyRoutes.passwordRecovery: (context) => const PasswordRecovery(),
        MyRoutes.newPassword: (context) => const NewPassword(),
        // options
        MyRoutes.optionPage: (context) => const OptionPage(),
        //course
        MyRoutes.interestPage: (context) => const InterestPage(),
        //home
        MyRoutes.homePage: (context) => const HomePage(),
        MyRoutes.collegeQuestionPage: (context) => const CampusQuestion(
              college: true,
            ),
        MyRoutes.universityQuestionPage: (context) => const CampusQuestion(
              college: false,
            ),

        '/abcd': (context) => const ProfilePage(),
      },
    );
  }
}
