import 'package:fitness_flutter/core/config/size_config.dart';
import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:flutter/material.dart';

class ExercisesCard extends StatelessWidget {
  final Color color;
  final String title;
  final String exercises;
  final String minutes;
  final String image;

  ExercisesCard({
    required this.color,
    required this.title,
    required this.exercises,
    required this.minutes,
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        top: 10,
        right: 12,
      ),
      height: 160,
      width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text(
                title,
                style: TextStyle(
                  color: ColorConstants.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                exercises,
                style: TextStyle(
                  color: ColorConstants.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                minutes,
                style: TextStyle(
                  color: ColorConstants.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Image(
            image: AssetImage(image),
          ),
        ],
      ),
    );
  }
}
