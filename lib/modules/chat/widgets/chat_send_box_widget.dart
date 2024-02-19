import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/helpers/widget/circle_icon_button_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/sized_widget.dart';
import 'package:flutter_telegram_clone/modules/chat/controllers/chat_controller.dart';
import 'package:flutter_telegram_clone/modules/chat/widgets/record_voice_bottom_sheet.dart';
import 'package:get/get.dart';

class ChatSendBoxWidget extends StatelessWidget {
  const ChatSendBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      builder: (buildController) {
        return Padding(
          padding:  EdgeInsets.only(
            bottom: MediaQuery.viewInsetsOf(context).bottom
          ),
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: context.theme.scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(24),
                topLeft: Radius.circular(24),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(12,15,12,20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // send voice
                CircleIconButtonWidget(onTap: () {
                  showModalBottomSheet(context: context, builder: (context) => const RecordViceBottomSheet());
                },icon: FeatherIcons.mic),
                const W(10),
                // send file
                CircleIconButtonWidget(onTap: () => Get.find<ChatController>().selectAndSendImage(),icon: FeatherIcons.filePlus),
                const W(10),
                // send message
                CircleIconButtonWidget(onTap: () => Get.find<ChatController>().sendMessage(),icon: FeatherIcons.send),
                const W(20),
                // text input
                Expanded(
                  child: TextFormField(
                    controller: Get.find<ChatController>().textController,
                    onChanged: (value) => buildController.checkUserTyping(),
                    decoration: const InputDecoration(
                      isDense: true,
                      hintText: 'پیام خود را بنویسید ...'
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}

