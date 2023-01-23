import 'package:career_finder/Utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showpassword = true;
  final String loginpic = 'assets/svg/loginimage.svg';
  final _formkey = GlobalKey<FormState>();
  bool loginaccess = false;

  @override
  Widget build(BuildContext context) {
    validateform() async {
      if (_formkey.currentState!.validate()) {
        setState(() {
          loginaccess = true;
        });
        await Future.delayed(
          const Duration(seconds: 1),
          () {},
        );
        await Navigator.pushNamed(context, MyRoutes.homepage);
        setState(() {
          loginaccess = false;
        });
      }
    }

    var devicewidth = MediaQuery.of(context).size.width;
    return Material(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 350,
                    child: SvgPicture.asset(
                      loginpic,
                      fit: BoxFit.contain,
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Enter Email',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !value.contains('@') ||
                          !value.contains('.com') ||
                          value.length < 6) {
                        return 'Please enter valid email';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: showpassword,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showpassword = !showpassword;
                            });
                          },
                          icon: Icon(
                              showpassword ? Icons.lock : Icons.lock_open)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Enter Password',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value!.length < 8) {
                        return 'Enter atleast 8 characters';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Forgot Password ?',
                          style:
                              TextStyle(decoration: TextDecoration.underline)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      validateform();
                    },
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      alignment: Alignment.center,
                      width: loginaccess ? devicewidth / 6 : devicewidth / 2,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: loginaccess
                          ? Icon(Icons.done)
                          : Text('Login', textScaleFactor: 1.5),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, MyRoutes.signuppage);
                        },
                        child: const Text('Register'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
