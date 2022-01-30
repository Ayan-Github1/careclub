import 'package:careclub/View/Utilities/colors.dart';
import 'package:careclub/View/Utilities/material_button.dart';
import 'package:careclub/View/Utilities/text_field.dart';
import 'package:careclub/View/Screens/login_screen.dart';
import 'package:careclub/View/Screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:ms_undraw/ms_undraw.dart';
import 'package:email_auth/email_auth.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController _otpController = TextEditingController();

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _otpForm = GlobalKey<FormState>();
  String otp = 'GET OTP';

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    _otpController.dispose();
  }

  late EmailAuth emailAuth;
  @override
  void initState() {
    super.initState();
    emailAuth = EmailAuth(sessionName: 'OTP');
  }

  void sendOtp() async {
    var response = await emailAuth.sendOtp(recipientMail: emailController.text);
    if (response) {
      //TODO Create a toast or a snack bar to show mwssage of sent otp... for now printing on console
      // ignore: avoid_print
      print("OTP sent to entered email");
    } else {
      //TODO Create a toast or a snack bar to show mwssage of sent otp... for now printing on console
      // ignore: avoid_print
      print("Unable to send OTP");
    }
  }

  void valOTP(BuildContext context) {
    var response = emailAuth.validateOtp(
        recipientMail: emailController.text, userOtp: _otpController.text);
    if (response) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        ),
      );
    } else {
      // ignore: avoid_print
      print('Didnt received otp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 31),
          child: SafeArea(
            child: Form(
              key: _otpForm,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'REGISTER',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 180,
                    child: UnDraw(
                      illustration: UnDrawIllustration.access_account,
                      color: btnColor,
                    ),
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
                    generalController: emailController,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  InputFormField(
                    hint: 'Enter OTP',
                    label: 'OTP',
                    radius: 15,
                    icon: Icons.vpn_key,
                    errorMessage: 'Please fill in the OTP',
                    generalController: _otpController,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  MaterialBtn(
                    height: 55,
                    width: MediaQuery.of(context).size.width * 0.5,
                    color: btnColor,
                    text: otp,
                    radius: 18,
                    function: () {
                      if (_otpController.text.isEmpty) {
                        sendOtp();
                        setState(() {
                          otp = 'NEXT';
                        });
                      } else {
                        valOTP(context);
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: const Text(
                          'Already have an account? ',
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        ),
                        child: Container(
                          child: const Text(
                            ' Sign In.',
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
