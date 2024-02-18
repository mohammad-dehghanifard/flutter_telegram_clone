import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_telegram_clone/backend/models/user.dart';
import 'package:flutter_telegram_clone/backend/repositories/chat_repository.dart';
import 'package:flutter_telegram_clone/helpers/utils/base_controller.dart';

class SelectedConcatController extends BaseController {
//================================ variable ====================================
  final ChatRepository _repository = ChatRepository();
  List<Contact>? contacts;
  List<User>? users;
  List<User> selectedUser = []; // for create group
//================================ methods =====================================
  Future<void> getContacts() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(withProperties: true);
      final mobiles = contacts?.map((e) => e.phones.first.number).toList();
      final result = await _repository.getAllUserByContactsApi(mobiles: mobiles ?? []);
      users = result;
      update();
    }
  }

  void addNewUserForGroup(User user){
    if(!selectedUser.contains(user)){
      selectedUser.add(user);
      update();
    } else {
      selectedUser.removeWhere((u) => u.id == user.id);
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