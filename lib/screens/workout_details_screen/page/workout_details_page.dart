import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:fitness_flutter/screens/common_widgets/fitness_button.dart';
import 'package:fitness_flutter/screens/start_workout/page/start_workout_page.dart';
import 'package:fitness_flutter/screens/workout_details_screen/bloc/workout_details_bloc.dart';
import 'package:fitness_flutter/screens/workout_details_screen/widget/workout_details_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutDetailsPage extends StatelessWidget {
  final WorkoutData workout;

  WorkoutDetailsPage({
    required this.workout,
  });

  @override
  Widget build(BuildContext context) {
    return _buildContext(context);
  }

  BlocProvider<WorkoutDetailsBloc> _buildContext(BuildContext context) {
    final workoutDetailsBloc = WorkoutDetailsBloc();
    return BlocProvider<WorkoutDetailsBloc>(
      create: (context) => workoutDetailsBloc,
      child: BlocConsumer<WorkoutDetailsBloc, WorkoutDetailsState>(
        buildWhen: (_, currState) => currState is WorkoutDetailsInitial,
        builder: (context, state) {
          final bloc = BlocProvider.of<WorkoutDetailsBloc>(context);
          bloc.add(WorkoutDetailsInitialEvent(workout: workout));
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FitnessButton(
                title: workout.currentProgress == 0
                    ? TextConstants.start
                    : TextConstants.continueT,
                onTap: () {
                  final index = workout.currentProgress ==
                          workout.exerciseDataList!.length
                      ? 0
                      : workout.currentProgress;
                  bloc.add(StartTappedEvent(index: index));
                },
              ),
            ),
            body: WorkoutDetailsContent(workout: workout),
          );
        },
        listenWhen: (_, currState) =>
            currState is BackTappedState ||
            currState is WorkoutExerciseCellTappedState ||
            currState is StartTappedState,
        listener: (context, state) async {
          if (state is BackTappedState) {
            Navigator.pop(context);
          } else if (state is StartTappedState) {
            final workout = state.isReplace
                ? await Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<WorkoutDetailsBloc>(context),
                        child: StartWorkoutPage(
                          workout: state.workout,
                          index: state.index,
                        ),
                      ),
                    ),
                  )
                : await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<WorkoutDetailsBloc>(context),
                        child: StartWorkoutPage(
                          workout: state.workout,
                          index: state.index,
                        ),
                      ),
                    ),
                  );
            if (workout is WorkoutData) {
              BlocProvider.of<WorkoutDetailsBloc>(context).add(
                WorkoutDetailsInitialEvent(workout: workout),
              );
            }
          }
        },
      ),
    );
  }
}
