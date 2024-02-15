import 'package:flutter_telegram_clone/backend/models/user.dart';

class UserResponse {
  List<User>? data;

  UserResponse({this.data});

  UserResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <User>[];
      json['data'].forEach((v) {
        data!.add(User.fromJson(v));
      });
    }
  }
}

