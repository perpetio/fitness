import 'package:fitness_flutter/data/workout_data.dart';
import 'package:fitness_flutter/screens/start_workout/bloc/start_workout_bloc.dart';
import 'package:fitness_flutter/screens/start_workout/widget/start_workout_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartWorkoutPage extends StatelessWidget {
  final WorkoutData workout;
  final int index;

  StartWorkoutPage({
    required this.workout,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContext(context),
    );
  }

  BlocProvider<StartWorkoutBloc> _buildContext(BuildContext context) {
    return BlocProvider<StartWorkoutBloc>(
      create: (context) => StartWorkoutBloc(),
      child: BlocConsumer<StartWorkoutBloc, StartWorkoutState>(
        buildWhen: (_, currState) => currState is StartWorkoutInitial,
        builder: (context, state) {
          final currentExercise = workout.exerciseDataList![index];
          final nextExercise = index + 1 < workout.exerciseDataList!.length
              ? workout.exerciseDataList![index + 1]
              : null;
          return StartWorkoutContent(
            workout: workout,
            exercise: currentExercise,
            nextExercise: nextExercise,
          );
        },
        listenWhen: (_, currState) => currState is BackTappedState,
        listener: (context, state) {
          if (state is BackTappedState) {
            Navigator.pop(context, workout);
          }
        },
      ),
    );
  }
}
