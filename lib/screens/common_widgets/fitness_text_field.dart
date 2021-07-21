import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/const/path_constants.dart';
import 'package:flutter/material.dart';

class FitnessTextField extends StatefulWidget {
  final String title;
  final String placeholder;
  final bool obscureText;
  final TextEditingController controller;
  final VoidCallback onTextChanged;

  const FitnessTextField({
    required this.title,
    required this.placeholder,
    this.obscureText = false,
    required this.controller,
    required this.onTextChanged,
    Key? key,
  }) : super(key: key);

  @override
  _FitnessTextFieldState createState() => _FitnessTextFieldState();
}

class _FitnessTextFieldState extends State<FitnessTextField> {
  final focusNode = FocusNode();
  bool stateObscureText = false;

  @override
  void initState() {
    super.initState();

    focusNode.addListener(() {
      setState(() {});
    });

    stateObscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createHeader(),
          SizedBox(height: 5),
          _createTextFieldStack(),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return Text(
      widget.title,
      style: TextStyle(
        color: focusNode.hasFocus
            ? ColorConstants.primaryColor
            : ColorConstants.grey,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _createTextFieldStack() {
    return Stack(
      children: [
        _createTextField(),
        if (widget.obscureText) ...[
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: _createShowEye(),
          ),
        ],
      ],
    );
  }

  Widget _createTextField() {
    return TextField(
      focusNode: focusNode,
      controller: widget.controller,
      obscureText: stateObscureText,
      style: TextStyle(
        color: ColorConstants.textBlack,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: ColorConstants.textFieldBorder.withOpacity(0.4),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: ColorConstants.primaryColor,
          ),
        ),
        hintText: widget.placeholder,
        hintStyle: TextStyle(
          color: ColorConstants.grey,
          fontSize: 16,
        ),
        filled: true,
        fillColor: ColorConstants.textFieldBackground,
      ),
      onChanged: (text) {
        setState(() {});
        widget.onTextChanged();
      },
    );
  }

  Widget _createShowEye() {
    return GestureDetector(
      onTap: () {
        setState(() {
          stateObscureText = !stateObscureText;
        });
      },
      child: Image(
        image: AssetImage(
          PathConstants.eye,
        ),
        color: widget.controller.text.isNotEmpty
            ? ColorConstants.primaryColor
            : ColorConstants.grey,
      ),
    );
  }
}
