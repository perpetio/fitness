import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'start_workout_event.dart';
part 'start_workout_state.dart';

class StartWorkoutBloc extends Bloc<StartWorkoutEvent, StartWorkoutState> {
  StartWorkoutBloc() : super(StartWorkoutInitial());

  int time = 0;

  @override
  Stream<StartWorkoutState> mapEventToState(
    StartWorkoutEvent event,
  ) async* {
    if (event is BackTappedEvent) {
      yield BackTappedState();
    } else if (event is PlayTappedEvent) {
      time = event.time;
      yield PlayTimerState(time: event.time);
    } else if (event is PauseTappedEvent) {
      time = event.time;
      yield PauseTimerState(currentTime: time);
    }
  }
}
