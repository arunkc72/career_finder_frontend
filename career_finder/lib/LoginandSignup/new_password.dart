
import 'package:career_finder/Utils/constants.dart';
import 'package:career_finder/Utils/custom_backbotton.dart';
import 'package:career_finder/Utils/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../Utils/custom_button.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
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
            Text('Enter your password',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
            const Spacer(flex: 1),
            const SizedBox(child: Text('New Password :')),
            const CustomTextField(
              text: 'Enter your new password',
            ),
            const Spacer(flex: 1),
            const SizedBox(child: Text('Confirm your new password :')),
            const CustomTextField(
              text: 'Confirm your new password',
            ),
            const Spacer(flex: 1),
            const CustomButton(
              text: 'Login',
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
