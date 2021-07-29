import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/const/path_constants.dart';
import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:fitness_flutter/screens/workouts/widget/workout_card.dart';
import 'package:flutter/material.dart';

class WorkoutContent extends StatelessWidget {
  WorkoutContent({Key? key}) : super(key: key);
  final List<WorkoutData> workouts = [
    WorkoutData(
        title: TextConstants.yogaTitle,
        exercices: TextConstants.yogaExercises,
        minutes: TextConstants.yogaMinutes,
        currentProgress: 10,
        progress: 16,
        image: PathConstants.yoga),
    WorkoutData(
        title: TextConstants.pilatesTitle,
        exercices: TextConstants.pilatesExercises,
        minutes: TextConstants.pilatesMinutes,
        currentProgress: 1,
        progress: 20,
        image: PathConstants.pilates),
    WorkoutData(
        title: TextConstants.fullBodyTitle,
        exercices: TextConstants.fullBodyExercises,
        minutes: TextConstants.fullBodyMinutes,
        currentProgress: 12,
        progress: 14,
        image: PathConstants.fullBody),
    WorkoutData(
        title: TextConstants.stretchingTitle,
        exercices: TextConstants.stretchingExercises,
        minutes: TextConstants.stretchingMinutes,
        currentProgress: 0,
        progress: 8,
        image: PathConstants.stretching),
  ];

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
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('Workouts', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView(
              children: workouts
                  .map((e) => Column(
                        children: [WorkoutCard(workout: e), SizedBox(height: 20)],
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
