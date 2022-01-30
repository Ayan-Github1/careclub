import 'package:careclub/View/Utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:ms_undraw/ms_undraw.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 200,
          child: UnDraw(
              illustration: UnDrawIllustration.under_construction,
              color: btnColor),
        ),
        const Text("WE ARE UNDER CONSTRUCTION"),
      ],
    );
  }
}
