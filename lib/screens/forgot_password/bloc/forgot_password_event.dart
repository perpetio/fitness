part of 'forgot_password_bloc.dart';

@immutable
abstract class ForgotPasswordEvent {}

class ForgotPasswordTappedEvent extends ForgotPasswordEvent {}
