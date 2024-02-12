import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/helpers/widget/page_app_bar_widget.dart';

class SendNewMessagePage extends StatelessWidget {
  const SendNewMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PageAppBarWidget(title: "پیام جدید",)
          ],
        ),
      ),
    );
  }
}
