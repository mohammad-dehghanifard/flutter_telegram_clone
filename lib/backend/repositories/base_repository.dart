import 'package:dio/dio.dart';
import 'package:flutter_telegram_clone/helpers/utils/user_helper.dart';

class BaseRepository {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://chat.hitaldev.ir/api/v1',
      validateStatus: (status) => status! < 500,
      contentType: 'application/json',
      headers: {
        if(userHelper.token != null)
        "Authorization" : "Bearer ${userHelper.token}"
      }
    )
  );
}