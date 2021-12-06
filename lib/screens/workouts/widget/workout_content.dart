import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:fitness_flutter/screens/workouts/bloc/workouts_bloc.dart';
import 'package:fitness_flutter/screens/workouts/widget/workout_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutContent extends StatelessWidget {
  WorkoutContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.homeBackgroundColor,
      height: double.infinity,
      width: double.infinity,
      child: _createHomeBody(context),
    );
  }

  Widget _createHomeBody(BuildContext context) {
    final bloc = BlocProvider.of<WorkoutsBloc>(context);
    return BlocBuilder<WorkoutsBloc, WorkoutsState>(
      buildWhen: (_, currState) => currState is ReloadWorkoutsState,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  TextConstants.workouts,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: ListView(
                  children:
                      bloc.workouts.map((e) => _createWorkoutCard(e)).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _createWorkoutCard(WorkoutData workoutData) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: WorkoutCard(workout: workoutData),
    );
  }
}
