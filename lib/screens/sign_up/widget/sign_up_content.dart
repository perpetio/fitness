import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/screens/common_widgets/fitness_button.dart';
import 'package:fitness_flutter/screens/common_widgets/fitness_text_field.dart';
import 'package:fitness_flutter/screens/sign_up/bloc/signup_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorConstants.white,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20),
              _createTitle(),
              SizedBox(height: 50),
              _createForm(context),
              SizedBox(height: 40),
              _createSignUpButton(),
              Spacer(),
              _createHaveAccountText(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createTitle() {
    return Text(
      TextConstants.signUp,
      style: TextStyle(
        color: ColorConstants.textBlack,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _createForm(BuildContext context) {
    final bloc = BlocProvider.of<SignupBloc>(context);
    return Column(
      children: [
        FitnessTextField(
          title: TextConstants.username,
          placeholder: TextConstants.userNamePlaceholder,
          controller: bloc.userNameController,
          onTextChanged: () {
            bloc.add(OnTextChangedEvent());
          },
        ),
        SizedBox(height: 20),
        FitnessTextField(
          title: TextConstants.email,
          placeholder: TextConstants.emailPlaceholder,
          controller: bloc.emailController,
          onTextChanged: () {
            bloc.add(OnTextChangedEvent());
          },
        ),
        SizedBox(height: 20),
        FitnessTextField(
          title: TextConstants.password,
          placeholder: TextConstants.passwordPlaceholder,
          obscureText: true,
          controller: bloc.passwordController,
          onTextChanged: () {
            bloc.add(OnTextChangedEvent());
          },
        ),
        SizedBox(height: 20),
        FitnessTextField(
          title: TextConstants.confirmPassword,
          placeholder: TextConstants.confirmPasswordPlaceholder,
          obscureText: true,
          controller: bloc.confirmPasswordController,
          onTextChanged: () {
            bloc.add(OnTextChangedEvent());
          },
        ),
      ],
    );
  }

  Widget _createSignUpButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<SignupBloc, SignupState>(
        buildWhen: (_, currState) =>
            currState is SignUpButtonEnableChangedState,
        builder: (context, state) {
          return FitnessButton(
            title: TextConstants.signUp,
            isEnabled: state is SignUpButtonEnableChangedState
                ? state.isEnabled
                : false,
          );
        },
      ),
    );
  }

  Widget _createHaveAccountText() {
    return RichText(
      text: TextSpan(
        text: TextConstants.alreadyHaveAccount,
        style: TextStyle(
          color: ColorConstants.textBlack,
          fontSize: 18,
        ),
        children: [
          TextSpan(
            text: " ${TextConstants.signIn}",
            style: TextStyle(
              color: ColorConstants.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print("Sign In");
              },
          ),
        ],
      ),
    );
  }
}
