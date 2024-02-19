import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_telegram_clone/backend/models/message.dart';
import 'package:flutter_telegram_clone/backend/models/user.dart';
import 'package:flutter_telegram_clone/backend/repositories/chat_repository.dart';
import 'package:flutter_telegram_clone/helpers/utils/base_controller.dart';
import 'package:flutter_telegram_clone/modules/chat/controllers/socket_controller.dart';
import 'package:flutter_telegram_clone/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChatController extends BaseController {
  ChatController(this.id);
  final int id;

//============================ variables =======================================
  final ChatRepository _repository = ChatRepository();
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  List<Message>? messages;
  List<User> usersTyping = [];
  bool isTyping = false;
  bool isUserTyping = false;
  File? selectedImage;

//============================ methods =========================================
  Future<void> getAllMessage() async {
    final result = await _repository.getAllMessageApi(id: id);
    Get.find<HomeController>().fetchConversation();
    Get.find<SocketController>().seenMessage(id);
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

  void updateSeenMessage() {
    messages?.forEach((element) {
      element.isSeen = true;
    });
    update();
  }

  void toggleTyping() {
    isTyping = !isTyping;
    update();
  }

  Future<void> selectAndSendImage() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null) {
      selectedImage = File(image.path);
    }
  }

  void checkUserTyping() {
    if(!isUserTyping){
      isUserTyping = true;
      update();
      Get.find<SocketController>().startTyping(id);
      Future.delayed(const Duration(seconds: 4)).then((value) {
        isUserTyping = false;
        Get.find<SocketController>().stopTyping(id);
        update();
      });
    }
  }
  // for group typing
  void addUserToTyping(User user) {
    if(!usersTyping.contains(user)){
      usersTyping.add(user);
      update();
    }
  }
  void removeUserTypingInGroup(int id) {
    usersTyping.removeWhere((user) => user.id == id);
    update();
  }
  String getGroupTypingText(List<User> users){
    if(users.length == 1){
      return "${users.first.name} در حال تایپ است...";
    }
    return '${users.length} نفر در حال تایپ هستند...';
  }

//============================ life cycle ======================================
  @override
  void onInit() {
    Get.find<SocketController>().joinConversation(id);
    getAllMessage();
    super.onInit();
  }

  @override
  void onClose() {
    Get.find<SocketController>().stopTyping(id);
    super.onClose();
  }

}