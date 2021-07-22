part of 'signup_bloc.dart';

@immutable
abstract class SignUpState {}

class SignupInitial extends SignUpState {}

class SignUpButtonEnableChangedState extends SignUpState {
  final bool isEnabled;

  SignUpButtonEnableChangedState({
    required this.isEnabled,
  });
}

class ShowErrorState extends SignUpState {}
