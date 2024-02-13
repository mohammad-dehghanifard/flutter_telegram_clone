import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/backend/repositories/auth_repository.dart';
import 'package:flutter_telegram_clone/backend/requests/login_request.dart';
import 'package:flutter_telegram_clone/helpers/utils/base_controller.dart';

class LoginController extends BaseController {
  //========================== variable ==========================================
  final AuthRepository _repository = AuthRepository();
  final LoginRequest request = LoginRequest();
  final GlobalKey<FormState> formKey =  GlobalKey<FormState>();

//========================== methods ===========================================

  Future<void> login() async {
    if(formKey.currentState!.validate()){

    }
  }
}