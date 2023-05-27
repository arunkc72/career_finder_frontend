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
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  String? _errorUser, _errorPhone, _errorPassword, _errorConfirm;
  bool signupaccess = false;
  void validateform() async {
    final usernameValue = usernameController.text;
    final phoneValue = phoneController.text;
    final passwordValue = passwordController.text;
    final confirmValue = confirmController.text;

    setState(() {
      _errorUser = null;
      _errorPhone = null;
      _errorPassword = null;
      _errorConfirm = null;
    });

    bool signupaccess = true;
    if (usernameValue.isEmpty) {
      setState(() {
        _errorUser = 'Please enter valid email';
      });
      signupaccess = false;
    }
    if (phoneValue.isEmpty || phoneValue.length != 10) {
      setState(() {
        _errorPhone = 'Please enter valid Phone Number';
      });
      signupaccess = false;
    }

    if (passwordValue.isEmpty || passwordValue.length < 8) {
      setState(() {
        _errorPassword = 'Please enter valid password';
      });
      signupaccess = false;
    }

    if (confirmValue != passwordValue) {
      setState(() {
        _errorConfirm = 'The passwords don\'t match';
      });
      signupaccess = false;
    }

    if (signupaccess) {
      await Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushNamed(context, MyRoutes.loginPage);
      });
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
                      CustomTextField(
                        text: 'Create Username',
                        index: 0,
                        controller: usernameController,
                      ),
                      if (_errorUser != null)
                        Text(
                          _errorUser!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      const Spacer(flex: 1),
                      CustomTextField(
                        text: 'Phone number',
                        index: 1,
                        controller: phoneController,
                      ),
                      if (_errorPhone != null)
                        Text(
                          _errorPhone!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      const Spacer(flex: 1),
                      CustomTextField(
                        text: 'Create Password',
                        index: 2,
                        controller: passwordController,
                      ),
                      if (_errorUser != null)
                        Text(
                          _errorPassword!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      const Spacer(flex: 1),
                      CustomTextField(
                        text: 'Confirm password',
                        index: 3,
                        controller: confirmController,
                      ),
                      if (_errorConfirm != null)
                        Text(
                          _errorConfirm!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      const Spacer(flex: 1),
                      CustomButton(text: 'Register', ontap: validateform),
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
