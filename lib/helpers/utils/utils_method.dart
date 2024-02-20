import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

bool validateIranPhoneNumber(String value) {
  const String pattern = r'^(\+98|0)?9\d{9}$';
  RegExp regExp = RegExp(pattern);
  if(regExp.hasMatch(value)){
    return true;
  }
  return false;
}

Future<void> saveToken(String value) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString("token", value);
}

Future<String?> getToken() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  final token = preferences.getString("token");
  if(token != null){
    return token;
  } else {
    return null;
  }
}

String convertFileToBase64(File file) {
  var bytes = file.readAsBytesSync();
  return base64Encode(bytes);
}

String generateRandomNumber(){
  final number = Random().nextInt(1000) * 90000;
  return number.toString();
}

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "$twoDigitMinutes:$twoDigitSeconds";
}