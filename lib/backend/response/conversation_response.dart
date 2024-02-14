import 'package:flutter_telegram_clone/backend/models/conversation.dart';

class ConversationResponse {
  List<Conversation>? data;

  ConversationResponse({this.data});

  ConversationResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(Conversation.fromJson(v));
      });
    }
  }
}




