// import 'dart:convert';

// import 'package:fitness_flutter/data/exercise_data.dart';

// class WorkoutData {
//   final String id;
//   final String title;
//   final String exercises;
//   final String minutes;
//   int currentProgress;
//   final int progress;
//   final String image;
//   final List<ExerciseData> exerciseDataList;

//   WorkoutData({
//     required this.id,
//     required this.title,
//     required this.exercises,
//     required this.minutes,
//     required this.currentProgress,
//     required this.progress,
//     required this.image,
//     required this.exerciseDataList,
//   });

//   factory WorkoutData.fromJson(Map<String, dynamic>? json) {
//     return json != null
//         ? WorkoutData(
//             id: (json["id"] as String?) ?? '',
//             title: (json["title"] as String?) ?? '',
//             exercises: (json["exercises"] as String?) ?? '',
//             minutes: (json["minutes"] as String?) ?? '',
//             currentProgress: (json["currentProgress"] as int?) ?? 0,
//             progress: (json["progress"] as int?) ?? 0,
//             image: (json["image"] as String?) ?? '',
//             exerciseDataList: ((json["exerciseDataList"] as List?) ?? [])
//                 .map((e) => ExerciseData.fromJson(e as Map<String, dynamic>))
//                 .toList(),
//           )
//         : WorkoutData.empty();
//   }

//   factory WorkoutData.empty() {
//     return WorkoutData(
//       id: '',
//       title: '',
//       exercises: '',
//       minutes: '',
//       currentProgress: 0,
//       progress: 0,
//       image: '',
//       exerciseDataList: [],
//     );
//   }

//   String toJsonString() {
//     final str = json.encode(this.toJson());
//     return str;
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'exercices': exercises,
//       'minutes': minutes,
//       'currentProgress': currentProgress,
//       'progress': progress,
//       'image': image,
//       'exerciseDataList': exerciseDataList.map((e) => e.toJson()).toList(),
//     };
//   }

//   @override
//   String toString() {
//     return 'WorkoutData(title: $title, exercices: $exercises, minutes: $minutes, currentProgress: $currentProgress, progress: $progress, image: $image, exerciseDataList: $exerciseDataList)';
//   }
// }

import 'dart:convert';

import 'package:fitness_flutter/data/exercise_data.dart';

class WorkoutData {
  String? id;
  String? title;
  String? exercises;
  String? minutes;
  int? currentProgress;
  int? progress;
  String? image;
  List<ExerciseData>? exerciseDataList;

  WorkoutData({
    required this.id,
    required this.title,
    required this.exercises,
    required this.minutes,
    required this.currentProgress,
    required this.progress,
    required this.image,
    required this.exerciseDataList,
  });

  WorkoutData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    exercises = json['exercises'];
    minutes = json['minutes'];
    currentProgress = json['currentProgress'];
    progress = json['progress'];
    image = json['image'];
    if (json['exerciseDataList'] != null) {
      List<ExerciseData> exercises = [];
      json['exerciseDataList'].forEach((v) {
        exercises.add(ExerciseData.fromJson(v));
      });
      exerciseDataList = exercises;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['exercises'] = this.exercises;
    data['minutes'] = this.minutes;
    data['currentProgress'] = this.currentProgress;
    data['progress'] = this.progress;
    data['image'] = this.image;
    if (this.exerciseDataList != null) {
      data['exerciseDataList'] =
          this.exerciseDataList!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  String toJsonString() {
    final str = json.encode(this.toJson());
    return str;
  }
}
