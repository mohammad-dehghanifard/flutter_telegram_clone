import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeTabBarWidget extends StatelessWidget {
  const HomeTabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (buildController) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.sizeOf(context).width,
          height: 50,
          child: Stack(
            children: [
              // divider
              Positioned(
                bottom: 1.5,
                left: 0,
                right: 0,
                child: Container(
                  height: 1,
                  color: context.theme.dividerColor,
                ),
              ),
              // items
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(buildController.tabs.length, (index) => TabBarItemWidget(
                  text: buildController.tabs[index],
                  active: buildController.currentTab == index,
                  onTap: () => buildController.changeTabBar(index),
                )),
              ),

          ],
        ),
        );
      }
    );
  }
}

class TabBarItemWidget extends StatelessWidget {
  const TabBarItemWidget({
    super.key, required this.text, required this.onTap, this.active = false,
  });
  final String text;
  final Function() onTap;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          const Spacer(),
          Text(text,style: context.textTheme.titleSmall),
          const Spacer(),
          // selected divider
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: active? 74 : 0,
            height: 4,
            decoration: BoxDecoration(
              color: context.theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(64)
            ),
          )
        ],
      ),
    );
  }
}
