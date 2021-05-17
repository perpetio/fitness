import 'package:fitness_flutter/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  height: SizeConfig.screenHeight * 0.30,
                  decoration: BoxDecoration(
                    color: Color(0xFFCFC4FB),
                    shape: BoxShape.circle,
                  ),
                ),
                ClipOval(child: Image.asset('assets/images/3_6.png'))
              ],
            ),
          ),
          Expanded(flex: 2, child: Container())
        ],
      ),
    );
  }
}
