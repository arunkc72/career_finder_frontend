import 'package:career_finder/View/Utils/constants.dart';
import 'package:career_finder/View/Utils/custom_textfield.dart';
import 'package:career_finder/View/Utils/routes.dart';
import 'package:flutter/material.dart';

import '../Utils/custom_backbotton.dart';
import '../Utils/custom_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formkey = GlobalKey<FormState>();
  validateform() {
    if (_formkey.currentState!.validate()) {
      Navigator.pushNamed(context, MyRoutes.loginPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: myPadding,
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(flex: 3),
                      const CustomBackButton(),
                      const Spacer(flex: 2),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Sign Up\n',
                                style:
                                    Theme.of(context).textTheme.headlineLarge),
                            TextSpan(
                                text: 'Welcome Here !',
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                          ],
                        ),
                      ),
                      const Spacer(flex: 1),
                      Row(
                        children: [
                          const Text('If you already have an account.'),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, MyRoutes.loginPage);
                            },
                            child: const Text('Login Here !'),
                          ),
                        ],
                      ),
                      const CustomTextField(text: 'Create Username'),
                      const Spacer(flex: 1),
                      const CustomTextField(text: 'Phone number'),
                      const Spacer(flex: 1),
                      const CustomTextField(text: 'Create Password'),
                      const Spacer(flex: 1),
                      const CustomTextField(text: 'Confirm password'),
                      const Spacer(flex: 1),
                      CustomButton(
                          text: 'Register', nextpage: MyRoutes.loginPage),
                      const Spacer(flex: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
