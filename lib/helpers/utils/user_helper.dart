import 'package:get/get.dart';

class UserHelper extends GetxController {
  String? token;

  void setToken(String value) => token = value;
}

final userHelper = Get.find<UserHelper>();