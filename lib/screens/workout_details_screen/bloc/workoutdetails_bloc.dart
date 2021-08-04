import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fitness_flutter/data/exercise_data.dart';
import 'package:meta/meta.dart';

part 'workoutdetails_event.dart';
part 'workoutdetails_state.dart';

class WorkoutDetailsBloc
    extends Bloc<WorkoutDetailsEvent, WorkoutDetailsState> {
  WorkoutDetailsBloc() : super(WorkoutDetailsInitial());

  @override
  Stream<WorkoutDetailsState> mapEventToState(
    WorkoutDetailsEvent event,
  ) async* {
    if (event is BackTappedEvent) {
      yield BackTappedState();
    } else if (event is WorkoutExerciseCellTappedEvent) {
      yield WorkoutExerciseCellTappedState(
        currentExercise: event.currentExercise,
        nextExercise: event.nextExercise,
      );
    }
  }
}
