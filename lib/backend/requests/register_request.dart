import 'dart:io';
import 'package:flutter/cupertino.dart';

class RegisterRequest{
//========================== variable ==========================================
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  File? avatar;


//========================== methods ===========================================

  //region validate Methods
  String? nameValidate(String? value) {
    if(value == null || value.isEmpty){
      return 'لطفا نام خود را وارد کنید!';
    }
    return null;
  }

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

  String? confirmPassWordValidate(String? value) {
    if(value == null || value.isEmpty){
      return 'لطفا تکرار رمز عبور خود را وارد کنید';
    } else if(value != confirmPassController.text) {
      return 'تکرار رمز عبور با رمز عبور وارد شده مطابقت ندارد!';
    }
    return null;
  }
  //endregion

  void send() {}



}