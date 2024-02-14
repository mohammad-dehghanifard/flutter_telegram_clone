import 'package:flutter_telegram_clone/backend/models/conversation.dart';
import 'package:flutter_telegram_clone/backend/repositories/chat_repository.dart';
import 'package:flutter_telegram_clone/helpers/utils/base_controller.dart';
import 'package:flutter_telegram_clone/helpers/utils/user_helper.dart';

class HomeController extends BaseController {
//====================== variable ==============================================
  final ChatRepository _repository = ChatRepository();
  List<Conversation>? conversationList;
//====================== method ================================================
  Future<void> _fetchUserInfo() async {
    final result = await _repository.getUserInfoApi();
    if(result != null) {
      userHelper.setUser(result);
    }

  }
  Future<void> _fetchConversation() async {
    conversationList = await _repository.getAllConversationApi();
    update();
  }
//======================= life cycle ===========================================
  @override
  void onInit() {
    _fetchConversation();
    _fetchUserInfo();
    super.onInit();
  }
}