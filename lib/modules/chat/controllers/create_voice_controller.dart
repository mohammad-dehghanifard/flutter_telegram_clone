import 'dart:async';

import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_telegram_clone/helpers/utils/base_controller.dart';
import 'package:flutter_telegram_clone/helpers/utils/utils_method.dart';
import 'package:flutter_telegram_clone/helpers/widget/show_snack_bar.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class CreateVoiceController extends BaseController {
//==================================== variables ===============================
  final FlutterSoundRecorder recorder = FlutterSoundRecorder();
  final AudioPlayer player = AudioPlayer();
  Duration? duration;
  int recordedTime = 0;
  Timer? timer;
  bool isRecordInit = false;
  bool isRecordFinish = false;
  String path = '';


//==================================== methods =================================

  Future<void> initRecorder() async {
  final status = await Permission.microphone.request();
  if(status != PermissionStatus.granted) {
    showSnackBar(message: "برای ارسال ویس برنامه باید به میکروفن دستگاه شما دسترسی داشته باشد!", type: SnackBarType.error);
    Get.back();
    return;
  }

  await recorder.openRecorder();
  isRecordInit = true;
  update();

}

  Future<void> getTempPath() async {
  final temp = await getTemporaryDirectory();
  path = "${temp.path}/${generateRandomNumber()}.aac";
}

  Future<void> record() async {
    await recorder.startRecorder(toFile: path,codec: Codec.aacADTS);
    startTimer();
    update();
  }

  Future<void> stopRecord() async {
    await recorder.stopRecorder();
    timer?.cancel();
    isRecordFinish = true;
    update();
  }

  Future<void> initVoiceFileForPlay(String filePath) async {
    duration = await player.setFilePath(path);
    update();
  }

  void startTimer(){
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      recordedTime++;
      update();
    });
  }



//==================================== life cycle ==============================

  @override
  void onInit() {
    getTempPath();
    initRecorder();
    super.onInit();
  }

  @override
  void onClose() {
    recorder.closeRecorder();
    super.onClose();
  }

}
