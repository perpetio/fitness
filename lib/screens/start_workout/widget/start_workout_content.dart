import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/const/path_constants.dart';
import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/core/service/data_service.dart';
import 'package:fitness_flutter/data/exercise_data.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:fitness_flutter/screens/common_widgets/fitness_button.dart';
import 'package:fitness_flutter/screens/start_workout/bloc/start_workout_bloc.dart';
import 'package:fitness_flutter/screens/start_workout/widget/start_workout_video.dart';
import 'package:fitness_flutter/screens/workout_details_screen/bloc/workout_details_bloc.dart'
    as workout_bloc;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartWorkoutContent extends StatelessWidget {
  final WorkoutData workout;
  final ExerciseData exercise;
  final ExerciseData? nextExercise;

  StartWorkoutContent({
    required this.workout,
    required this.exercise,
    required this.nextExercise,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: ColorConstants.white,
      child: SafeArea(
        child: _createDetailedExercise(context),
      ),
    );
  }

  Widget _createDetailedExercise(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createBackButton(context),
          const SizedBox(height: 23),
          _createVideo(context),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(children: [
              _createTitle(),
              const SizedBox(height: 9),
              _createDescription(),
              const SizedBox(height: 30),
              _createSteps(),
            ]),
          ),
          _createTimeTracker(context),
        ],
      ),
    );
  }

  Widget _createBackButton(BuildContext context) {
    final bloc = BlocProvider.of<StartWorkoutBloc>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 8),
      child: GestureDetector(
        child: BlocBuilder<StartWorkoutBloc, StartWorkoutState>(
          builder: (context, state) {
            return Row(
              children: [
                Image(image: AssetImage(PathConstants.back)),
                const SizedBox(width: 17),
                Text(
                  TextConstants.back,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            );
          },
        ),
        onTap: () {
          bloc.add(BackTappedEvent());
        },
      ),
    );
  }

  Widget _createVideo(BuildContext context) {
    final bloc = BlocProvider.of<StartWorkoutBloc>(context);
    return Container(
      height: 264,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: ColorConstants.white),
      child: StartWorkoutVideo(
        exercise: exercise,
        onPlayTapped: (time) async {
          bloc.add(PlayTappedEvent(time: time));
        },
        onPauseTapped: (time) {
          bloc.add(PauseTappedEvent(time: time));
        },
      ),
    );
  }

  Widget _createTitle() {
    return Text(exercise.title ?? "",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold));
  }

  Widget _createDescription() {
    return Text(exercise.description ?? "",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500));
  }

  Widget _createSteps() {
    return Column(
      children: [
        for (int i = 0; i < exercise.steps!.length; i++) ...[
          Step(number: "${i + 1}", description: exercise.steps![i]),
          const SizedBox(height: 20),
        ],
      ],
    );
  }

  Widget _createTimeTracker(BuildContext context) {
    return Container(
      width: double.infinity,
      color: ColorConstants.white,
      child: Column(
        children: [
          nextExercise != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      TextConstants.nextExercise,
                      style: TextStyle(
                        color: ColorConstants.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      nextExercise?.title ?? "",
                      style: TextStyle(
                        color: ColorConstants.textBlack,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 6.5),
                    Icon(Icons.access_time, size: 20),
                    const SizedBox(width: 6.5),
                    Text(
                        '${nextExercise!.minutes! >= 10 ? nextExercise!.minutes : '0${nextExercise!.minutes}'}:00')
                    // BlocBuilder<StartWorkoutBloc, StartWorkoutState>(
                    //   buildWhen: (_, currState) => currState is PlayTimerState || currState is PauseTimerState,
                    //   builder: (context, state) {
                    //     return StartWorkoutTimer(
                    //       time: bloc.time,
                    //       isPaused: !(state is PlayTimerState),
                    //     );
                    //   },
                    // ),
                  ],
                )
              : SizedBox.shrink(),
          const SizedBox(height: 18),
          _createButton(context),
        ],
      ),
    );
  }

  Widget _createButton(BuildContext context) {
    final bloc = BlocProvider.of<workout_bloc.WorkoutDetailsBloc>(context);
    return FitnessButton(
      title: nextExercise != null ? TextConstants.next : TextConstants.finish,
      onTap: () async {
        if (nextExercise != null) {
          List<ExerciseData>? exercisesList = bloc.workout.exerciseDataList;
          int currentExerciseIndex = exercisesList!.indexOf(exercise);

          await _saveWorkout(currentExerciseIndex);

          if (currentExerciseIndex < exercisesList.length - 1) {
            bloc.add(workout_bloc.StartTappedEvent(
              workout: workout,
              index: currentExerciseIndex + 1,
              isReplace: true,
            ));
          }
        } else {
          await _saveWorkout(workout.exerciseDataList!.length - 1);

          Navigator.pop(context, workout);
        }
      },
    );
  }

  Future<void> _saveWorkout(int exerciseIndex) async {
    if (workout.currentProgress! < exerciseIndex + 1) {
      workout.currentProgress = exerciseIndex + 1;
    }
    workout.exerciseDataList![exerciseIndex].progress = 1;

    await DataService.saveWorkout(workout);
  }
}

class Step extends StatelessWidget {
  final String number;
  final String description;

  Step({required this.number, required this.description});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorConstants.primaryColor.withOpacity(0.12),
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: ColorConstants.primaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(child: Text(description)),
      ],
    );
  }
}
