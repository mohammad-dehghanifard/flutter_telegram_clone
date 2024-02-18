import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_telegram_clone/backend/models/user.dart';
import 'package:flutter_telegram_clone/backend/repositories/chat_repository.dart';
import 'package:flutter_telegram_clone/backend/requests/conversation_request.dart';
import 'package:flutter_telegram_clone/helpers/utils/base_controller.dart';
import 'package:flutter_telegram_clone/modules/chat/pages/chat_page.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'socket_controller.dart';

class CreateGroupController extends BaseController {
  CreateGroupController(this.users);
  final List<User> users;
//============================ variable ========================================
  final ConversationRequest request = ConversationRequest();
  final ChatRepository _repository = ChatRepository();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


//============================ methods =========================================
  Future<void> selectImage() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null) {
      request.image = File(image.path);
    }
  }

  Future<void> createGroup() async {
    if(formKey.currentState!.validate()){
      request.type = 'GROUP';
      request.participants = users.map((u) => u.id!).toList();
      load();
      final response = await _repository.createConversationApi(request: request);
      load();
      Get.find<SocketController>().joinConversation(response.id!);
      Get.to(ChatPage(conversation: response, isGroup: true));
    }
  }

}