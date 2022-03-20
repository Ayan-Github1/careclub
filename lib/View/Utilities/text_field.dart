import 'package:careclub/View/Utilities/colors.dart';
import 'package:flutter/material.dart';

class InputFormField extends StatelessWidget {
  final String hint;
  final String label;
  final double radius;
  final IconData icon;
  final String errorMessage;
  final TextEditingController generalController;
  final TextInputType textInputType;

  const InputFormField({
    Key? key,
    required this.hint,
    required this.label,
    required this.radius,
    required this.icon,
    required this.errorMessage,
    required this.generalController,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputDeco = InputDecoration(     
      contentPadding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
        borderSide: BorderSide(color: labelColor),
      ),
      hintText: hint,
      hintStyle: const TextStyle(
        color: hintColor,
      ),
      labelText: label,
      labelStyle: const TextStyle(
        color: labelColor,
      ),
      prefixIcon: Icon(icon),
    );
      // height: 55,
      // width: 350,
    return TextFormField(
      keyboardType: textInputType,
      decoration: inputDeco,
      controller: generalController,
      validator: (value) {
        if (value!.isEmpty) {
          return errorMessage;
        }
      },
    );
  }
}
