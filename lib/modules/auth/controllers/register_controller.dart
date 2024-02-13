import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_telegram_clone/backend/repositories/auth_repository.dart';
import 'package:flutter_telegram_clone/backend/requests/register_request.dart';
import 'package:flutter_telegram_clone/helpers/utils/base_controller.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends BaseController {

//========================== variable ==========================================
  final RegisterRequest registerRequest = RegisterRequest();
  final AuthRepository _repository = AuthRepository();
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
        load();
        await _repository.registerApi(request: registerRequest);
        load();
      }
  }

}