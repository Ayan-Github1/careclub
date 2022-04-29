import 'package:careclub/View/Screens/login_screen.dart';
import 'package:careclub/View/Utilities/colors.dart';
import 'package:careclub/View/Utilities/material_button.dart';
import 'package:careclub/View/Utilities/text_field.dart';
import 'package:flutter/material.dart';
import 'package:ms_undraw/ms_undraw.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  final _resetForm = GlobalKey<FormState>();
  final TextEditingController _newPassController = TextEditingController();
  final TextEditingController _newConfirmPassController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 31),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _resetForm,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    height: 170,
                    child: UnDraw(
                        illustration: UnDrawIllustration.forgot_password,
                        color: btnColor),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  InputFormField(
                    hint: 'Enter your new password',
                    label: 'Password',
                    radius: 15,
                    icon: Icons.password,
                    errorMessage: 'Password must not be empty',
                    generalController: _newPassController,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  InputFormField(
                    hint: 'Confirm your new password',
                    label: 'Password',
                    radius: 15,
                    icon: Icons.password,
                    errorMessage: 'Password must not be empty',
                    generalController: _newConfirmPassController,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  MaterialBtn(
                    height: 55,
                    width: MediaQuery.of(context).size.width * 0.5,
                    color: btnColor,
                    text: 'RESET',
                    radius: 18,
                    function: () {
                      // first she snack bar or toast message of password reset and then navigate
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
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
