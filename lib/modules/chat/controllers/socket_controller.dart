import 'package:flutter_telegram_clone/backend/models/message.dart';
import 'package:flutter_telegram_clone/helpers/utils/base_controller.dart';
import 'package:flutter_telegram_clone/helpers/utils/constants.dart';
import 'package:flutter_telegram_clone/helpers/utils/user_helper.dart';
import 'package:flutter_telegram_clone/modules/chat/controllers/chat_controller.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketController extends BaseController {
//====================== variables =============================================
 late Socket socket;

//====================== methods ===============================================
  void _initSocket() {
   socket = io(socketUrl,OptionBuilder().setTransports(['websocket']).build());
   socket.onConnect((_) {
   });
  }
  
  void joinConversation(int id) => socket.emit("joinConversation",id);

  void sendMessage({required int conversationId,required String text}) {
   socket.emit("sendMessage",{
    "userId" : userHelper.user?.id,
    "conversationId" : conversationId,
    "text" : text
   });
  }

 void listenToMessage() {
  socket.on("receiveMessage", (data) {
      if (Get.isRegistered<ChatController>()) {
        final Message message = Message.fromJson(data["message"]);
        Get.find<ChatController>().addMessageToList(message);
      }
    });
  }

//======================== life cycle ==========================================
  @override
  void onInit() {
    _initSocket();
    listenToMessage();
    super.onInit();
  }
}