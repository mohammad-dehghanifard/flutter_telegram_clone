import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';

class HomeFabWidget extends StatefulWidget {
  const HomeFabWidget({Key? key, required this.body}) : super(key: key);
  final Widget body;
  @override
  State<HomeFabWidget> createState() => _HomeFabWidgetState();
}

class _HomeFabWidgetState extends State<HomeFabWidget> {
  HawkFabMenuController hawkFabMenuController = HawkFabMenuController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: HawkFabMenu(
          backgroundColor: Colors.transparent,
          blur: 0,
          closeIcon: Icons.cancel_outlined,
          openIcon: FeatherIcons.edit3,
          fabColor: context.theme.colorScheme.secondary,
          iconColor: Colors.white,
          hawkFabMenuController: hawkFabMenuController,
          items: [
            HawkFabMenuItem(
              label: 'پیام جدید',
              ontap: () {},
              icon: const Icon(FeatherIcons.user),
              labelBackgroundColor: context.theme.colorScheme.primaryContainer,
            ),
            HawkFabMenuItem(
              label: 'گروه جدید',
              ontap: () {},
              icon: const Icon(FeatherIcons.user),
              labelBackgroundColor: context.theme.colorScheme.primaryContainer,
            ),
          ],
          body: Directionality(
              textDirection: TextDirection.rtl,
              child: widget.body)
        ),
      ),
    );
  }
}