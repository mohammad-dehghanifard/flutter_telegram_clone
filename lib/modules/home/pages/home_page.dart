import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/modules/home/controllers/home_controller.dart';
import 'package:flutter_telegram_clone/modules/home/widgets/drawer_widget.dart';
import 'package:flutter_telegram_clone/modules/home/widgets/home_app_bar.dart';
import 'package:flutter_telegram_clone/modules/home/widgets/home_chat_list.dart';
import 'package:flutter_telegram_clone/modules/home/widgets/home_fab_widget.dart';
import 'package:flutter_telegram_clone/modules/home/widgets/home_tab_bar_widget.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (buildController) {
        return const Scaffold(
          drawer: DrawerWidget(),
          body: HomeFabWidget(
            body: SafeArea(
              child: Column(
                children: [
                  // app bar
                  HomeAppBarWidget(),
                  // tab bar
                  HomeTabBarWidget(),
                  // chat list
                  Expanded(child: HomeChatList()),
                ],
              ),
            ),
          )
        );
      }
    );
  }
}
