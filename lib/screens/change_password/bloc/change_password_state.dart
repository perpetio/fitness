part of 'change_password_bloc.dart';

@immutable
abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordProgress extends ChangePasswordState {}

class ChangePasswordError extends ChangePasswordState {
  final String error;
  ChangePasswordError(this.error);
}

class ChangePasswordSuccess extends ChangePasswordState {
  final String message;
  ChangePasswordSuccess({required this.message});
}
