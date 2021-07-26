part of 'sign_in_bloc.dart';

abstract class SignInState {
  const SignInState();
}

class SignInInitial extends SignInState {}

class SignInButtonEnableChangedState extends SignInState {
  final bool isEnabled;

  SignInButtonEnableChangedState({
    required this.isEnabled,
  });
}

class ShowErrorState extends SignInState {}

class NextForgotPasswordPageState extends SignInState {}

class NextSignUpPageState extends SignInState {}

class NextTabBarPageState extends SignInState {}

class ErrorState extends SignInState {
  final String message;

  ErrorState({
    required this.message,
  });
}

class LoadingState extends SignInState {}
