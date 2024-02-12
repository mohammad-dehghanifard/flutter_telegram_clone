import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserContactItem extends StatelessWidget {
  const UserContactItem({
    this.isGroup = false,
    super.key,
  });
  final bool isGroup;
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
            child: Image.network("https://dl.hitaldev.com/chat/avatars/pp.png",fit: BoxFit.cover),
          ),
          const W(10),
          // user name
          Text('خانم زارع',style: context.textTheme.titleSmall)
        ],
      ),
    );
  }
}