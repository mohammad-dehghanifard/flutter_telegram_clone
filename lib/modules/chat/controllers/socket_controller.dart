import 'package:flutter_telegram_clone/backend/models/message.dart';
import 'package:flutter_telegram_clone/backend/models/user.dart';
import 'package:flutter_telegram_clone/helpers/utils/base_controller.dart';
import 'package:flutter_telegram_clone/helpers/utils/constants.dart';
import 'package:flutter_telegram_clone/helpers/utils/user_helper.dart';
import 'package:flutter_telegram_clone/modules/chat/controllers/chat_controller.dart';
import 'package:flutter_telegram_clone/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketController extends BaseController {
//====================== variables =============================================
 late Socket socket;
 ChatController get chatController => Get.find<ChatController>();
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
   final Message message = Message.fromJson(data["message"]);
      if (Get.isRegistered<ChatController>()) {
       chatController.addMessageToList(message);
        seenMessage(message.conversationId!);
      }
      Get.find<HomeController>().updateConversation(message);
    });
  }

  void seenMessage(int id) {
    socket.emit("seenMessages",{
      "userId" : userHelper.user?.id!,
      "conversationId" : id
    });
  }

  void startTyping(int id) {
    socket.emit("startTyping",{
      "userId" : userHelper.user?.id!,
      "conversationId" : id
    });
  }

  void stopTyping(int id) {
    socket.emit("stopTyping",{
      "userId" : userHelper.user?.id!,
      "conversationId" : id
    });
  }
  
  void listenToSeenMessage() {
    socket.on("seenMessage", (data) {
      if(Get.isRegistered<ChatController>()){
        if(Get.find<ChatController>().id == data['conversationId']){
         chatController.updateSeenMessage();
        }
      }
    });
  }

  void listenToTyping() {
    socket.on("userTyping", (data) {
      if(Get.isRegistered<ChatController>()){
        final User user = User.fromJson(data["user"]);
        if(Get.find<ChatController>().id == data['conversationId']){
         chatController.toggleTyping();
         chatController.addUserToTyping(user);
        }
      }
    });

    socket.on("userStoppedTyping", (data) {
      if(Get.isRegistered<ChatController>()){
        if(Get.find<ChatController>().id == data['conversationId']){
         chatController.toggleTyping();
         chatController.removeUserTypingInGroup(data['userId']);
        }
      }
    });
  }

  void sendFile(
      {required int conversationId,
      required String file,
      required String fileType,
      required String type}) {
    socket.emit("sendFile", {
      "userId": userHelper.user?.id,
      "conversationId": conversationId,
      "file" : file,
      "fileType" : fileType,
      "type" : type
    });
  }

//======================== life cycle ==========================================
  @override
  void onInit() {
    _initSocket();
    listenToMessage();
    listenToSeenMessage();
    listenToTyping();
    super.onInit();
  }
}