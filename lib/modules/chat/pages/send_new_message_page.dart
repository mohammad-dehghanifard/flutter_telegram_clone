import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/helpers/widget/page_app_bar_widget.dart';
import 'package:flutter_telegram_clone/modules/chat/controllers/create_new_conversation_controller.dart';
import 'package:flutter_telegram_clone/modules/chat/pages/create_group_page.dart';
import 'package:flutter_telegram_clone/modules/chat/widgets/select_contact_widget.dart';
import 'package:get/get.dart';


class SendNewMessagePage extends StatelessWidget {
  const SendNewMessagePage({super.key, required this.title, required this.group});
  final String title;
  final bool group;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<CreateNewConversationController>(
          init: CreateNewConversationController(),
          builder: (buildController) {
            return Column(
              children: [
                // app bar
                 PageAppBarWidget(title: title),
                Expanded(child: SelectContactWidget(
                    isMultiple: group,
                    onSelect: (user) => buildController.createMessage(user.id!),
                    onMultiUserSelect: (users) => Get.to(CreateGroupPage(users: users)),
                ))
              ],
            );
          }
        )
      ),
    );
  }
}



