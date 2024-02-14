import 'message.dart';

class Conversation {
  int? id;
  String? name;
  String? image;
  String? type;
  int? unreadCount;
  Message? lastMessage;

  Conversation(
      {this.id,
        this.name,
        this.image,
        this.type,
        this.unreadCount,
        this.lastMessage});

  Conversation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    type = json['type'];
    unreadCount = json['unreadCount'];
    lastMessage = json['lastMessage'] != null
        ? Message.fromJson(json['lastMessage'])
        : null;
  }
}