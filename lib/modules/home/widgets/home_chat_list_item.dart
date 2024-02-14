import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/backend/models/conversation.dart';
import 'package:flutter_telegram_clone/helpers/widget/sized_widget.dart';
import 'package:get/get.dart';

class HomeChatListItem extends StatelessWidget {
  const HomeChatListItem({
    super.key, required this.conversation,
  });
  final Conversation conversation;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 18),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: context.theme.dividerColor))
      ),
      child: Row(
        children: [
          // user avatar
          const CircleAvatar(),
          const W(12),
          // user name and last message
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(conversation.name ?? "",style: context.textTheme.titleSmall),
              Text(conversation.lastMessage?.text ?? "",style: context.textTheme.bodySmall)
            ],
          ),
          const Spacer(),
          // message time and count
          Column(
            children: [
              Text(conversation.lastMessage?.date ?? "",style: context.textTheme.bodySmall),
              const H(8),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.theme.colorScheme.primary
                ),
                child: Center(child: Text(conversation.lastMessage?.conversationId.toString() ?? "",style: context.textTheme.bodySmall!.apply(color: Colors.white))),
              )
            ],
          )

        ],
      ),
    );
  }
}