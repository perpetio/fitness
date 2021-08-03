part of 'edit_account_bloc.dart';

@immutable
abstract class EditAccountState {}

class EditAccountInitial extends EditAccountState {}

class EditAccountProgress extends EditAccountState {}

class EditAccountError extends EditAccountState {
  final String error;
  EditAccountError(this.error);
}
