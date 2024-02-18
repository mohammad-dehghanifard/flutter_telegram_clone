import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/helpers/theme/theme_manager.dart';
import 'package:flutter_telegram_clone/helpers/utils/load_network_image.dart';
import 'package:flutter_telegram_clone/helpers/utils/user_helper.dart';
import 'package:flutter_telegram_clone/helpers/widget/sized_widget.dart';
import 'package:flutter_telegram_clone/modules/chat/pages/send_new_message_page.dart';
import 'package:flutter_telegram_clone/modules/home/pages/edit_profile.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final List<_DrawerItem> items = [
      _DrawerItem(
        onTap: () => Get.to(const SendNewMessagePage(title: "پیام جدید",group: false)),
        title: 'ایجاد پیام جدید',
        icon: FeatherIcons.user,
      ),
      _DrawerItem(
        onTap: () => Get.to(const SendNewMessagePage(title: "اعضای گروه را انتخاب کنید",group: true)),
        title: 'ایجاد گروه جدید',
        icon: FeatherIcons.users,
      ),
      _DrawerItem(
        onTap: () => Get.to(const EditProfilePage()),
        title: 'ویرایش پروفایل',
        icon: FeatherIcons.edit3,
      ),
      _DrawerItem(
        onTap: () {},
        title: 'خروج از حساب',
        icon: FeatherIcons.logOut,
      ),
    ];

    return Drawer(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<UserHelper>(
          builder: (buildController) {
            return Column(
              children: [
                // change theme icon
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: ThemeManager.changeTheme,
                      icon: Icon(context.isDarkMode? FeatherIcons.sun :FeatherIcons.moon)),
                ),
                // avatar and user name
                Container(
                  width: 90,
                  height: 90,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle
                  ),
                  child: LoadNetworkImage(imageUrl: buildController.user?.avatar ?? ""),
                ),
                const H(8),
                Text(buildController.user?.name ?? "",style: context.textTheme.titleSmall),
                H(MediaQuery.sizeOf(context).height * 0.04),
                // items list
                Expanded(
                    child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) => _DrawerItem(
                            title: items[index].title,
                            onTap: items[index].onTap,
                            icon: items[index].icon
                        ),
                    )
                )

              ],
            );
          }
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({required this.title,required this.onTap,required this.icon});
  final String title;
  final Function() onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(bottom: 8,top: 12),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: context.theme.dividerColor))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Icon(icon)
          ],
        ),
      ),
    );
  }
}
