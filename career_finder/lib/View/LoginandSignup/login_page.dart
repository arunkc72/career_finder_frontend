import 'dart:convert';

import 'package:career_finder/View/Utils/constants.dart';
import 'package:career_finder/View/Utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final facebookLogo = 'assets/logos/fblogo.svg';
  final appleLogo = 'assets/logos/applelogo.svg';
  final googleLogo = 'assets/logos/googlelogo.svg';
  bool showpassword = true;
  final _formkey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();
  String? _errorEmail;
  String? _errorPassword;
  bool loginaccess = false;
  void validateform() async {
    setState(() {
      _errorEmail = null;
      _errorPassword = null;
    });
    loginaccess = true;

    final emailValue = _emailKey.currentState!.value;
    final passwordValue = _passwordKey.currentState!.value;

    if (emailValue.isEmpty ||
        !emailValue.contains('@') ||
        !emailValue.contains('.com') ||
        emailValue.length < 6) {
      setState(() {
        _errorEmail = 'Please enter valid email';
      });
      loginaccess = false;
    }

    if (passwordValue.isEmpty || passwordValue.length < 6) {
      setState(() {
        _errorPassword = 'Please enter valid password';
      });
      loginaccess = false;
    }
    final url = Uri.parse('$myurl:3000/auth/login');
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(url,
        headers: headers,
        body: jsonEncode({"email": emailValue, "password": passwordValue}));
    
    var data =jsonDecode(response.body);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = data['token'];
    prefs.setString('token', token);

    settoken(String value) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', value);
    }

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      String token = data['token'];
      settoken(token);

      print('successfully login');
      SharedPreferences loggedIn = await SharedPreferences.getInstance();
      loggedIn.setString('state', "logged");
    } else {
      setState(() {
        loginaccess = false;
      });
      // Login failed, handle the error response
      print('Login failed. Error: ${response.statusCode}');
    }
    if (loginaccess) {
      await Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushNamed(context, MyRoutes.homePage);
      });

      setState(() {
        loginaccess = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var devicewidth = MediaQuery.of(context).size.width;
    return Material(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: myPadding,
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(flex: 5),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Sign In\n',
                              style: Theme.of(context).textTheme.headlineLarge),
                          TextSpan(
                              text: 'Welcome back !',
                              style: Theme.of(context).textTheme.headlineSmall),
                        ],
                      ),
                    ),
                    const Spacer(flex: 1),
                    Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          key: _emailKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Email or Username',
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !value.contains('@') ||
                                !value.contains('.com') ||
                                value.length < 6) {
                              return null;
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    if (_errorEmail != null)
                      Text(
                        _errorEmail!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    const Spacer(
                      flex: 1,
                    ),
                    Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          key: _passwordKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          obscureText: showpassword,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: TextButton(
                              onPressed: () {
                                setState(() {
                                  showpassword = !showpassword;
                                });
                              },
                              child: Text(showpassword ? 'Show' : 'Hide'),
                            ),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Password',
                          ),
                          validator: (value) {
                            if (value!.length < 8) {
                              return null;
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    if (_errorPassword != null)
                      Text(
                        _errorPassword!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    // Align(
                    //   alignment: Alignment.topRight,
                    //   child: TextButton(
                    //     onPressed: () {
                    //       Navigator.pushNamed(
                    //           context, MyRoutes.passwordRecovery);
                    //     },
                    //     child: const Text(
                    //       'Forgot Password ?',
                    //     ),
                    //   ),
                    // ),
                    const Spacer(
                      flex: 1,
                    ),
                    GestureDetector(
                      onTap: () {
                        validateform();
                      },
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        alignment: Alignment.center,
                        width: devicewidth,
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
                        child: loginaccess
                            ? Container(
                                height: 30,
                                width: 30,
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : const Text('Login',
                                textScaleFactor: 1.5,
                                style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const Spacer(flex: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?'),
                        TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, MyRoutes.verifyEmailPage);
                          },
                          child: const Text('Register here !'),
                        ),
                      ],
                    ),
                    const Spacer(flex: 1),
                    SizedBox(
                      width: double.infinity,
                      child: Text('Or continue with',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: Colors.black.withOpacity(0.5))),
                    ),
                    const Spacer(flex: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image:
                                    DecorationImage(image: Svg(facebookLogo))),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: Svg(appleLogo))),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: Svg(googleLogo))),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 3,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
