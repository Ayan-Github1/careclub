import 'package:careclub/View/Utilities/colors.dart';
import 'package:careclub/View/Utilities/material_button.dart';
import 'package:flutter/material.dart';
import 'package:ms_undraw/ms_undraw.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PAYMENTS'),
        backgroundColor: btnColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 50.0,
            ),
            SizedBox(
              height: 200,
              child: UnDraw(
                  illustration: UnDrawIllustration.mobile_pay, color: btnColor),
            ),
            const SizedBox(
              height: 50.0,
            ),
            MaterialBtn(
              height: 55,
              width: MediaQuery.of(context).size.width * 0.5,
              color: btnColor,
              text: 'PAY',
              radius: 18,
              function: () => Navigator.pop(
                context,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
