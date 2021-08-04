import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:fitness_flutter/screens/common_widgets/fitness_button.dart';
import 'package:fitness_flutter/screens/start_workout/page/start_workout_page.dart';
import 'package:fitness_flutter/screens/workout_details_screen/bloc/workoutdetails_bloc.dart';
import 'package:fitness_flutter/screens/workout_details_screen/widget/workout_details_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutDetailsPage extends StatelessWidget {
  final WorkoutData workout;
  WorkoutDetailsPage({required this.workout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: FitnessButton(
          title: TextConstants.start,
          onTap: () {},
        ),
      ),
      body: _buildContext(context),
    );
  }

  BlocProvider<WorkoutDetailsBloc> _buildContext(BuildContext context) {
    return BlocProvider<WorkoutDetailsBloc>(
      create: (context) => WorkoutDetailsBloc(),
      child: BlocConsumer<WorkoutDetailsBloc, WorkoutDetailsState>(
        buildWhen: (_, currState) => currState is WorkoutDetailsInitial,
        builder: (context, state) {
          return WorkoutDetailsContent(workout: workout);
        },
        listenWhen: (_, currState) =>
            currState is BackTappedState ||
            currState is WorkoutExerciseCellTappedState,
        listener: (context, state) {
          if (state is BackTappedState) {
            Navigator.pop(context);
          } else if (state is WorkoutExerciseCellTappedState) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => StartWorkoutPage(
                  exercise: state.currentExercise,
                  currentExercise: state.currentExercise,
                  nextExercise: state.nextExercise,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
