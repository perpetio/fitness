import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'workoutdetails_event.dart';
part 'workoutdetails_state.dart';

class WorkoutdetailsBloc
    extends Bloc<WorkoutdetailsEvent, WorkoutdetailsState> {
  WorkoutdetailsBloc() : super(WorkoutdetailsInitial());

  @override
  Stream<WorkoutdetailsState> mapEventToState(
    WorkoutdetailsEvent event,
  ) async* {}
}
