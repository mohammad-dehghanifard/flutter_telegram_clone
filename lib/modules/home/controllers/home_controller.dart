import 'package:flutter/cupertino.dart';
import 'package:flutter_telegram_clone/backend/models/conversation.dart';
import 'package:flutter_telegram_clone/backend/repositories/chat_repository.dart';
import 'package:flutter_telegram_clone/helpers/utils/base_controller.dart';
import 'package:flutter_telegram_clone/helpers/utils/user_helper.dart';

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
  Future<void> _fetchConversation() async {
    conversationList = await _repository.getAllConversationApi();
    allConversationList = conversationList;
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
//======================= life cycle ===========================================
  @override
  void onInit() {
    _fetchConversation();
    _fetchUserInfo();
    super.onInit();
  }
}