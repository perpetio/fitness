part of 'workouts_bloc.dart';

@immutable
abstract class WorkoutsState {}

class WorkoutsInitial extends WorkoutsState {}

class CardTappedState extends WorkoutsState {
  final WorkoutData workout;

  CardTappedState({required this.workout});
}

class ReloadWorkoutsState extends WorkoutsState {
  final List<WorkoutData> workouts;

  ReloadWorkoutsState({
    required this.workouts,
  });
}
