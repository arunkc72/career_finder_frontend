import 'package:career_finder/View/Utils/constants.dart';
import 'package:career_finder/View/Utils/custom_backbotton.dart';
import 'package:career_finder/View/Utils/custom_button.dart';
import 'package:career_finder/View/Utils/custom_textfield.dart';
import 'package:career_finder/View/Utils/routes.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({Key? key}) : super(key: key);

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
              const CustomTextField(text: 'Enter Email addresss'),
              const Spacer(flex: 2),
              CustomButton(
                text: 'Confirm Email',
                nextpage: MyRoutes.otpPage,
              ),
              const Spacer(flex: 15),
            ],
          ),
        ),
      ),
    );
  }
}
