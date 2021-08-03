import 'package:flutter/material.dart';

class SettingsTextField extends StatelessWidget {
  final TextEditingController controller;
  const SettingsTextField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
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
