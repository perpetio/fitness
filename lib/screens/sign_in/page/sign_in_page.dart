import 'package:fitness_flutter/screens/sign_in/widget/sign_in_content.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInContent(),
    );
  }
}
