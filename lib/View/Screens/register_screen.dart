import 'package:careclub/View/Screens/verification_admin.dart';
import 'package:careclub/View/Utilities/colors.dart';
import 'package:careclub/View/Utilities/material_button.dart';
import 'package:careclub/View/Utilities/text_field.dart';
import 'package:careclub/View/Screens/login_screen.dart';
import 'package:careclub/ViewModel/auth_methods.dart';
import 'package:flutter/material.dart';
import 'package:ms_undraw/ms_undraw.dart';
import 'package:careclub/View/Screens/otp_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final _registerForm = GlobalKey<FormState>();

  Object? radioItem = '';
  bool isSeclected = false;
  int val = 0;

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
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
                    generalController: _usernameController,
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
                    generalController: _passwordController,
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
                    generalController: _confirmController,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.2,
                            child: Radio(
                              activeColor: btnColor,
                              value: 0,
                              groupValue: radioItem,
                              onChanged: (value) {
                                setState(
                                  () {
                                    radioItem = value;
                                    isSeclected = true;
                                  },
                                );
                              },
                            ),
                          ),
                          const Text(
                            "Admin",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.2,
                            child: Radio(
                              activeColor: btnColor,
                              value: 1,
                              groupValue: radioItem,
                              onChanged: (value) {
                                setState(
                                  () {
                                    radioItem = value;
                                    isSeclected = true;
                                    val = 1;
                                  },
                                );
                              },
                            ),
                          ),
                          const Text(
                            "Donator",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  isSeclected == true && val == 0
                      ? MaterialBtn(
                          height: 55,
                          width: MediaQuery.of(context).size.width * 0.5,
                          color: btnColor,
                          text: 'NEXT',
                          radius: 18,
                          function: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Verfication(),
                              ),
                            );
                          },
                        )
                      : MaterialBtn(
                          height: 55,
                          width: MediaQuery.of(context).size.width * 0.5,
                          color: btnColor,
                          text: 'REGISTER',
                          radius: 18,
                          function: () async {
                            if (_passwordController.text ==
                                    _confirmController.text &&
                                _registerForm.currentState!.validate()) {
                              String rec = await AuthMethods().register(
                                email: emailController.text,
                                password: _passwordController.text,
                                username: _usernameController.text,
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
