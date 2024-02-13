import 'package:flutter_telegram_clone/helpers/utils/user_helper.dart';
import 'package:flutter_telegram_clone/helpers/utils/utils_method.dart';
import 'package:flutter_telegram_clone/modules/auth/pages/start_page.dart';
import 'package:flutter_telegram_clone/modules/home/pages/home_page.dart';
import 'package:get/get.dart';

class StartController extends GetxController {
  @override
  void onInit() {
     getToken().then((value) {
       if(value == null){
         Get.to(const StartPage());
       } else{
         userHelper.setToken(value);
         Get.to(const HomePage());
       }
     });

    super.onInit();
  }
}