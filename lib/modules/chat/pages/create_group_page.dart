import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/helpers/widget/input_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/page_app_bar_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/sized_widget.dart';
import 'package:flutter_telegram_clone/modules/chat/widgets/user_contact_item_widget.dart';
import 'package:get/get.dart';

class CreateGroupPage extends StatelessWidget {
  const CreateGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: context.theme.colorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width * 2)
        ),
        child: const Directionality(
            textDirection: TextDirection.ltr,
            child: Icon(FeatherIcons.check)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: SafeArea(
        child: Column(
          children: [
            // app bar
            const PageAppBarWidget(),
            // set group image
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.theme.colorScheme.secondaryContainer
              ),
              child: const Icon(FeatherIcons.camera,size: 32),
            ),

            // input group name and member count
             Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const InputWidget(hintText: "نام گروه را وارد کنید"),
                  const H(10),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("4 عضو",style: context.textTheme.titleSmall))
                ],
              ),
            ),

            // list
            Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 4),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return const UserContactItem();
                  },
                )
            ),

          ],
        ),
      ),
    );
  }
}
