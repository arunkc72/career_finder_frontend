import 'dart:async';

import 'package:career_finder/View/LoginandSignup/otp_form.dart';
import 'package:career_finder/View/Utils/constants.dart';
import 'package:career_finder/View/Utils/custom_backbotton.dart';
import 'package:career_finder/View/Utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/custom_button.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  Timer? _timer;
  int _time = 120;
  String time = '2:00';
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        _time--;
        formatTime(_time);
      });
    });
  }

  void formatTime(int seconds) {
    int sec = seconds % 60;
    int min = (seconds / 60).floor();
    time = '$min:$sec';
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: myPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(
              flex: 2,
            ),
            const CustomBackButton(),
            const Spacer(
              flex: 2,
            ),
            Text('Please enter the OTP you \n received on example@example.com',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
            const Spacer(flex: 1),
            const OtpForm(),
            const Spacer(flex: 1),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Expires in $time',
                style: const TextStyle(color: myTimerColor),
              ),
            ),
            const Spacer(flex: 1),
            CustomButton(
              text: 'Confirm OTP',
              nextpage: MyRoutes.signupPage,
            ),
            const Spacer(flex: 2),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.arrow_counterclockwise),
                label: const Text('Resend again'),
              ),
            ),
            const Spacer(
              flex: 10,
            )
          ],
        ),
      ),
    );
  }
}
