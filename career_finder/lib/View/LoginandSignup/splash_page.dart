import 'package:flutter/material.dart';

import '../Utils/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    SharedPreferences loggedIn = await SharedPreferences.getInstance();
    String? loginId = loggedIn.getString('state');

    Future.delayed(const Duration(seconds: 2)).then((value) {
      loginId == "logged"
          ? Navigator.pushReplacementNamed(context, MyRoutes.homePage)
          : Navigator.pushReplacementNamed(context, MyRoutes.loginPage);
    });
  }

  final splashlogo = 'assets/images/splashimage.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              splashlogo,
            ),
            Container(
              alignment: const Alignment(0, 0.4),
              child: const CircularProgressIndicator(
                color: Color(0xff0E387A),
              ),
            ),
            Positioned(
              bottom: 20,
              child: Container(
                  alignment: Alignment.center,
                  child: const Text('@2023 CAREER FINDER')),
            ),
          ],
        ),
      ),
    );
  }
}
