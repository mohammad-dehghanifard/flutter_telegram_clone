import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/backend/models/message.dart';
import 'package:flutter_telegram_clone/helpers/utils/load_network_image.dart';
import 'package:flutter_telegram_clone/helpers/utils/user_helper.dart';
import 'package:flutter_telegram_clone/helpers/widget/circle_icon_button_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/sized_widget.dart';
import 'package:get/get.dart';


class VoiceMessageWidget extends StatelessWidget {
  const VoiceMessageWidget({super.key, required this.message});

  final Message message;
  bool get isSendMessage => message.senderId == userHelper.user!.id!;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSendMessage? Alignment.centerRight :Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // message
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: const Radius.circular(12),
                topLeft: const Radius.circular(12),
                bottomRight: Radius.circular(!isSendMessage? 12 : 0),
                bottomLeft: Radius.circular(isSendMessage? 12 : 0),
              ),
              color: isSendMessage? context.theme.colorScheme.primaryContainer : context.theme.scaffoldBackgroundColor,
            ),
            constraints: const BoxConstraints(
                maxWidth: 260
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleIconButtonWidget(
                      width: 35,
                      height: 35,
                      iconSize: 14,
                      bgColor: context.theme.colorScheme.primary,
                      icon: FeatherIcons.play,
                      iconColor: context.theme.scaffoldBackgroundColor,
                      onTap: () {},
                    ),
                    Directionality(
                        textDirection: isSendMessage?TextDirection.rtl :TextDirection.ltr,
                        child: SliderTheme(
                            data: SliderThemeData(
                                trackHeight: 2.5,
                                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                                inactiveTrackColor: context.theme.scaffoldBackgroundColor,
                                activeTrackColor: context.theme.colorScheme.secondary),
                            child: Slider(
                              value: 0.6,
                              onChanged: (value) {},
                            ))),
                  ],
                ),
                Row(
                  children: [
                    const W(60),
                    Text("12:00",style: context.textTheme.bodySmall),
                    const Spacer(),
                    Text("00:00",style: context.textTheme.bodySmall),
                    const W(40),
                  ],
                ),
                Text(message.date ?? "",style: context.textTheme.bodySmall),
              ],
            ),
          ),
          // avatar
          if(!isSendMessage)...[
            const W(6),
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle
              ),
              child: LoadNetworkImage(imageUrl: message.senderAvatar ?? ""),
            ),
          ]

        ],
      ),
    );
  }
}