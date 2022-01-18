import 'package:careclub/View/Utilities/colors.dart';
import 'package:flutter/material.dart';

class GridContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  const GridContainer({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 170,
      decoration: BoxDecoration(
        border: Border.all(
          color: btnColor,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          Text(text),
        ],
      ),
    );
  }
}
