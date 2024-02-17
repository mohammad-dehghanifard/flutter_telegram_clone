import 'package:flutter_telegram_clone/backend/models/message.dart';

class MessageResponse {
  List<Message>? data;

  MessageResponse({this.data});

  MessageResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Message>[];
      json['data'].forEach((v) {
        data!.add(Message.fromJson(v));
      });
    }
  }

}