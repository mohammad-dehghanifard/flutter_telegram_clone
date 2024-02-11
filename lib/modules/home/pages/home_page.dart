import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/modules/home/widgets/home_app_bar.dart';
import 'package:flutter_telegram_clone/modules/home/widgets/home_chat_list.dart';
import 'package:flutter_telegram_clone/modules/home/widgets/home_tab_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // app bar
            HomeAppBarWidget(),
            // tab bar
            HomeTabBarWidget(),
            // chat list
            Expanded(child: HomeChatList())
          ],
        ),
      ),
    );
  }
}
