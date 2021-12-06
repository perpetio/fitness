part of 'workouts_bloc.dart';

@immutable
abstract class WorkoutsEvent {}

class CardTappedEvent extends WorkoutsEvent {
  final WorkoutData workout;

  CardTappedEvent({required this.workout});
}

class WorkoutsInitialEvent extends WorkoutsEvent {}
