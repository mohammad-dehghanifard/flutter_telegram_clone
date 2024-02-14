class Message {
  int? id;
  String? text;
  String? date;
  String? senderName;
  String? type;
  String? file;
  int? senderId;
  int? voiceDuration;
  String? senderAvatar;
  int? conversationId;
  bool? isSeen;

  Message(
      {this.id,
        this.text,
        this.date,
        this.senderName,
        this.type,
        this.file,
        this.senderId,
        this.isSeen,
        this.conversationId,
        this.senderAvatar});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    date = json['date'];
    senderName = json['senderName'];
    type = json['type'];
    file = json['file'];
    senderId = json['senderId'];
    isSeen = json['isSeen'];
    voiceDuration = json["voiceDuration"];
    conversationId = json['conversationId'];
    senderAvatar = json['senderAvatar'];
  }
}