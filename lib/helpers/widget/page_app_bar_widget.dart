import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageAppBarWidget extends StatelessWidget {
  const PageAppBarWidget({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        if(title != null)
          Text(title!,style: context.textTheme.titleMedium),
        const Spacer(),
        const Directionality(textDirection: TextDirection.ltr, child: BackButton()),

      ],
    );
  }
}
