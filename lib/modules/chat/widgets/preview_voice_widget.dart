import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/helpers/widget/circle_icon_button_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/sized_widget.dart';
import 'package:flutter_telegram_clone/modules/chat/controllers/create_voice_controller.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class PreViewVoiceWidget extends StatefulWidget {
  const PreViewVoiceWidget({super.key, required this.filePath});
  final String filePath;

  @override
  State<PreViewVoiceWidget> createState() => _PreViewVoiceWidgetState();

}

class _PreViewVoiceWidgetState extends State<PreViewVoiceWidget> {



  @override
  void initState() {
    Get.find<CreateVoiceController>().initVoiceFileForPlay(widget.filePath);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<CreateVoiceController>(
          builder: (buildController) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // slider
                Directionality(
                    textDirection: TextDirection.ltr,
                    child: SliderTheme(
                        data: SliderThemeData(
                            trackHeight: 7,
                            inactiveTrackColor: context.theme.colorScheme.primaryContainer,
                            activeTrackColor: context.theme.colorScheme.secondary
                        ),
                        child: Slider(value: 0.4, onChanged: (value) {},))),
                // time
                Row(
                  children: [
                    const W(25),
                    Text("۰۰:۴۲",style: context.textTheme.bodySmall),
                    const Spacer(),
                    Text("01:43",style: context.textTheme.bodySmall),
                    const W(25),
                  ],
                ),
                // play button
                CircleIconButtonWidget(
                  width: 43,
                  height: 43,
                  iconSize: 14,
                  bgColor: context.theme.colorScheme.primary,
                  icon: FeatherIcons.play,
                  iconColor: context.theme.scaffoldBackgroundColor,
                  onTap: ()  => buildController.player.play()),
                // send and cancel button
                Row(
                  children: [
                    const W(25),
                    // send
                    CircleIconButtonWidget(
                      width: 43,
                      height: 43,
                      iconSize: 14,
                      bgColor: context.theme.colorScheme.primary,
                      icon: FeatherIcons.send,
                      iconColor: context.theme.scaffoldBackgroundColor,
                      onTap: () {},),
                    const Spacer(),
                    // cancel
                    CircleIconButtonWidget(
                        width: 43,
                        height: 43,
                        iconSize: 14,
                        bgColor: context.theme.colorScheme.primary,
                        icon: FeatherIcons.x,
                        iconColor: context.theme.scaffoldBackgroundColor,
                        onTap: () => Get.back()),
                    const W(25),

                  ],
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
