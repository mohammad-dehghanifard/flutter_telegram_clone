import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/backend/models/message.dart';
import 'package:flutter_telegram_clone/helpers/utils/load_network_image.dart';
import 'package:flutter_telegram_clone/helpers/utils/user_helper.dart';
import 'package:flutter_telegram_clone/helpers/utils/utils_method.dart';
import 'package:flutter_telegram_clone/helpers/widget/circle_icon_button_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/loading_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/sized_widget.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';


class VoiceMessageWidget extends StatefulWidget {
    const VoiceMessageWidget({super.key, required this.message});

  final Message message;

  @override
  State<VoiceMessageWidget> createState() => _VoiceMessageWidgetState();
}

class _VoiceMessageWidgetState extends State<VoiceMessageWidget> {

   final AudioPlayer player = AudioPlayer();
    Duration? duration;
    Duration? currentDuration;
    bool get isSendMessage => widget.message.senderId == userHelper.user!.id!;


   Future<void> initPlayer() async {
     duration = await player.setUrl(widget.message.file!);
     player.positionStream.listen((event) {
       currentDuration = event;
       if(currentDuration?.inSeconds == duration?.inSeconds){
         player.stop();
         player.seek(const Duration(seconds: 0));
        setState(() {});
       }
       setState(() {});
     });
   }

   void playAndStopVoice(){
     if(player.playing){
       player.pause();
     } else {
       player.play();
     }
   }

   void onChangeDuration(double value) => player.seek(Duration(seconds: (duration!.inSeconds * value).round()));


   @override
  void initState() {
     initPlayer();
    super.initState();
  }

   @override
  Widget build(BuildContext context) {
    return duration == null ? const LoadingWidget() :Align(
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
                // play button and slider
                Row(
                  children: [
                    CircleIconButtonWidget(
                      width: 35,
                      height: 35,
                      iconSize: 14,
                      bgColor: context.theme.colorScheme.primary,
                      icon: player.playing? FeatherIcons.pause : FeatherIcons.play,
                      iconColor: context.theme.scaffoldBackgroundColor,
                      onTap: () => playAndStopVoice(),
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
                              value: currentDuration!.inSeconds / duration!.inSeconds ,
                              onChanged: (value) => onChangeDuration(value),
                            ))),
                  ],
                ),
                // times
                Row(
                  children: [
                    const W(60),
                    Text(formatDuration(Duration(seconds: currentDuration!.inSeconds)),style: context.textTheme.bodySmall),
                    const Spacer(),
                    Text(formatDuration(Duration(seconds: duration!.inSeconds)),style: context.textTheme.bodySmall),
                    const W(40),
                  ],
                ),
                Text(widget.message.date ?? "",style: context.textTheme.bodySmall),
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
              child: LoadNetworkImage(imageUrl: widget.message.senderAvatar ?? ""),
            ),
          ]

        ],
      ),
    );

  }
}