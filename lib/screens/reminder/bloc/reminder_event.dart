part of 'reminder_bloc.dart';

@immutable
abstract class ReminderEvent {}

class RepeatDaySelectedEvent extends ReminderEvent {
  final int index;
  final int dayTime;

  RepeatDaySelectedEvent({required this.index, required this.dayTime});
}

class ReminderNotificationTimeEvent extends ReminderEvent {
  final DateTime dateTime;

  ReminderNotificationTimeEvent({required this.dateTime});
}

class OnSaveTappedEvent extends ReminderEvent {}
