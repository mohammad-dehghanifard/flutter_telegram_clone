import 'package:flutter_telegram_clone/backend/models/message.dart';
import 'package:flutter_telegram_clone/backend/repositories/chat_repository.dart';
import 'package:flutter_telegram_clone/helpers/utils/base_controller.dart';
import 'package:flutter_telegram_clone/modules/chat/controllers/socket_controller.dart';
import 'package:get/get.dart';

class ChatController extends BaseController {
  ChatController(this.id);
  final int id;

//============================ variables =======================================
  final ChatRepository _repository = ChatRepository();
  List<Message>? messages;

//============================ methods =========================================
  Future<void> getAllMessage() async {
    final result = await _repository.getAllMessageApi(id: id);
    messages = result;
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