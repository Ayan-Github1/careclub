import 'package:flutter/material.dart';

class MaterialBtn extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final String text;
  final double radius;
  final Function()? function;

  const MaterialBtn({
    Key? key,
    required this.height,
    required this.width,
    required this.color,
    required this.text,
    required this.radius,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: MaterialButton(
        highlightElevation: 0.0,
        elevation: 0.0,
        splashColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        color: color,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        onPressed: function,
      ),
    );
  }
}
