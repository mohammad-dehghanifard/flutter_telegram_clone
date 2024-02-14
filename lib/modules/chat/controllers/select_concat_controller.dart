import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_telegram_clone/helpers/utils/base_controller.dart';

class SelectedConcatController extends BaseController {
//================================ variable ====================================
  List<Contact>? contacts;
//================================ methods =====================================
  Future<void> getContacts() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(withProperties: true);
      update();
    }
  }
//================================ life cycle ==================================
  @override
  void onInit() {
    getContacts();
    super.onInit();
  }
}