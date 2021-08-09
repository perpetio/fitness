part of 'reminder_bloc.dart';

@immutable
abstract class ReminderState {}

class ReminderInitial extends ReminderState {}

class RepeatDaySelectedState extends ReminderState {
  final int? index;

  RepeatDaySelectedState({
    required this.index,
  });
}

class ReminderNotificationState extends ReminderState {}

class OnSaveTappedState extends ReminderState {}
