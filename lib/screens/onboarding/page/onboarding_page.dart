import 'package:fitness_flutter/screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:fitness_flutter/screens/onboarding/widget/onboarding_content.dart';
import 'package:fitness_flutter/core/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: _buildBody(context),
    );
  }

  BlocProvider<OnboardingBloc> _buildBody(BuildContext context) {
    return BlocProvider<OnboardingBloc>(
      create: (BuildContext context) => OnboardingBloc(),
      child: BlocBuilder<OnboardingBloc, OnboardingState>(
        buildWhen: (_, OnboardingState currState) =>
            currState is OnboardingInitial,
        builder: (context, state) {
          return OnboardingContent();
        },
      ),
    );
  }
}
