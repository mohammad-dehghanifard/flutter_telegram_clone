import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/helpers/widget/sized_widget.dart';
import 'package:get/get.dart';

class HomeChatListItem extends StatelessWidget {
  const HomeChatListItem({
    super.key,
  });

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
              Text("خانم زارع",style: context.textTheme.titleSmall),
              Text("ممنون از شما",style: context.textTheme.bodySmall)
            ],
          ),
          const Spacer(),
          // message time and count
          Column(
            children: [
              Text("13:02",style: context.textTheme.bodySmall),
              const H(8),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.theme.colorScheme.primary
                ),
                child: Center(child: Text("2",style: context.textTheme.bodySmall!.apply(color: Colors.white))),
              )
            ],
          )

        ],
      ),
    );
  }
}