import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/helpers/widget/input_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/loading_widget.dart';
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
          return Scaffold(
              drawer: const DrawerWidget(),
              body: HomeFabWidget(
                body: SafeArea(
                  child: Column(
                    children: [
                      // app bar
                      HomeAppBarWidget(onSearchTab: () => buildController.changeSearchState()),
                      // search bar
                      AnimatedCrossFade(
                          firstChild: Container(),
                          secondChild:  Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: InputWidget(
                                hintText: "جست و جو کنید....",
                                controller: buildController.searchController,
                                onChange: buildController.searchResult,
                            ),
                          ),
                          crossFadeState: buildController.isSearch? CrossFadeState.showSecond : CrossFadeState.showFirst,
                          duration: const Duration(milliseconds: 300)),
                      // tab bar
                      const HomeTabBarWidget(),
                      // chat list
                      Expanded(
                          child: buildController.conversationList == null
                              ? const LoadingWidget()
                              : HomeChatList(chats: buildController.conversationList!)),
                    ],
                  ),
                ),
              ));
        });
  }
}
