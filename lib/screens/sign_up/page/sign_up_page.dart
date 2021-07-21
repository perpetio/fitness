import 'package:fitness_flutter/screens/sign_up/bloc/signup_bloc.dart';
import 'package:fitness_flutter/screens/sign_up/widget/sign_up_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  BlocProvider<SignupBloc> _buildBody(BuildContext context) {
    return BlocProvider<SignupBloc>(
      create: (BuildContext context) => signUpBloc,
      child: BlocConsumer<SignupBloc, SignupState>(
        listenWhen: (previous, current) {
          return true;
        },
        listener: (context, state) {},
        buildWhen: (_, currState) => currState is SignupInitial,
        builder: (context, state) {
          return SignUpContent();
        },
      ),
    );
  }
}
