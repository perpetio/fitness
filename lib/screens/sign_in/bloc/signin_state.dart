part of 'signin_bloc.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInButtonEnableChangedState extends SignInState {
  final bool isEnabled;

  SignInButtonEnableChangedState({
    required this.isEnabled,
  });
}
