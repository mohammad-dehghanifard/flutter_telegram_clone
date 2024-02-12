import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/helpers/widget/input_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/page_app_bar_widget.dart';
import 'package:flutter_telegram_clone/modules/chat/widgets/user_contact_item_widget.dart';

class SendNewMessagePage extends StatelessWidget {
  const SendNewMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // app bar
            const PageAppBarWidget(title: "پیام جدید"),
            // search
            const Padding(
              padding: EdgeInsets.all(20),
              child: InputWidget(hintText: "جستجو کنید ...",icon: FeatherIcons.search,),
            ),
            Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const UserContactItem();
                    },
                )
            )
          ],
        ),
      ),
    );
  }
}


