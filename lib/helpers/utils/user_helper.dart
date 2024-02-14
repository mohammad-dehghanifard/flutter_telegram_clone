import 'package:flutter_telegram_clone/backend/models/user.dart';
import 'package:get/get.dart';

class UserHelper extends GetxController {
  String? token;
  User? user;

  void setToken(String value) => token = value;
  void setUser(User newUser) {
    user = newUser;
    update();
  }
}

final userHelper = Get.find<UserHelper>();