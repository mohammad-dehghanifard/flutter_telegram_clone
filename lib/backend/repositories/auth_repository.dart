import 'package:flutter_telegram_clone/backend/repositories/base_repository.dart';
import 'package:flutter_telegram_clone/backend/requests/login_request.dart';
import 'package:flutter_telegram_clone/backend/requests/register_request.dart';
import 'package:flutter_telegram_clone/helpers/widget/show_snack_bar.dart';

class AuthRepository extends BaseRepository {
  // Register Api
  Future<String?> registerApi({required RegisterRequest request}) async {
    final result = await dio.post("/auth/register",data: request.data());
    if(result.statusCode != 200) {
      showSnackBar(message: result.data['errors'][0], type: SnackBarType.error);
      return null;
    }
    showSnackBar(message: 'ثبت نام با موفقیت انجام شد!', type: SnackBarType.success);
    return result.data['token'];
  }
  // Login Api
  Future<String?> loginApi({required LoginRequest request}) async {
    final result = await dio.post("/auth/login",data: request.data());
    if(result.statusCode != 200) {
      showSnackBar(message: result.data['errors'][0], type: SnackBarType.error);
      return null;
    }
    showSnackBar(message: 'با موفقیت وارد شدید!', type: SnackBarType.success);
    return result.data['token'];
  }
}