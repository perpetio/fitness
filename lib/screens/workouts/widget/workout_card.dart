import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:fitness_flutter/screens/workouts/bloc/workouts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WorkoutCard extends StatelessWidget {
  final WorkoutData workout;
  WorkoutCard({Key? key, required this.workout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<WorkoutsBloc>(context);
    return Container(
      width: double.infinity,
      height: 140,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorConstants.white,
        boxShadow: [BoxShadow(color: ColorConstants.textBlack.withOpacity(0.12), blurRadius: 5.0, spreadRadius: 1.1)],
      ),
      child: Material(
        color: Colors.transparent,
        child: BlocBuilder<WorkoutsBloc, WorkoutsState>(
          buildWhen: (_, currState) => currState is CardTappedState,
          builder: (context, state) {
            return InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                bloc.add(CardTappedEvent(workout: workout));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(workout.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 3),
                          Text(workout.exercices + " " + TextConstants.exercisesUppercase,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: ColorConstants.grey),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2),
                          const SizedBox(height: 3),
                          Text(workout.minutes + " " + TextConstants.minutes,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: ColorConstants.grey),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2),
                          Spacer(),
                          Text('${workout.currentProgress}/${workout.progress}', style: TextStyle(fontSize: 10)),
                          SizedBox(height: 3),
                          Padding(
                            padding: const EdgeInsets.only(right: 30.0, left: 2),
                            child: LinearPercentIndicator(
                              percent: workout.currentProgress / workout.progress,
                              progressColor: ColorConstants.primaryColor,
                              backgroundColor: ColorConstants.primaryColor.withOpacity(0.12),
                              lineHeight: 6,
                              padding: EdgeInsets.zero,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 60),
                    Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.asset(workout.image, fit: BoxFit.fill))),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
