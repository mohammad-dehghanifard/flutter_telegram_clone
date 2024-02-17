import 'package:flutter/cupertino.dart';
import 'package:flutter_telegram_clone/backend/repositories/chat_repository.dart';
import 'package:flutter_telegram_clone/backend/requests/conversation_request.dart';
import 'package:flutter_telegram_clone/helpers/utils/base_controller.dart';
import 'package:flutter_telegram_clone/modules/chat/controllers/socket_controller.dart';
import 'package:flutter_telegram_clone/modules/chat/pages/chat_page.dart';
import 'package:get/get.dart';

class CreateNewConversationController extends BaseController {
//=========================== variables ========================================
  final TextEditingController nameText = TextEditingController();
  final ConversationRequest request = ConversationRequest();
  final ChatRepository _repository = ChatRepository();

//=========================== methods ==========================================

  Future<void> createMessage(int userId) async {
    request.participants = [userId];
    final response = await _repository.createConversationApi(request: request);
    Get.find<SocketController>().joinConversation(response.id!);
    Get.to(ChatPage(conversation: response, isGroup: false,));
  }

}