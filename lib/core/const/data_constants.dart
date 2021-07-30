import 'package:fitness_flutter/core/const/path_constants.dart';
import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/data/exercise_data.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:fitness_flutter/screens/onboarding/widget/onboarding_tile.dart';

class DataConstants {
  // Onboarding
  static final onboardingTiles = [
    OnboardingTile(
      title: TextConstants.onboarding1Title,
      mainText: TextConstants.onboarding1Description,
      imagePath: PathConstants.onboarding1,
    ),
    OnboardingTile(
      title: TextConstants.onboarding2Title,
      mainText: TextConstants.onboarding2Description,
      imagePath: PathConstants.onboarding2,
    ),
    OnboardingTile(
      title: TextConstants.onboarding3Title,
      mainText: TextConstants.onboarding3Description,
      imagePath: PathConstants.onboarding3,
    ),
  ];

  static final List<WorkoutData> workouts = [
    WorkoutData(
        title: TextConstants.yogaTitle,
        exercices: TextConstants.yogaExercises,
        minutes: TextConstants.yogaMinutes,
        currentProgress: 10,
        progress: 16,
        image: PathConstants.yoga,
        exerciseDataList: [
          ExerciseData(
            title: TextConstants.reclining,
            minutes: TextConstants.recliningMinutes,
            progress: 0.99,
          ),
          ExerciseData(
            title: TextConstants.cowPose,
            minutes: TextConstants.cowPoseMinutes,
            progress: 0.3,
          ),
          ExerciseData(
            title: TextConstants.warriorPose,
            minutes: TextConstants.warriorPoseMinutes,
            progress: 0.99,
          ),
        ]),
    WorkoutData(
        title: TextConstants.pilatesTitle,
        exercices: TextConstants.pilatesExercises,
        minutes: TextConstants.pilatesMinutes,
        currentProgress: 1,
        progress: 20,
        image: PathConstants.pilates,
        exerciseDataList: [
          ExerciseData(
            title: TextConstants.reclining,
            minutes: TextConstants.recliningMinutes,
            progress: 0.1,
          ),
          ExerciseData(
            title: TextConstants.cowPose,
            minutes: TextConstants.cowPoseMinutes,
            progress: 0.1,
          ),
          ExerciseData(
            title: TextConstants.warriorPose,
            minutes: TextConstants.warriorPoseMinutes,
            progress: 0.0,
          ),
        ]),
    WorkoutData(
        title: TextConstants.fullBodyTitle,
        exercices: TextConstants.fullBodyExercises,
        minutes: TextConstants.fullBodyMinutes,
        currentProgress: 12,
        progress: 14,
        image: PathConstants.fullBody,
        exerciseDataList: [
          ExerciseData(
            title: TextConstants.reclining,
            minutes: TextConstants.recliningMinutes,
            progress: 0.99,
          ),
          ExerciseData(
            title: TextConstants.cowPose,
            minutes: TextConstants.cowPoseMinutes,
            progress: 0.6,
          ),
          ExerciseData(
            title: TextConstants.warriorPose,
            minutes: TextConstants.warriorPoseMinutes,
            progress: 0.8,
          ),
        ]),
    WorkoutData(
        title: TextConstants.stretchingTitle,
        exercices: TextConstants.stretchingExercises,
        minutes: TextConstants.stretchingMinutes,
        currentProgress: 0,
        progress: 8,
        image: PathConstants.stretching,
        exerciseDataList: [
          ExerciseData(
              title: TextConstants.reclining,
              minutes: TextConstants.recliningMinutes,
              progress: 0.0),
          ExerciseData(
              title: TextConstants.cowPose,
              minutes: TextConstants.cowPoseMinutes,
              progress: 0.0),
          ExerciseData(
            title: TextConstants.warriorPose,
            minutes: TextConstants.warriorPoseMinutes,
            progress: 0.0,
          ),
        ]),
  ];
}
