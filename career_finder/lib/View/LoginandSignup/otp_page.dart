import 'dart:async';
import 'dart:convert';

import 'package:career_finder/View/LoginandSignup/otp_form.dart';
import 'package:career_finder/View/LoginandSignup/verify_email.dart';
import 'package:career_finder/View/Utils/constants.dart';
import 'package:career_finder/View/Utils/custom_backbotton.dart';
import 'package:career_finder/View/Utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/custom_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class OtpPage extends ConsumerStatefulWidget {
  const OtpPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OtpPageState();
}

class _OtpPageState extends ConsumerState<OtpPage> {
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
        if (_time <= 0) {
          _timer!.cancel();
        }
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

  sendOtp() async {
    final url = Uri.parse('http://192.168.1.70:3000/otp/generateOTP');
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(url,
        headers: headers,
        body: jsonEncode({"email": ref.watch(emailStateProvider)}));

    if (response.statusCode == 201) {
      startTimer();
    }
  }

  confirmOTP() async {
    final url = Uri.parse('http://192.168.1.70:3000/otp/verifyOTP');
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(url,
        headers: headers,
        body: jsonEncode({
          "email": ref.watch(emailStateProvider),
          "code": ref.watch(OtpStateProvider),
        }));

    if (response.statusCode == 201) {
      Navigator.pushNamed(context, MyRoutes.signupPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    String email = ref.watch(emailStateProvider);
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
            Text('Please enter the OTP you \n received on $email',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
            const Spacer(flex: 1),
            const OtpForm(),
            const Spacer(flex: 1),
            Container(
              alignment: Alignment.center,
              child: (_time <= 0)
                  ? Text(
                      'OTP Expired ',
                      style: const TextStyle(color: Colors.red),
                    )
                  : Text(
                      'Expires in $time',
                      style: const TextStyle(color: myTimerColor),
                    ),
            ),
            const Spacer(flex: 1),
            CustomButton(
              text: 'Confirm OTP',
              ontap: () => confirmOTP(),
            ),
            const Spacer(flex: 2),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.arrow_counterclockwise),
                label: GestureDetector(
                    onTap: sendOtp, child: Text('Resend again')),
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
