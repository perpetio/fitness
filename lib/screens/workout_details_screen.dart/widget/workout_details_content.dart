import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/const/path_constants.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class WorkoutDetailsContent extends StatelessWidget {
  const WorkoutDetailsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: ColorConstants.white,
      child: SlidingUpPanel(
        panel: Center(
          child: Text('Center'),
        ),
        body: Positioned(
          child: Image.asset(PathConstants.yogaWorkout),
          top: 0,
        ),
        // borderRadius: BorderRadius.only(topLeft: Radius., topRight: ),
      ),
    );
  }
}
