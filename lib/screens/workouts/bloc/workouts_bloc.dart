import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fitness_flutter/core/const/data_constants.dart';
import 'package:fitness_flutter/core/const/global_constants.dart';
import 'package:fitness_flutter/core/service/data_service.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:meta/meta.dart';

part 'workouts_event.dart';
part 'workouts_state.dart';

class WorkoutsBloc extends Bloc<WorkoutsEvent, WorkoutsState> {
  WorkoutsBloc() : super(WorkoutsInitial());

  List<WorkoutData> workouts = DataConstants.workouts;

  @override
  Stream<WorkoutsState> mapEventToState(
    WorkoutsEvent event,
  ) async* {
    if (event is WorkoutsInitialEvent) {
      GlobalConstants.workouts = await DataService.getWorkoutsForUser();
      for (int i = 0; i < workouts.length; i++) {
        final workoutsUserIndex =
            GlobalConstants.workouts.indexWhere((w) => w.id == workouts[i].id);
        if (workoutsUserIndex != -1) {
          workouts[i] = GlobalConstants.workouts[workoutsUserIndex];
        }
      }
      yield ReloadWorkoutsState(workouts: workouts);
    } else if (event is CardTappedEvent) {
      yield CardTappedState(workout: event.workout);
    }
  }
}
