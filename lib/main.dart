import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/screens/onboarding/page/onboarding_page.dart';
import 'package:flutter/material.dart';

const text = "Wow";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness',
      theme: ThemeData(
        textTheme:
            TextTheme(bodyText1: TextStyle(color: ColorConstants.kTextColor)),
        fontFamily: 'NotoSansKR',
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OnboardingPage(),
    );
  }
}
