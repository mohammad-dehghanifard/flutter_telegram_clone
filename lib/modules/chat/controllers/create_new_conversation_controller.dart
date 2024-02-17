import 'package:flutter/cupertino.dart';
import 'package:flutter_telegram_clone/backend/repositories/chat_repository.dart';
import 'package:flutter_telegram_clone/backend/requests/conversation_request.dart';
import 'package:flutter_telegram_clone/helpers/utils/base_controller.dart';

class CreateNewConversationController extends BaseController {
//=========================== variables ========================================
  final TextEditingController nameText = TextEditingController();
  final ConversationRequest request = ConversationRequest();
  final ChatRepository _repository = ChatRepository();

//=========================== methods ==========================================

  Future<void> createMessage(int userId) async {
    request.participants = [userId];
    await _repository.createConversationApi(request: request);
  }

}