part of 'settings_bloc.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SettingsReloadImageState extends SettingsState {
  final String? photoURL;

  SettingsReloadImageState({required this.photoURL});
}

class SettingsReloadDisplayNameState extends SettingsState {
  final String? displayName;

  SettingsReloadDisplayNameState({required this.displayName});
}
