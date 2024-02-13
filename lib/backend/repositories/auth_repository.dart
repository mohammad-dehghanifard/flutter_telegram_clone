import 'package:flutter_telegram_clone/backend/repositories/base_repository.dart';
import 'package:flutter_telegram_clone/backend/requests/register_request.dart';
import 'package:flutter_telegram_clone/helpers/widget/show_snack_bar.dart';

class AuthRepository extends BaseRepository {
  // Register Api
  Future<String?> registerApi({required RegisterRequest request}) async {
    final result = await dio.post("/auth/register",data: request.sendData());
    if(result.statusCode != 200) {
      showSnackBar(message: result.data['errors'][0], type: SnackBarType.error);
      return null;
    }
    print(result);
    showSnackBar(message: 'ثبت نام با موفقیت انجام شد!', type: SnackBarType.success);
    return result.data['token'];
  }
}