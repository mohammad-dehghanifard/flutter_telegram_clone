import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_telegram_clone/backend/repositories/auth_repository.dart';
import 'package:flutter_telegram_clone/backend/requests/register_request.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {

//========================== variable ==========================================
  final RegisterRequest registerRequest = RegisterRequest();
  final AuthRepository _repository = AuthRepository();
  final GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  bool loading = false;

//========================== methods ===========================================

  Future<void> setAvatar() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      registerRequest.avatar = File(image.path);
      update();
    }
  }

  Future<void> register() async {
      if(formKey.currentState!.validate()){
        loading = true;
        update();
        await _repository.registerApi(request: registerRequest);
        loading = false;
      }
  }

}