import 'package:get/get.dart';

class BaseController extends GetxController{
  bool loading = false;

  void load(){
    loading = !loading;
    update();
  }
}