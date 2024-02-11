import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTabBarWidget extends StatelessWidget {
  const HomeTabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
            children: [
              // all
              TabBarItemWidget(
                onTap: () {},
                text: "همه پیام ها",
                active: true,
              ),
              // private
              TabBarItemWidget(
                onTap: () {},
                text: "خصوصی",
              ),
              // group
              TabBarItemWidget(
                onTap: () {},
                text: "گروه ها",
              ),
            ],
          )
      ],
    ),
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
    return Column(
      children: [
        const Spacer(),
        Text(text,style: context.textTheme.titleSmall),
        const Spacer(),
        // selected divider
        AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          width: active? 74 : 0,
          height: active? 4 : 0,
          decoration: BoxDecoration(
            color: active? context.theme.colorScheme.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(64)
          ),
        )
      ],
    );
  }
}
