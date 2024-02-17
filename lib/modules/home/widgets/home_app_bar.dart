import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key, this.onSearchTab});
  final Function()? onSearchTab;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: const Icon(FeatherIcons.menu)),
          Image.asset(
            context.isDarkMode
                ? "assets/images/lgoo_horiz_dark.png"
                : "assets/images/logo_horiz_light.png",
            scale: 2,
          ),
          GestureDetector(
            onTap: onSearchTab,
            child: AnimatedCrossFade(
                firstChild: const Icon(FeatherIcons.search),
                secondChild: const Icon(FeatherIcons.x),
                crossFadeState:Get.find<HomeController>().isSearch? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 200)),
          ),
        ],
      ),
    );
  }
}
