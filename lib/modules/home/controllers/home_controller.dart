import 'package:flutter/cupertino.dart';
import 'package:flutter_telegram_clone/backend/models/conversation.dart';
import 'package:flutter_telegram_clone/backend/models/message.dart';
import 'package:flutter_telegram_clone/backend/repositories/chat_repository.dart';
import 'package:flutter_telegram_clone/helpers/utils/base_controller.dart';
import 'package:flutter_telegram_clone/helpers/utils/user_helper.dart';
import 'package:flutter_telegram_clone/modules/chat/controllers/socket_controller.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
//====================== variable ==============================================
  final ChatRepository _repository = ChatRepository();
  final List<String> tabs = ["همه پیام ها","خصوصی","گروه ها"];
  final TextEditingController searchController = TextEditingController();
  List<Conversation>? conversationList;
  List<Conversation>? allConversationList;
  int currentTab = 0;
  bool isSearch = false;
//====================== method ================================================
  Future<void> _fetchUserInfo() async {
    final result = await _repository.getUserInfoApi();
    if(result != null) {
      userHelper.setUser(result);
    }

  }
  Future<void> fetchConversation() async {
    conversationList = await _repository.getAllConversationApi();
    allConversationList = conversationList;
    // join user to all conversation for update message in home page item
    conversationList?.forEach((element) {
      Get.find<SocketController>().joinConversation(element.id!);
    });
    update();
  }
  // change tab bar
  void changeTabBar(int tabIndex) {
    currentTab = tabIndex;
    switch(tabIndex){
      case 0 : {
        conversationList = allConversationList;
      }
      case 1 : {
        conversationList = allConversationList?.where((items) => items.type == "PRIVATE").toList();
      }
      case 2 : {
        conversationList = allConversationList?.where((items) => items.type == "GROUP").toList();
      }
    }
    update();
  }
  // chane search state
  void changeSearchState(){
    isSearch = !isSearch;
    update();
  }
  // search
  void searchResult(String value) {
    conversationList = allConversationList?.where((items) => items.name!.contains(value)).toList();
    update();
  }
  // update conversation
  void updateConversation(Message message){
    final conversation = allConversationList?.firstWhere((element) => element.id == message.conversationId!);
    if(conversation != null) {
      conversation.lastMessage = message;
      conversation.unreadCount = conversation.unreadCount! + 1;
      update();
    }
  }
//======================= life cycle ===========================================
  @override
  void onInit() {
    fetchConversation();
    _fetchUserInfo();
    Get.put(SocketController());
    super.onInit();
  }
}