import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.onPress,
      required this.text,
      this.primary = true,
      this.width = double.infinity,
      this.height = 47,
      this.radius = 12,
      });
  final Function() onPress;
  final String text;
  final bool primary;
  final double width;
  final double height;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPress,
        minWidth: width,
        height: height,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius)
        ),
        color: primary? context.theme.colorScheme.primary : context.theme.colorScheme.secondary,
        child: Text(text,style: context.textTheme.titleMedium!.apply(color: Colors.white)),
    );
  }
}
