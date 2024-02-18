import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/backend/models/conversation.dart';
import 'package:flutter_telegram_clone/helpers/utils/load_network_image.dart';
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
          SizedBox(
            width: 48,
              height: 48,
              child: LoadNetworkImage(imageUrl: conversation.image ?? "")),
          const W(12),
          // user name and last message
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(conversation.name ?? "",style: context.textTheme.titleSmall),
              Text(conversation.type == "GROUP"? "${conversation.lastMessage?.senderName} : ${conversation.lastMessage?.text}"
                  :conversation.lastMessage?.text ?? "",style: context.textTheme.bodySmall)
            ],
          ),
          const Spacer(),
          // message time and count
          Column(
            children: [
              Text(conversation.lastMessage?.date ?? "",style: context.textTheme.bodySmall),
              const H(8),
              if(conversation.unreadCount! > 0)
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.theme.colorScheme.primary
                ),
                child: Center(child: Text(conversation.unreadCount.toString(),style: context.textTheme.bodySmall!.apply(color: Colors.white))),
              )
            ],
          )

        ],
      ),
    );
  }
}