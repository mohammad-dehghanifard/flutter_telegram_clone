import 'dart:io';

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/backend/models/user.dart';
import 'package:flutter_telegram_clone/helpers/widget/input_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/page_app_bar_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/sized_widget.dart';
import 'package:flutter_telegram_clone/modules/chat/controllers/create_group_controller.dart';
import 'package:flutter_telegram_clone/modules/chat/widgets/user_contact_item_widget.dart';
import 'package:get/get.dart';

class CreateGroupPage extends StatelessWidget {
  const CreateGroupPage({super.key, required this.users});
  final List<User> users;
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CreateGroupController>(
      init: CreateGroupController(users),
      builder: (buildController) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: buildController.createGroup,
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
                GestureDetector(
                  onTap: () => buildController.selectImage(),
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.theme.colorScheme.secondaryContainer
                    ),
                    child: 
                    buildController.request.image == null? 
                    const Icon(FeatherIcons.camera,size: 32)
                    : ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                        child: Image.file(File(buildController.request.image!.path))),
                  ),
                ),

                // input group name and member count
                 Form(
                   key: buildController.formKey,
                   child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                         InputWidget(
                            controller: buildController.request.name,
                            validator: buildController.request.nameValidate,
                            hintText: "نام گروه را وارد کنید"),
                        const H(10),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("${users.length} عضو",style: context.textTheme.titleSmall))
                      ],
                    ),
                                   ),
                 ),

                // list
                Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 4),
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return  UserContactItem(user: users[index]);
                      },
                    )
                ),

              ],
            ),
          ),
        );
      }
    );
  }
}
