import 'package:flutter/material.dart';
import 'chat_message_item.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChatMessage> chats = [
      ChatMessage(message: 'سلام سمینار ساعت چند برگذار میشه؟', time: '۱۲:۳۰', isSendMessage: false),
      ChatMessage(message: 'سلام ساعت ۶', time: '۱۲:۳۵', isSendMessage: true),
      ChatMessage(message: 'سانس دوم سمینار کی هست ؟', time: '۱۲:۴۲', isSendMessage: false),
      ChatMessage(message: 'متاسفانه این ساعت نمیتونم بیام', time: '۱۲:۴۶', isSendMessage: false),
      ChatMessage(message: 'اشکالی نداره ساعت ۹ هم میتونید تشریف بیارید', time: '۱۳:۰۰', isSendMessage: true),
      ChatMessage(message: 'ممنون از شما', time: '۱۳:۰۲', isSendMessage: false),
    ];
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        itemCount: chats.length,
          itemBuilder: (context, index) {
          return ChatMessageWidget(chat: chats[index]);
          },
      ),
    );
  }
}



class ChatMessage {
  ChatMessage({required this.message,required this.time,required this.isSendMessage});
  final String message;
  final String time;
  final bool isSendMessage;
}