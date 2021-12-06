import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fitness_flutter/core/const/data_constants.dart';
import 'package:fitness_flutter/core/service/auth_service.dart';
import 'package:fitness_flutter/core/service/data_service.dart';
import 'package:fitness_flutter/core/service/user_storage_service.dart';
import 'package:fitness_flutter/data/exercise_data.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  List<WorkoutData> workouts = <WorkoutData>[];
  List<ExerciseData> exercises = <ExerciseData>[];
  int timeSent = 0;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeInitialEvent) {
      workouts = await DataService.getWorkoutsForUser();
      yield WorkoutsGotState(workouts: workouts);
    } else if (event is ReloadImageEvent) {
      String? photoURL = await UserStorageService.readSecureData('image');
      if (photoURL == null) {
        photoURL = AuthService.auth.currentUser?.photoURL;
        photoURL != null
            ? await UserStorageService.writeSecureData('image', photoURL)
            : print('no image');
      }
      yield ReloadImageState(photoURL: photoURL);
    } else if (event is ReloadDisplayNameEvent) {
      final displayName = await UserStorageService.readSecureData('name');
      yield ReloadDisplayNameState(displayName: displayName);
    }
  }

  int getProgressPercentage() {
    final completed = workouts
        .where((w) =>
            (w.currentProgress ?? 0) > 0 && w.currentProgress == w.progress)
        .toList();
    final percent01 =
        completed.length.toDouble() / DataConstants.workouts.length.toDouble();
    final percent = (percent01 * 100).toInt();
    return percent;
  }

  int? getFinishedWorkouts() {
    final completedWorkouts =
        workouts.where((w) => w.currentProgress == w.progress).toList();
    return completedWorkouts.length;
  }

  int? getInProgressWorkouts() {
    final completedWorkouts = workouts.where(
        (w) => (w.currentProgress ?? 0) > 0 && w.currentProgress != w.progress);
    return completedWorkouts.length;
  }

  int? getTimeSent() {
    for (final WorkoutData workout in workouts) {
      exercises.addAll(workout.exerciseDataList!);
    }
    final exercise = exercises.where((e) => e.progress == 1).toList();
    exercise.forEach((e) {
      timeSent += e.minutes!;
    });
    return timeSent;
  }
}
