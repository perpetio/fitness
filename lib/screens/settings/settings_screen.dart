import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/const/path_constants.dart';
import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/core/service/auth_service.dart';
import 'package:fitness_flutter/screens/common_widgets/settings_container.dart';
import 'package:fitness_flutter/screens/edit_account/edit_account_screen.dart';
import 'package:fitness_flutter/screens/reminder/page/reminder_page.dart';
import 'package:fitness_flutter/screens/settings/bloc/bloc/settings_bloc.dart';
import 'package:fitness_flutter/screens/sign_in/page/sign_in_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? photoUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildContext(context));
  }

  BlocProvider<SettingsBloc> _buildContext(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (context) => SettingsBloc(),
      child: BlocConsumer<SettingsBloc, SettingsState>(
        buildWhen: (_, currState) => currState is SettingsInitial,
        builder: (context, state) {
          return _settingsContent(context);
        },
        listenWhen: (_, currState) => true,
        listener: (context, state) {},
      ),
    );
  }

  Widget _settingsContent(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final displayName = user?.displayName ?? "No Username";
    photoUrl = user?.photoURL ?? null;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Column(children: [
            Stack(alignment: Alignment.topRight, children: [
              Center(
                child: photoUrl == null
                    ? CircleAvatar(backgroundImage: AssetImage(PathConstants.profile), radius: 60)
                    : CircleAvatar(
                        child: ClipOval(
                            child: FadeInImage.assetNetwork(
                          placeholder: PathConstants.profile,
                          image: photoUrl!,
                          fit: BoxFit.cover,
                          width: 200,
                          height: 120,
                        )),
                        radius: 60,
                      ),
              ),
              TextButton(
                  onPressed: () async {
                    await Navigator.push(context, MaterialPageRoute(builder: (context) => EditAccountScreen()));
                    setState(() {
                      photoUrl = user?.photoURL ?? null;
                    });
                  },
                  style: TextButton.styleFrom(shape: CircleBorder(), backgroundColor: ColorConstants.primaryColor.withOpacity(0.16)),
                  child: Icon(Icons.edit, color: ColorConstants.primaryColor)),
            ]),
            SizedBox(height: 15),
            Text(displayName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            SettingsContainer(
              child: Text(TextConstants.reminder, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
              withArrow: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ReminderPage()));
              },
            ),
            if (!kIsWeb)
              SettingsContainer(
                child: Text(TextConstants.rateUsOn + '${Platform.isIOS ? 'App store' : 'Play market'}',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                onTap: () {
                  return launch(Platform.isIOS ? 'https://www.apple.com/app-store/' : 'https://play.google.com/store');
                },
              ),
            SettingsContainer(
                onTap: () => launch('https://perpet.io/'), child: Text(TextConstants.terms, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500))),
            SettingsContainer(
                child: Text(TextConstants.signOut, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                onTap: () {
                  AuthService.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => SignInPage()),
                  );
                }),
            SizedBox(height: 15),
            Text(TextConstants.joinUs, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () => launch('https://www.facebook.com/perpetio/'),
                    style: TextButton.styleFrom(shape: CircleBorder(), backgroundColor: Colors.white, elevation: 1),
                    child: Image.asset(PathConstants.facebook)),
                TextButton(
                    onPressed: () => launch('https://www.instagram.com/perpetio/'),
                    style: TextButton.styleFrom(shape: CircleBorder(), backgroundColor: Colors.white, elevation: 1),
                    child: Image.asset(PathConstants.instagram)),
                TextButton(
                    onPressed: () => launch('https://twitter.com/perpetio'),
                    style: TextButton.styleFrom(shape: CircleBorder(), backgroundColor: Colors.white, elevation: 1),
                    child: Image.asset(PathConstants.twitter)),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
