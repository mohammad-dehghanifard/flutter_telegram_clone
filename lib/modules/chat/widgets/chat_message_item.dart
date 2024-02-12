import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/helpers/widget/sized_widget.dart';
import 'package:get/get.dart';
import 'chat_list_widget.dart';

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget({
    super.key,
    required this.chat,
  });

  final ChatMessage chat;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: chat.isSendMessage? Alignment.centerRight :Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: const Radius.circular(12),
            topLeft: const Radius.circular(12),
            bottomRight: Radius.circular(!chat.isSendMessage? 12 : 0),
            bottomLeft: Radius.circular(chat.isSendMessage? 12 : 0),
          ),
          color: chat.isSendMessage? context.theme.colorScheme.primaryContainer : context.theme.scaffoldBackgroundColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Chat message
            Container(
                constraints: const BoxConstraints(
                    maxWidth: 200
                ),
                child: Text(chat.message)),
            const W(20),
            Text(chat.time,style: context.textTheme.bodySmall)

          ],
        ),
      ),
    );
  }
}
