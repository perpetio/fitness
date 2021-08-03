import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fitness_flutter/core/service/firebase_storage_service.dart';
import 'package:fitness_flutter/core/service/user_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'edit_account_event.dart';
part 'edit_account_state.dart';

class EditAccountBloc extends Bloc<EditAccountEvent, EditAccountState> {
  EditAccountBloc() : super(EditAccountInitial());

  @override
  Stream<EditAccountState> mapEventToState(
    EditAccountEvent event,
  ) async* {
    if (event is UploadImage) {
      yield EditAccountProgress();
      final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) await FirebaseStorageService.uploadImage(filePath: image.path);
      yield EditAccountInitial();
    }
    if (event is ChangeUserData) {
      yield EditAccountProgress();
      await UserService.changeUserData(displayName: event.displayName, email: event.email);
      yield EditAccountInitial();
    }
  }
}
