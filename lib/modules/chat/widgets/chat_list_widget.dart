import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/backend/models/message.dart';
import 'chat_message_image_item.dart';
import 'chat_message_item.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({super.key, required this.messages, required this.scrollController});
  final List<Message> messages;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        itemCount: messages.length,
          itemBuilder: (context, index) {
          final type = messages[index].type;
          if(type == "TEXT"){
            return ChatMessageWidget(message: messages[index]);
          } else if(type == "IMAGE"){
            return ChatMessageImageWidget(message: messages[index]);
          } else {
            return ChatMessageWidget(message: messages[index]);
          }
          },
      ),
    );
  }
}