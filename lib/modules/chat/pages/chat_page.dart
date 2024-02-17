import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/backend/models/conversation.dart';
import 'package:flutter_telegram_clone/helpers/widget/loading_widget.dart';
import 'package:flutter_telegram_clone/modules/chat/controllers/chat_controller.dart';
import 'package:flutter_telegram_clone/modules/chat/widgets/chat_app_bar_widget.dart';
import 'package:flutter_telegram_clone/modules/chat/widgets/chat_list_widget.dart';
import 'package:flutter_telegram_clone/modules/chat/widgets/chat_send_box_widget.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, required this.conversation, required this.isGroup});
  final Conversation conversation;
  final bool isGroup;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
        init: ChatController(conversation.id!),
      builder: (buildController) {
        return Scaffold(
          backgroundColor: context.theme.colorScheme.secondaryContainer,
          bottomNavigationBar:  const ChatSendBoxWidget(),
          body:  SafeArea(
            child: Column(
              children: [
                 ChatAppBarWidget(title: conversation.name ?? "",avatar: conversation.image ?? ""),
                  buildController.messages == null
                      ? const Center(child: LoadingWidget())
                      :  ChatListWidget(
                      scrollController: buildController.scrollController,
                      messages: buildController.messages ?? []),
                ],
            ),
          ),
        );
      }
    );
  }
}
