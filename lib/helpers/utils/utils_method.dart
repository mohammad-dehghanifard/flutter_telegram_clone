import 'dart:convert';
import 'dart:io';
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