import 'package:flutter_telegram_clone/backend/models/conversation.dart';
import 'package:flutter_telegram_clone/backend/models/message.dart';
import 'package:flutter_telegram_clone/backend/models/user.dart';
import 'package:flutter_telegram_clone/backend/repositories/base_repository.dart';
import 'package:flutter_telegram_clone/backend/requests/conversation_request.dart';
import 'package:flutter_telegram_clone/backend/response/conversation_response.dart';
import 'package:flutter_telegram_clone/backend/response/message_response.dart';
import 'package:flutter_telegram_clone/backend/response/user_response.dart';

class ChatRepository extends BaseRepository {
  // Get user Info Api
  Future<User?> getUserInfoApi() async {
    final response = await dio.get('/auth/profile');
    validateResponse(response);
    return User.fromJson(response.data['user']);
  }
  // Get conversation Api
  Future<List<Conversation>> getAllConversationApi() async {
    final response = await dio.get('/conversations');
    validateResponse(response);
    return ConversationResponse.fromJson(response.data).data ?? [];
  }
  // Get all User by Contacts
  Future<List<User>> getAllUserByContactsApi({required List<String> mobiles}) async {
    final response = await dio.post('/contacts',data: {'mobiles':mobiles});
    validateResponse(response);
    return UserResponse.fromJson(response.data).data ?? [];
  }
  // Get conversation all message
  Future<List<Message>> getAllMessageApi({required int id}) async {
    final response = await dio.get("/conversation/$id/messages");
    validateResponse(response);
    return MessageResponse.fromJson(response.data).data ?? [];
  }
  // Create Conversation
  Future<Conversation> createConversationApi({required ConversationRequest request}) async {
    final data = await request.data();
    final response = await dio.post("/create/conversation",data: data);
    validateResponse(response);
    return Conversation.fromJson(response.data["conversation"]);
  }
}