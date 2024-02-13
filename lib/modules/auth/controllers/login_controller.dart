import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/backend/repositories/auth_repository.dart';
import 'package:flutter_telegram_clone/backend/requests/login_request.dart';
import 'package:flutter_telegram_clone/helpers/utils/base_controller.dart';
import 'package:flutter_telegram_clone/helpers/utils/user_helper.dart';
import 'package:flutter_telegram_clone/helpers/utils/utils_method.dart';
import 'package:flutter_telegram_clone/modules/home/pages/home_page.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  //========================== variable ==========================================
  final AuthRepository _repository = AuthRepository();
  final LoginRequest request = LoginRequest();
  final GlobalKey<FormState> formKey =  GlobalKey<FormState>();

//========================== methods ===========================================

  Future<void> login() async {
    if(formKey.currentState!.validate()){
        load();
        final result = await _repository.loginApi(request: request);
        if(result != null){
          await saveToken(result);
          userHelper.setToken(result);
          Get.offAll(const HomePage());
        }
        load();
    }
  }
}