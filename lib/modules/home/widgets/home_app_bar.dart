import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(FeatherIcons.menu),
          Image.asset(
            context.isDarkMode
                ? "assets/images/lgoo_horiz_dark.png"
                : "assets/images/logo_horiz_light.png",
            scale: 2,
          ),
          const Icon(FeatherIcons.search),
        ],
      ),
    );
  }
}
