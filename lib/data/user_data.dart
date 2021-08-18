// import 'dart:convert';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fitness_flutter/data/workout_data.dart';

// class UserData {
//   final String name;
//   final String photo;
//   final String mail;
//   List<WorkoutData> workouts;

//   UserData({
//     required this.name,
//     required this.photo,
//     required this.mail,
//     required this.workouts,
//   });

//   factory UserData.fromFirebase(User? user) {
//     return user != null
//         ? UserData(
//             name: user.displayName ?? "",
//             photo: user.photoURL ?? "",
//             mail: user.email ?? "",
//             workouts: [],
//           )
//         : UserData.empty();
//   }

//   factory UserData.fromStringJson(String stringJson) {
//     final mapJson = json.decode(stringJson);
//     return UserData(
//       name: mapJson["name"],
//       photo: mapJson["photo"],
//       mail: mapJson["mail"],
//       workouts: [],
//     );
//   }

//   factory UserData.empty() {
//     return UserData(name: '', photo: '', mail: '', workouts: []);
//   }

//   String toJsonString() {
//     final str = json.encode(this.toJson());
//     return str;
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "name": name,
//       "photo": photo,
//       "mail": mail,
//       "workouts": workouts.map((e) => e.toJson())
//     };
//   }

//   @override
//   String toString() {
//     return 'UserData(userName: $name, userPhoto: $photo, userEmail: $mail)';
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_flutter/data/workout_data.dart';

class UserData {
  String? name;
  String? photo;
  String? mail;
  List<WorkoutData>? workouts;

  UserData({
    required this.name,
    required this.photo,
    required this.mail,
    required this.workouts,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    photo = json['photo'];
    mail = json['mail'];
    if (json['workouts'] != null) {
      List<WorkoutData> workouts = [];
      json['workouts'].forEach((v) {
        workouts.add(new WorkoutData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['mail'] = this.mail;
    if (this.workouts != null) {
      data['workouts'] = this.workouts!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static fromFirebase(User? user) {
    return user != null
        ? UserData(
            name: user.displayName ?? "",
            photo: user.photoURL ?? "",
            mail: user.email ?? "",
            workouts: [],
          )
        : [];
  }
}
