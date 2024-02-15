import 'package:dio/dio.dart';
import 'package:flutter_telegram_clone/helpers/utils/user_helper.dart';
import 'package:flutter_telegram_clone/helpers/widget/show_snack_bar.dart';

class BaseRepository {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://chat.hitaldev.ir/api/v1',
      validateStatus: (status) => status! < 500,
      headers: {
        if(userHelper.token != null)
        "Authorization" : "Bearer ${userHelper.token}"
      }
    )
  );

  bool validateResponse(Response response){
    if(response.statusCode == 200) {
      return true;
    }else {
      showSnackBar(message: response.data['errors'][0], type: SnackBarType.error);
      return false;
    }
  }
}