import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/helpers/widget/circle_icon_button_widget.dart';
import 'package:get/get.dart';

class ChatSendBoxWidget extends StatelessWidget {
  const ChatSendBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 100,
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
      ),
      child: Row(
        children: [
          // send voice
          CircleIconButtonWidget(onTap: () {},icon: FeatherIcons.mic),
          // send file
          CircleIconButtonWidget(onTap: () {},icon: FeatherIcons.filePlus),
          // send message
          CircleIconButtonWidget(onTap: () {},icon: FeatherIcons.send),

        ],
      ),
    );
  }
}

