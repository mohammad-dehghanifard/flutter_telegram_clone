import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/modules/chat/widgets/chat_app_bar_widget.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.secondaryContainer,
      body: SafeArea(
        child: Column(
          children: [
            ChatAppBarWidget()
          ],
        ),
      ),
    );
  }
}
