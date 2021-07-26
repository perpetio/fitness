import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/screens/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);
    final User? user = FirebaseAuth.instance.currentUser;
    final displayName = user?.displayName ?? "No Username";
    return Container(
      color: ColorConstants.white,
      height: double.infinity,
      width: double.infinity,
      child: SafeArea(
        child: Center(
          child: Container(
            height: 150,
            child: Column(
              children: [
                Text(
                  displayName,
                ),
                RawMaterialButton(
                  fillColor: ColorConstants.primaryColor,
                  child: Text(
                    TextConstants.signOut,
                    style: TextStyle(
                      color: ColorConstants.white,
                    ),
                  ),
                  onPressed: () {
                    bloc.add(SignOutEvent());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
