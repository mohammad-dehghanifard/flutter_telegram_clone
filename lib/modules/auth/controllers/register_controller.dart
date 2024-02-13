import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_telegram_clone/backend/requests/register_request.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {

//========================== variable ==========================================
  final RegisterRequest registerRequest = RegisterRequest();
  final GlobalKey<FormState> formKey =  GlobalKey<FormState>();

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

      }
  }

}