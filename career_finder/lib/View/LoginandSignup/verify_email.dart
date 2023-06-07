import 'dart:convert';

import 'package:career_finder/View/Utils/constants.dart';
import 'package:career_finder/View/Utils/custom_backbotton.dart';
import 'package:career_finder/View/Utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final emailStateProvider = StateProvider<String>((ref) {
  return '';
});

class VerifyEmail extends ConsumerStatefulWidget {
  const VerifyEmail({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends ConsumerState<VerifyEmail> {
  updateEmail(String email, WidgetRef ref) {
    ref.read(emailStateProvider.notifier).update((state) => email);
  }

  sendOtp(BuildContext context) async {
    final url = Uri.parse('http://192.168.18.5:3000/otp/generateOTP');
    final headers = {'Content-Type': 'application/json'};
    final updatedEmail = ref.watch(emailStateProvider);
    final response = await http.post(url,
        headers: headers, body: jsonEncode({"email": updatedEmail}));

    if (response.statusCode == 201) {
      print(response.body);
      Navigator.pushNamed(context, MyRoutes.otpPage, arguments: updatedEmail);
    } else {
      // Login failed, handle the error response
      print('OTP failed. Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: myPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 2),
              const CustomBackButton(),
              const Spacer(
                flex: 3,
              ),
              Text(
                'Verify email',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Row(
                children: [
                  const Text('If you already have an account.'),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Login Here !'),
                  ),
                ],
              ),
              const Spacer(flex: 1),
              Card(
                elevation: 10,
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter Email',
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) => updateEmail(value, ref),
                ),
              ),
              const Spacer(flex: 2),
              GestureDetector(
                onTap: () => sendOtp(context),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: myPrimaryColor,
                        offset: Offset(1, 3),
                        blurRadius: 5,
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Text('Confirm Email',
                      textScaleFactor: 1.5,
                      style: const TextStyle(color: Colors.white)),
                ),
              ),
              const Spacer(flex: 15),
            ],
          ),
        ),
      ),
    );
  }
}
