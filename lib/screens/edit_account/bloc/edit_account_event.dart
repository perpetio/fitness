part of 'edit_account_bloc.dart';

@immutable
abstract class EditAccountEvent {}

class UploadImage extends EditAccountEvent {}

class ChangeUserData extends EditAccountEvent {
  final String displayName;
  final String email;
  ChangeUserData({required this.displayName, required this.email});
}
