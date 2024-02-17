import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/backend/models/message.dart';
import 'chat_message_item.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({super.key, required this.messages});
  final List<Message> messages;
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        itemCount: messages.length,
          itemBuilder: (context, index) {
          return ChatMessageWidget(message: messages[index]);
          },
      ),
    );
  }
}