import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/helpers/widget/button_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/page_app_bar_widget.dart';
import 'package:flutter_telegram_clone/modules/chat/pages/create_group_page.dart';
import 'package:flutter_telegram_clone/modules/chat/widgets/select_contact_widget.dart';
import 'package:get/get.dart';

class SelectGroupMemberPage extends StatelessWidget {
  const SelectGroupMemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // app bar
            const PageAppBarWidget(title: "اعضای گروه را انتخاب کنید"),
            // search and list
            const Expanded(child: SelectContactWidget(isMultiple: true,)),
            // button
            Padding(
              padding: const EdgeInsets.all(20),
              child: ButtonWidget(
                  onPress: () => Get.to(const CreateGroupPage()),
                  text: 'ایجاد گروه'),
            )
          ],
        ),
      ),
    );
  }
}
