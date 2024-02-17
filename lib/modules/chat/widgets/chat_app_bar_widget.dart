import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/helpers/utils/load_network_image.dart';
import 'package:flutter_telegram_clone/helpers/widget/sized_widget.dart';
import 'package:get/get.dart';

class ChatAppBarWidget extends StatelessWidget {
  const ChatAppBarWidget({super.key, required this.title, required this.avatar});
  final String title;
  final String avatar;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      color: context.theme.scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 4),
      child: Row(
        children: [
          // avatar
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
                shape: BoxShape.circle
            ),
            child: LoadNetworkImage(imageUrl: avatar),
          ),
          const W(10),
          // user name
          Text(title,style: context.textTheme.titleMedium),
          const Spacer(),
          const Directionality(
              textDirection: TextDirection.ltr,
              child: BackButton())
        ],
      ),
    );
  }
}
