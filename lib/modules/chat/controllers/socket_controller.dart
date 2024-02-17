import 'package:flutter_telegram_clone/helpers/utils/base_controller.dart';
import 'package:flutter_telegram_clone/helpers/utils/constants.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketController extends BaseController {
//====================== variables =============================================
 late Socket socket;

//====================== methods ===============================================
  void _initSocket() {
   socket = io(socketUrl,OptionBuilder().setTransports(['websocket']).build());
   socket.onConnect((_) {
   });
  }
  
  void joinConversation(int id) => socket.emit("joinConversation",id);

//======================== life cycle ==========================================
 @override
  void onInit() {
    _initSocket();
    super.onInit();
  }

}