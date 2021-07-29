import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'workouts_event.dart';
part 'workouts_state.dart';

class WorkoutsBloc extends Bloc<WorkoutsEvent, WorkoutsState> {
  WorkoutsBloc() : super(WorkoutsInitial());

  @override
  Stream<WorkoutsState> mapEventToState(
    WorkoutsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
