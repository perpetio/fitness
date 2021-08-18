part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {}

class SettingsReloadImageEvent extends SettingsEvent {}

class SettingsReloadDisplayNameEvent extends SettingsEvent {}
