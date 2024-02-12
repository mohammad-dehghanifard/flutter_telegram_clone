import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
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
              ontap: () {},
              labelColor: Colors.white,
              icon: const Icon(FeatherIcons.user),
              labelBackgroundColor: context.theme.colorScheme.primaryContainer,
            ),
            HawkFabMenuItem(
              label: 'گروه جدید',
              labelColor: Colors.white,
              ontap: () {},
              icon: const Icon(FeatherIcons.user),
              labelBackgroundColor: context.theme.colorScheme.primaryContainer,
            ),
          ],
          body: Directionality(
              textDirection: TextDirection.rtl,
              child: body)
      ),
    );
  }
}