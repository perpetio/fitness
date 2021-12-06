part of 'workout_details_bloc.dart';

@immutable
abstract class WorkoutDetailsEvent {}

class BackTappedEvent extends WorkoutDetailsEvent {}

class WorkoutDetailsInitialEvent extends WorkoutDetailsEvent {
  final WorkoutData workout;

  WorkoutDetailsInitialEvent({
    required this.workout,
  });
}

class StartTappedEvent extends WorkoutDetailsEvent {
  final WorkoutData? workout;
  final int? index;
  final bool isReplace;

  StartTappedEvent({
    this.workout,
    this.index,
    this.isReplace = false,
  });
}
