part of 'start_workout_bloc.dart';

@immutable
abstract class StartWorkoutEvent {}

class BackTappedEvent extends StartWorkoutEvent {}

class PlayTappedEvent extends StartWorkoutEvent {
  final int time;

  PlayTappedEvent({
    required this.time,
  });
}

class PauseTappedEvent extends StartWorkoutEvent {
  final int time;

  PauseTappedEvent({
    required this.time,
  });
}

class ChangeTimerEvent extends StartWorkoutEvent {}
