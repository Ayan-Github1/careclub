import 'package:careclub/View/Utilities/colors.dart';
import 'package:careclub/View/Utilities/material_button.dart';
import 'package:careclub/View/Utilities/text_field.dart';
import 'package:careclub/View/Screens/home_screen.dart';
import 'package:careclub/View/Screens/otp_screen.dart';
import 'package:careclub/ViewModel/auth_methods.dart';
import 'package:flutter/material.dart';
import 'package:ms_undraw/ms_undraw.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _loginForm = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 31,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _loginForm,
              child: Column(
                children: [
                  const Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 150,
                    child: UnDraw(
                        illustration: UnDrawIllustration.login,
                        color: btnColor),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  InputFormField(
                    hint: 'Enter your email',
                    label: 'Email',
                    radius: 15,
                    icon: Icons.mail,
                    errorMessage: 'Email must not be empty',
                    generalController: _emailController,
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
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  MaterialBtn(
                    height: 55,
                    width: MediaQuery.of(context).size.width * 0.5,
                    color: btnColor,
                    text: 'LOGIN',
                    radius: 18,
                    function: () async {
                      if (_loginForm.currentState!.validate()) {
                        String rec = await AuthMethods().login(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        if (rec == 'success') {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        } else {
                          const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: const Text(
                          'Dont have an account?',
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OTPScreen(),
                          ),
                        ),
                        child: Container(
                          child: const Text(
                            ' Register',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: labelColor,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                      ),
                    ],
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
