import 'package:flutter_telegram_clone/backend/repositories/chat_repository.dart';
import 'package:flutter_telegram_clone/helpers/utils/base_controller.dart';
import 'package:flutter_telegram_clone/helpers/utils/user_helper.dart';

class HomeController extends BaseController {
//====================== variable ==============================================
  final ChatRepository _repository = ChatRepository();

//====================== method ================================================
  Future<void> _fetchUserInfo() async {
    final result = await _repository.getUserInfoApi();
    if(result != null) {
      userHelper.setUser(result);
    }

  }

//======================= life cycle ===========================================
  @override
  void onInit() {
    _fetchUserInfo();
    super.onInit();
  }
}