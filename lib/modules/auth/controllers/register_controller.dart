import 'package:flutter/cupertino.dart';
import 'package:flutter_telegram_clone/backend/requests/register_request.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {

//========================== variable ==========================================
  final RegisterRequest registerRequest = RegisterRequest();
  final GlobalKey<FormState> formKey =  GlobalKey<FormState>();

//========================== methods ===========================================

  Future<void> register() async {
      if(formKey.currentState!.validate()){

      }
  }

}