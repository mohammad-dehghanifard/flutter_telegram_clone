import 'package:flutter_telegram_clone/backend/models/user.dart';
import 'package:flutter_telegram_clone/backend/repositories/base_repository.dart';

class ChatRepository extends BaseRepository {
  // Get user Info Api
  Future<User?> getUserInfoApi() async {
    final response = await dio.get('/auth/profile');
    validateResponse(response);
    return User.fromJson(response.data['user']);
  }
}