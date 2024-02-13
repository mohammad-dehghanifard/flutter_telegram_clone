import 'package:flutter/material.dart';

class LoginRequest {
//========================== variable ==========================================
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

//========================== methods ===========================================
  String? mobileValidate(String? value) {
    if(value == null || value.isEmpty){
      return 'لطفا شماره موبایل خود را وارد کنید!';
    } else if(value.length < 11) {
      return 'شماره موبایل باید 11 رقم باشد';
    }
    return null;
  }

  String? passWordValidate(String? value) {
    if(value == null || value.isEmpty){
      return 'برای امنیت حساب خود، لطفا یک رمز عبور قوی وارد کنید';
    } else if(value.length < 8) {
      return 'رمز عبور باید بیشتر از 8 حرف باشد!';
    }
    return null;
  }

  Map<String,String> data() {
    return {
      "mobile" : mobileController.text,
      'password' : passwordController.text
    };
  }


}