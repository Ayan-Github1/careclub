// ignore_for_file: avoid_print

import 'package:careclub/View/Screens/verification_admin.dart';
import 'package:careclub/View/Utilities/colors.dart';
import 'package:careclub/View/Utilities/material_button.dart';
import 'package:careclub/View/Utilities/text_field.dart';
import 'package:careclub/View/Screens/login_screen.dart';
import 'package:careclub/ViewModel/auth_methods.dart';
import 'package:flutter/material.dart';
import 'package:ms_undraw/ms_undraw.dart';
import 'package:careclub/View/Screens/otp_screen.dart';

final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmController = TextEditingController();

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _registerForm = GlobalKey<FormState>();

  // Object? radioItem = '';
  bool isSeclected = false;
  // int val = 0;

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 31),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _registerForm,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    height: 150,
                    child: UnDraw(
                        illustration: UnDrawIllustration.authentication,
                        color: btnColor),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  InputFormField(
                    hint: 'Enter your username',
                    label: 'Username',
                    radius: 15,
                    icon: Icons.person,
                    errorMessage: 'Username must not be empty',
                    generalController: usernameController,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  InputFormField(
                    hint: 'Enter your password',
                    label: 'Password',
                    radius: 15,
                    icon: Icons.password,
                    errorMessage: 'Password must not be empty',
                    generalController: passwordController,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  InputFormField(
                    hint: 'Confirm Password',
                    label: 'Password',
                    radius: 15,
                    icon: Icons.password,
                    errorMessage: 'Password must not be empty',
                    generalController: confirmController,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        activeColor: btnColor,
                        value: isSeclected,
                        onChanged: (value) {
                          setState(
                            () {
                              isSeclected = value!;
                            },
                          );
                        },
                      ),
                      const Text("Register As Admin")
                      // Row(
                      //   children: [
                      //     Transform.scale(
                      //       scale: 1.2,
                      //       child: Radio(
                      //         activeColor: btnColor,
                      //         value: 0,
                      //         groupValue: radioItem,
                      //         onChanged: (value) {
                      //           setState(
                      //             () {
                      //               radioItem = value;
                      //               isSeclected = true;
                      //             },
                      //           );
                      //         },
                      //       ),
                      //     ),
                      //     const Text(
                      //       "Admin",
                      //       style: TextStyle(fontSize: 17),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  isSeclected == true
                      ? MaterialBtn(
                          height: 55,
                          width: MediaQuery.of(context).size.width * 0.5,
                          color: btnColor,
                          text: 'NEXT',
                          radius: 18,
                          function: () {
                            if (passwordController.text ==
                                confirmController.text) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Verfication(),
                                ),
                              );
                            } else {
                              //create a toast or snackbar to show below issue
                              print("Passwords are not same");
                            }
                          },
                        )
                      : MaterialBtn(
                          height: 55,
                          width: MediaQuery.of(context).size.width * 0.5,
                          color: btnColor,
                          text: 'REGISTER',
                          radius: 18,
                          function: () async {
                            if (passwordController.text ==
                                    confirmController.text &&
                                _registerForm.currentState!.validate()) {
                              String rec = await AuthMethods().register(
                                email: emailController.text,
                                password: passwordController.text,
                                username: usernameController.text,
                              );
                              if (rec == 'success') {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              }
                            } else {
                              //create a toast or snackbar to show below issue
                              print('Password do not match');
                            }
                          },
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
