import 'package:flutter/cupertino.dart';
import 'package:flutter_telegram_clone/backend/models/message.dart';
import 'package:flutter_telegram_clone/backend/repositories/chat_repository.dart';
import 'package:flutter_telegram_clone/helpers/utils/base_controller.dart';
import 'package:flutter_telegram_clone/modules/chat/controllers/socket_controller.dart';
import 'package:flutter_telegram_clone/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class ChatController extends BaseController {
  ChatController(this.id);
  final int id;

//============================ variables =======================================
  final ChatRepository _repository = ChatRepository();
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  List<Message>? messages;

//============================ methods =========================================
  Future<void> getAllMessage() async {
    final result = await _repository.getAllMessageApi(id: id);
    Get.find<HomeController>().fetchConversation();
    messages = result;
    Future.delayed(const Duration(milliseconds: 50)).then((_) => scrollDown());
    update();
  }
  
  void scrollDown() {
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  void sendMessage() {
    if(textController.text.isNotEmpty){
      Get.find<SocketController>().sendMessage(conversationId: id, text: textController.text);
      textController.clear();
      Get.focusScope?.unfocus();
    }
  }

  void addMessageToList(Message message) {
    messages?.add(message);
    scrollController.jumpTo(scrollController.position.maxScrollExtent + 100);
    update();
  }


//============================ life cycle ======================================
  @override
  void onInit() {
    Get.find<SocketController>().joinConversation(id);
    getAllMessage();
    super.onInit();
  }
}