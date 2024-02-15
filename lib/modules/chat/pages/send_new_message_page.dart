import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/helpers/widget/page_app_bar_widget.dart';
import 'package:flutter_telegram_clone/modules/chat/widgets/select_contact_widget.dart';


class SendNewMessagePage extends StatelessWidget {
  const SendNewMessagePage({super.key});
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // app bar
            PageAppBarWidget(title: "پیام جدید"),
            Expanded(child: SelectContactWidget())
          ],
        )
      ),
    );
  }
}



