import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/backend/models/message.dart';
import 'package:flutter_telegram_clone/helpers/utils/load_network_image.dart';
import 'package:flutter_telegram_clone/helpers/utils/user_helper.dart';
import 'package:flutter_telegram_clone/helpers/widget/sized_widget.dart';
import 'package:get/get.dart';

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget({
    super.key,
    required this.message,
  });

  final Message message;
  bool get isSendMessage => message.senderId == userHelper.user!.id!;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSendMessage? Alignment.centerRight :Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // message
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: const Radius.circular(12),
                topLeft: const Radius.circular(12),
                bottomRight: Radius.circular(!isSendMessage? 12 : 0),
                bottomLeft: Radius.circular(isSendMessage? 12 : 0),
              ),
              color: isSendMessage? context.theme.colorScheme.primaryContainer : context.theme.scaffoldBackgroundColor,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Chat message
                Container(
                    constraints: const BoxConstraints(
                        maxWidth: 200
                    ),
                    child: Text(message.text ?? "")),
                const W(20),
                Text(message.date ?? "",style: context.textTheme.bodySmall)

              ],
            ),
          ),
          // avatar
          if(!isSendMessage)...[
            const W(6),
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle
              ),
              child: LoadNetworkImage(imageUrl: message.senderAvatar ?? ""),
            ),
          ]

        ],
      ),
    );
  }
}
