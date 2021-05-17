import 'package:fitness_flutter/constants.dart';
import 'package:fitness_flutter/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: OnboardingTile(
              title: 'Workout anywhere',
              mainText:
                  'You can do your workout at home without any equipment, outside or at the gym.',
              imagePath: 'assets/images/onboarding/onboarding1.png',
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Row(
                    // children: List.generate(3, (index) => _buildDot()),
                    ),
                Spacer(),
                Material(
                  shape: CircleBorder(),
                  color: kPrimaryColor,
                  child: RawMaterialButton(
                    shape: CircleBorder(),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Icon(
                        Icons.east_rounded,
                        size: 38.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingTile extends StatelessWidget {
  final title, imagePath, mainText;

  OnboardingTile({this.imagePath, this.mainText, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: SizeConfig.screenWidth * 0.075),
          child: Image.asset(imagePath),
        ),
        Spacer(),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth / 100,
          ),
          child: Text(
            mainText,
            style: TextStyle(
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
