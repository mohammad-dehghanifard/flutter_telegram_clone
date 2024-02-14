import 'package:flutter_telegram_clone/backend/models/conversation.dart';
import 'package:flutter_telegram_clone/backend/models/user.dart';
import 'package:flutter_telegram_clone/backend/repositories/base_repository.dart';
import 'package:flutter_telegram_clone/backend/response/conversation_response.dart';

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
}