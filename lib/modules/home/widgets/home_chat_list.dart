import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/backend/models/conversation.dart';
import 'package:flutter_telegram_clone/modules/chat/pages/chat_page.dart';
import 'package:get/get.dart';
import 'home_chat_list_item.dart';

class HomeChatList extends StatelessWidget {
  const HomeChatList({super.key, required this.chats});
  final List<Conversation> chats;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final Conversation conversation = chats[index];
          return GestureDetector(
            onTap: () => Get.to(const ChatPage()),
              child: HomeChatListItem(conversation: conversation));
        },);
  }
}


