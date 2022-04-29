import 'package:careclub/View/Utilities/colors.dart';
import 'package:flutter/material.dart';

class FileButton extends StatelessWidget {
  final IconData? icon;
  final Function()? function;

  const FileButton({
    Key? key,
    this.icon,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.09,
        width: 55,
        decoration: BoxDecoration(
          border: Border.all(color: btnColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: GestureDetector(
          onTap: function,
          child: Icon(
            icon,
            color: labelColor,
          ),
        ));
  }

  Widget containText(BuildContext context, String text) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      // width: 240.0, removed this because of using expanded widget DO NOT UNCOMMENT
      decoration: BoxDecoration(
        border: Border.all(color: btnColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, color: labelColor),
        ),
      ),
    );
  }
}
