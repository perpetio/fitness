import 'package:fitness_flutter/screens/home/bloc/home_bloc.dart';
import 'package:fitness_flutter/screens/home/widget/home_content.dart';
import 'package:fitness_flutter/screens/sign_in/page/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContext(context),
    );
  }

  BlocProvider<HomeBloc> _buildContext(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (BuildContext context) => HomeBloc(),
      child: BlocConsumer<HomeBloc, HomeState>(
        buildWhen: (_, currState) => currState is HomeInitial,
        builder: (context, state) {
          return HomeContent();
        },
        listenWhen: (_, currState) => currState is SignOutButtonTappedState,
        listener: (context, state) {
          if (state is SignOutButtonTappedState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => SignInPage()),
            );
          }
        },
      ),
    );
  }
}
