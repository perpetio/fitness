import 'package:flutter/material.dart';

class SettingsTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  const SettingsTextField({Key? key, required this.controller, this.obscureText = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ));
  }
}
