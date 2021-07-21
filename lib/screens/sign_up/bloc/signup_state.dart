part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignUpButtonEnableChangedState extends SignupState {
  final bool isEnabled;

  SignUpButtonEnableChangedState({
    required this.isEnabled,
  });
}
