// import 'dart:convert';

// class ExerciseData {
//   final String id;
//   final String title;
//   final int minutes;
//   double progress;
//   final String video;
//   final String description;
//   final List<String> steps;

//   ExerciseData({
//     required this.id,
//     required this.title,
//     required this.minutes,
//     required this.progress,
//     required this.video,
//     required this.description,
//     required this.steps,
//   });

//   factory ExerciseData.fromJson(Map<String, dynamic>? jsonMap) {
//     final stepsStr = (jsonMap?["steps"] as String?) ?? "";
//     final encodedSteps = (json.decode(stepsStr) as List?) ?? [];
//     return jsonMap != null
//         ? ExerciseData(
//             id: (jsonMap["id"] as String?) ?? "",
//             title: (jsonMap["title"] as String?) ?? "",
//             minutes: (jsonMap["minutes"] as int?) ?? 0,
//             progress: (jsonMap["progress"] as double?) ?? 0,
//             video: (jsonMap["video"] as String?) ?? "",
//             description: (jsonMap["description"] as String?) ?? "",
//             steps: encodedSteps.map((e) => e as String).toList(),
//           )
//         : ExerciseData.empty();
//   }

//   factory ExerciseData.empty() {
//     return ExerciseData(
//       id: '',
//       title: '',
//       minutes: 0,
//       progress: 0,
//       video: '',
//       description: '',
//       steps: [],
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
//       'minutes': minutes,
//       'progress': progress,
//       'video': video,
//       'description': description,
//       'steps': jsonEncode(steps)
//     };
//   }

//   @override
//   String toString() {
//     return 'ExerciseData(title: $title, minutes: $minutes, progress: $progress, video: $video)';
//   }
// }

import 'dart:convert';

class ExerciseData {
  String? id;
  String? title;
  int? minutes;
  double? progress;
  String? video;
  String? description;
  List<String>? steps;

  ExerciseData({
    required this.id,
    required this.title,
    required this.minutes,
    required this.progress,
    required this.video,
    required this.description,
    required this.steps,
  });

  ExerciseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    minutes = json['minutes'];
    progress = json['progress'];
    video = json['video'];
    description = json['description'];
    steps = json['steps'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['minutes'] = this.minutes;
    data['progress'] = this.progress;
    data['video'] = this.video;
    data['description'] = this.description;
    data['steps'] = this.steps;
    return data;
  }

  String toJsonString() {
    final str = json.encode(this.toJson());
    return str;
  }
}
