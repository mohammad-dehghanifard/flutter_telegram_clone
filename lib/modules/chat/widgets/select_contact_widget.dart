import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/backend/models/user.dart';
import 'package:flutter_telegram_clone/helpers/widget/input_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/loading_widget.dart';
import 'package:flutter_telegram_clone/modules/chat/controllers/select_concat_controller.dart';
import 'package:get/get.dart';

import 'user_contact_item_widget.dart';

class SelectContactWidget extends StatelessWidget {
  const SelectContactWidget({
    this.isMultiple = false,
    super.key,
  });
  final bool isMultiple;
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
              Expanded(
                  child: buildController.users == null ? const LoadingWidget() : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    itemCount: buildController.users?.length,
                    itemBuilder: (context, index) {
                      final User user = buildController.users![index];
                      return UserContactItem(user: user,isGroup: isMultiple);
                    },
                  )
              ),
            ],
          );
        }
    );
  }
}
