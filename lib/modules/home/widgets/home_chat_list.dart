import 'package:flutter/material.dart';
import 'home_chat_list_item.dart';

class HomeChatList extends StatelessWidget {
  const HomeChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const HomeChatListItem();
        },);
  }
}


