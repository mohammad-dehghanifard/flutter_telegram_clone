import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/helpers/utils/utils_method.dart';
import 'package:flutter_telegram_clone/helpers/widget/circle_icon_button_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/sized_widget.dart';
import 'package:flutter_telegram_clone/modules/chat/controllers/create_voice_controller.dart';
import 'package:flutter_telegram_clone/modules/chat/widgets/preview_voice_widget.dart';
import 'package:get/get.dart';

class RecordViceBottomSheet extends StatelessWidget {
  const RecordViceBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CreateVoiceController(),
      builder: (buildController) {
        return buildController.isRecordFinish? PreViewVoiceWidget(filePath: buildController.path) :Padding(
          padding: const EdgeInsets.all(8.0),
          child : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // close button
              Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(onPressed: () => Get.back(), icon: const Icon(FeatherIcons.x))),
              CircleIconButtonWidget(
                width: 97,
                height: 97,
                iconSize: 50,
                bgColor: context.theme.colorScheme.primary,
                icon: buildController.recorder.isRecording? FeatherIcons.pause : FeatherIcons.mic,
                iconColor: context.theme.scaffoldBackgroundColor,
                onTap: () {
                  if(buildController.recorder.isRecording){
                    buildController.stopRecord();
                  } else {
                    buildController.record();
                  }
                }),
              const H(10),
              Text(formatDuration(Duration(seconds: buildController.recordedTime)),style: context.textTheme.titleLarge),
              const H(30),
            ],
          ),
        );
      }
    );
  }
}


