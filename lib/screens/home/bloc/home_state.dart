part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ReloadImageState extends HomeState {
  final String? photoURL;

  ReloadImageState({
    required this.photoURL,
  });
}

class ReloadDisplayNameState extends HomeState {
  final String? displayName;

  ReloadDisplayNameState({
    required this.displayName,
  });
}

class WorkoutsGotState extends HomeState {
  final List<WorkoutData> workouts;

  WorkoutsGotState({
    required this.workouts,
  });
}
