import 'package:fitness_flutter/screens/workout_details_screen.dart/widget/workout_details_content.dart';
import 'package:flutter/material.dart';

class WorkoutDetailsPage extends StatelessWidget {
  const WorkoutDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WorkoutDetailsContent(),
    );
  }
}
