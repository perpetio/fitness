part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class OnTextChangedEvent extends SignupEvent {}

class SignUpTappedEvent extends SignupEvent {}

class SignInTappedEvent extends SignupEvent {}
