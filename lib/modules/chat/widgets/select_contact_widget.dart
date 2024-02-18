import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/backend/models/user.dart';
import 'package:flutter_telegram_clone/helpers/widget/button_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/input_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/loading_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/show_snack_bar.dart';
import 'package:flutter_telegram_clone/modules/chat/controllers/select_concat_controller.dart';
import 'package:get/get.dart';

import 'user_contact_item_widget.dart';

class SelectContactWidget extends StatelessWidget {
  const SelectContactWidget({
    this.isMultiple = false,
    this.onSelect,
    super.key,
    this.onMultiUserSelect,
  });
  final bool isMultiple;
  final Function(User user)? onSelect;
  final Function(List<User> users)? onMultiUserSelect;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectedConcatController>(
        init: SelectedConcatController(),
        builder: (buildController) {
          return Column(
            children: [
              // search
              const Padding(
                padding: EdgeInsets.all(20),
                child: InputWidget(hintText: "جستجو کنید ...",icon: FeatherIcons.search,),
              ),
              // user list
              Expanded(
                  child: buildController.users == null ? const LoadingWidget() : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    itemCount: buildController.users?.length,
                    itemBuilder: (context, index) {
                      final User user = buildController.users![index];
                      return GestureDetector(
                          onTap: () {
                            if(!isMultiple){
                              if(onSelect != null){
                                onSelect!(user);
                              }
                            } else {
                              buildController.addNewUserForGroup(user);
                            }
                          },
                          child: UserContactItem(
                            user: user,
                            isGroup: isMultiple,
                            selected: buildController.selectedUser.where((u) => u.id == user.id).isNotEmpty,
                          ));
                    },
                  )
              ),
              // button
              if(isMultiple)
              Padding(
                padding: const EdgeInsets.all(20),
                child: ButtonWidget(
                    onPress: () {
                      if(buildController.selectedUser.isEmpty) {
                        showSnackBar(message: "برای ایجاد گروه باید حداقل یک عضو را انتخاب کنید!", type: SnackBarType.error);
                      } else {
                        onMultiUserSelect!(buildController.selectedUser);
                      }
                    },
                    text: 'ایجاد گروه'),
              )
            ],
          );
        }
    );
  }
}
