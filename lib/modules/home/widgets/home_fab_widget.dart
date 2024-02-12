import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/modules/chat/pages/send_new_message_page.dart';
import 'package:get/get.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';

class HomeFabWidget extends StatelessWidget {
   const HomeFabWidget({Key? key, required this.body}) : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: HawkFabMenu(
          backgroundColor: Colors.transparent,
          blur: 0,
          closeIcon: Icons.cancel_outlined,
          openIcon: FeatherIcons.edit3,
          fabColor: context.theme.colorScheme.secondary,
          iconColor: Colors.white,
          items: [
            HawkFabMenuItem(
              label: 'پیام جدید',
              ontap: () => Get.to(const SendNewMessagePage()),
              labelColor: Colors.black,
              color: const Color(0xFF702DFF),
              icon: const Icon(FeatherIcons.user),
              labelBackgroundColor: const Color(0xFFDAF2FF),
            ),
            HawkFabMenuItem(
              label: 'گروه جدید',
              labelColor: Colors.black,
              ontap: () {},
              icon: const Icon(FeatherIcons.users),
              color: const Color(0xFF702DFF),
              labelBackgroundColor: const Color(0xFFDAF2FF),
            ),
          ],
          body: Directionality(
              textDirection: TextDirection.rtl,
              child: body)
      ),
    );
  }
}