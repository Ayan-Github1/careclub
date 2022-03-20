import 'package:careclub/View/Screens/login_screen.dart';
import 'package:careclub/View/Screens/otp_screen.dart';
import 'package:careclub/View/Utilities/colors.dart';
import 'package:careclub/View/Utilities/material_button.dart';
import 'package:flutter/material.dart';
import 'package:ms_undraw/ms_undraw.dart';


class FrontScreen extends StatelessWidget {
  const FrontScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 31),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'CARE CLUB',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //Illustration widget
                  SizedBox(
                    height: 250,
                    child: UnDraw(
                      illustration: UnDrawIllustration.hello,
                      color: btnColor,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  MaterialBtn(
                    height: 55,
                    width: 350,
                    color: btnColor,
                    text: 'LOGIN',
                    radius: 18,
                    function: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 60.0,
                  ),
                  MaterialBtn(
                    height: 55,
                    width: 350,
                    color: btnColor,
                    text: 'REGISTER',
                    radius: 18,
                    function: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OTPScreen(),
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
