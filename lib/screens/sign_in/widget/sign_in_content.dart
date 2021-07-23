import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/screens/common_widgets/fitness_button.dart';
import 'package:fitness_flutter/screens/common_widgets/fitness_text_field.dart';
import 'package:fitness_flutter/screens/sign_in/bloc/signin_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInContent extends StatelessWidget {
  const SignInContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: ColorConstants.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _createHeader(),
            const SizedBox(height: 50),
            _createForm(context),
            const SizedBox(height: 20),
            _createForgotPasswordButton(context),
            const SizedBox(height: 40),
            _createSignInButton(),
            Spacer(),
            _createDoNotHaveAccountText(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _createHeader() {
    return Center(
      child: Text(
        'Sign In',
        style: TextStyle(
          color: ColorConstants.textBlack,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _createForm(BuildContext context) {
    final bloc = BlocProvider.of<SignInBloc>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FitnessTextField(
          title: TextConstants.email,
          placeholder: TextConstants.emailPlaceholder,
          controller: bloc.emailController,
          onTextChanged: () {
            bloc.add(OnTextChangeEvent());
          },
          errorText: TextConstants.emailErrorText,
        ),
        const SizedBox(
          height: 20,
        ),
        FitnessTextField(
          title: TextConstants.password,
          placeholder: TextConstants.passwordPlaceholderSignIn,
          controller: bloc.passwordController,
          onTextChanged: () {
            bloc.add(OnTextChangeEvent());
          },
          errorText: TextConstants.passwordErrorText,
          obscureText: true,
        ),
      ],
    );
  }

  Widget _createForgotPasswordButton(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(left: 21),
        child: Text(
          TextConstants.forgotPassword,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: ColorConstants.primaryColor,
          ),
        ),
      ),
      onTap: () {
        FocusScope.of(context).unfocus();
      },
    );
  }

  Widget _createSignInButton() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: FitnessButton(
        title: TextConstants.signIn,
      ),
    );
  }

  Widget _createDoNotHaveAccountText() {
    return Center(
      child: RichText(
        text: TextSpan(
          text: TextConstants.doNotHaveAnAccount,
          style: TextStyle(
            color: ColorConstants.textBlack,
            fontSize: 18,
          ),
          children: [
            TextSpan(
              text: " ${TextConstants.signUp}",
              style: TextStyle(
                color: ColorConstants.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
    );
    ;
  }
}
