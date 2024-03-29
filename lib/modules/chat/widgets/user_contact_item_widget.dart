import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/backend/models/user.dart';
import 'package:flutter_telegram_clone/helpers/utils/load_network_image.dart';
import 'package:flutter_telegram_clone/helpers/widget/sized_widget.dart';
import 'package:get/get.dart';

class UserContactItem extends StatelessWidget {
  const UserContactItem({
    this.isGroup = false,
    super.key,
    required this.user,
    this.selected = false,
  });
  final bool isGroup;
  final bool selected;
  final User user;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: context.theme.dividerColor))
      ),
      child: Row(
        children: [
          // avatar
          Container(
            width: 46,
            height: 46,
            decoration: const BoxDecoration(
                shape: BoxShape.circle
            ),
            child: LoadNetworkImage(imageUrl: user.avatar ?? ""),
          ),
          const W(10),
          // user name
          Text(user.name ?? "",style: context.textTheme.titleSmall),
          if(isGroup)...[
            const Spacer(),
            // check box
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: selected? context.iconColor : Colors.transparent,
                border: Border.all(color: context.theme.iconTheme.color!),
                borderRadius: BorderRadius.circular(3)
              ),
              child: Icon(Icons.check,size: 14,color: context.theme.scaffoldBackgroundColor),
            )
          ]
        ],
      ),
    );
  }
}