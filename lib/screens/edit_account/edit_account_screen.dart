import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/const/path_constants.dart';
import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/screens/common_widgets/fitness_button.dart';
import 'package:fitness_flutter/screens/common_widgets/settings_container.dart';
import 'package:fitness_flutter/screens/common_widgets/settings_textfield.dart';
import 'package:fitness_flutter/screens/edit_account/bloc/edit_account_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditAccountScreen extends StatelessWidget {
  EditAccountScreen({Key? key}) : super(key: key);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildContext(context),
        appBar: AppBar(
            title: Text('Edit account', style: TextStyle(color: Colors.black, fontSize: 18)),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () => Navigator.of(context).pop(),
            ),
            iconTheme: IconThemeData(
              color: ColorConstants.primaryColor,
            )));
  }

  BlocProvider<EditAccountBloc> _buildContext(BuildContext context) {
    return BlocProvider<EditAccountBloc>(
      create: (context) => EditAccountBloc(),
      child: BlocConsumer<EditAccountBloc, EditAccountState>(
        buildWhen: (_, currState) => currState is EditAccountInitial || currState is EditAccountProgress,
        builder: (context, state) {
          if (state is EditAccountProgress) return Center(child: CircularProgressIndicator());
          return _editAccountContent(context);
        },
        listenWhen: (_, currState) => true,
        listener: (context, state) {},
      ),
    );
  }

  Widget _editAccountContent(BuildContext context) {
    EditAccountBloc _bloc = BlocProvider.of<EditAccountBloc>(context);
    final User? user = FirebaseAuth.instance.currentUser;
    final photoUrl = user?.photoURL ?? null;
    final userName = user?.displayName ?? "No Username";
    final userEmail = user?.email ?? 'No email';
    _nameController.text = userName;
    _emailController.text = userEmail;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: SizedBox(
            height: height - 140,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                  child: photoUrl == null
                      ? CircleAvatar(backgroundImage: AssetImage(PathConstants.profile), radius: 60)
                      : CircleAvatar(backgroundImage: NetworkImage(photoUrl), radius: 60)),
              SizedBox(height: 15),
              Center(
                child: TextButton(
                    onPressed: () async {
                      _bloc.add(UploadImage());
                    },
                    child: Text('Edit photo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorConstants.primaryColor))),
              ),
              SizedBox(height: 15),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text('Full name', style: TextStyle(fontWeight: FontWeight.w600))),
              SettingsContainer(
                  child: SettingsTextField(
                controller: _nameController,
              )),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20.0), child: Text('Email', style: TextStyle(fontWeight: FontWeight.w600))),
              SettingsContainer(
                  child: SettingsTextField(
                controller: _emailController,
              )),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    print('tapped');
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Change Password', style: TextStyle(fontWeight: FontWeight.w600, color: ColorConstants.primaryColor, fontSize: 18)),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward_ios, color: ColorConstants.primaryColor)
                    ],
                  ),
                ),
              ),
              Spacer(),
              FitnessButton(
                title: 'Save',
                isEnabled: true,
                onTap: () {
                  if (userName != _nameController.text || userEmail != _emailController.text) {
                    _bloc.add(ChangeUserData(displayName: _nameController.text, email: _emailController.text));
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
