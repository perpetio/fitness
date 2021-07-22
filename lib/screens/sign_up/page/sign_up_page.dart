import 'package:fitness_flutter/screens/home/page/home_page.dart';
import 'package:fitness_flutter/screens/sign_in/page/sign_in_page.dart';
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

  BlocProvider<SignUpBloc> _buildBody(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (BuildContext context) => signUpBloc,
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listenWhen: (_, currState) =>
            currState is NextHomePageState ||
            currState is NextSignInPageState ||
            currState is ErrorState,
        listener: (context, state) {
          if (state is NextHomePageState) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => HomePage()));
          } else if (state is NextSignInPageState) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => SignInPage()));
          } else if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        buildWhen: (_, currState) => currState is SignupInitial,
        builder: (context, state) {
          return SignUpContent();
        },
      ),
    );
  }
}
