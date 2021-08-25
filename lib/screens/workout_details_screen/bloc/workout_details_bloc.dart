import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:meta/meta.dart';

part 'workout_details_event.dart';
part 'workout_details_state.dart';

class WorkoutDetailsBloc
    extends Bloc<WorkoutDetailsEvent, WorkoutDetailsState> {
  WorkoutDetailsBloc() : super(WorkoutDetailsInitial());

  late WorkoutData workout;
  // int time = 0;

  @override
  Stream<WorkoutDetailsState> mapEventToState(
    WorkoutDetailsEvent event,
  ) async* {
    if (event is WorkoutDetailsInitialEvent) {
      workout = event.workout;
      yield ReloadWorkoutDetailsState(workout: workout);
    } else if (event is BackTappedEvent) {
      yield BackTappedState();
    } else if (event is StartTappedEvent) {
      yield StartTappedState(
        workout: event.workout ?? workout,
        index: event.index ?? 0,
        isReplace: event.isReplace,
      );
    }
  }

  // int getExerciseTime() {
  //   final List<int?> exerciseList =
  //       workout.exerciseDataList!.map((e) => e.minutes).toList();
  //   exerciseList.forEach((e) {
  //     time += e!;
  //   });
  //   return time;
  // }
}
