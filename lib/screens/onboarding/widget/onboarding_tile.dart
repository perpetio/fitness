import 'package:fitness_flutter/core/config/size_config.dart';
import 'package:flutter/material.dart';

class OnboardingTile extends StatelessWidget {
  final title, imagePath, mainText;

  OnboardingTile({this.imagePath, this.mainText, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 34),
          Image.asset(
            imagePath,
          ),
          const SizedBox(height: 65),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24.0,
            ),
          ),
          const SizedBox(height: 15),
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
      ),
    );
  }
}
