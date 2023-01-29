import 'package:career_finder/Utils/constants.dart';
import 'package:career_finder/Utils/custom_backbotton.dart';
import 'package:career_finder/Utils/custom_textfield.dart';
import 'package:career_finder/Utils/routes.dart';
import 'package:flutter/material.dart';

import '../Utils/custom_button.dart';

class PasswordRecovery extends StatelessWidget {
  const PasswordRecovery({Key? key}) : super(key: key);

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
            Text(
              'Password Recovery',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Text(
                'Please enter the account that you want to \n reset the password'),
            const Spacer(flex: 1),
            const CustomTextField(text: 'Enter email address'),
            const Spacer(
              flex: 1,
            ),
            CustomButton(
              text: 'Send reset Email',
              nextpage: MyRoutes.newPassword,
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
