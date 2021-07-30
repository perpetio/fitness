import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:flutter/material.dart';

class WorkoutTag extends StatelessWidget {
  final String icon;
  final String content;

  WorkoutTag({required this.icon, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorConstants.primaryColor.withOpacity(0.12),
      ),
      child: Center(
        child: Row(
          children: [
            Container(
              height: 17,
              width: 17,
              child: Image(
                image: AssetImage(icon),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 7),
            Text(
              content,
              style: TextStyle(
                color: ColorConstants.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
