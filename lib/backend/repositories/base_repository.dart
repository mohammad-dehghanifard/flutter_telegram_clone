import 'package:dio/dio.dart';

class BaseRepository {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://chat.hitaldev.ir/api/v1',
      validateStatus: (status) => status! < 500,
      contentType: 'application/json'
    )
  );
}