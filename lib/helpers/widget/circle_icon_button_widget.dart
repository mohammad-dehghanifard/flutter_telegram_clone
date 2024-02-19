import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleIconButtonWidget extends StatelessWidget {
  const CircleIconButtonWidget({
    super.key,
    required this.icon,
    required this.onTap,
    this.width = 38,
    this.height = 38,
    this.iconSize = 18,
    this.bgColor,
    this.iconColor
  });
  final IconData icon;
  final Function() onTap;
  final double width;
  final double height;
  final double iconSize;
  final Color? bgColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: bgColor ?? context.theme.colorScheme.secondaryContainer
        ),
        child:  Directionality(
          textDirection: TextDirection.ltr,
            child: Icon(icon,size: iconSize,color: iconColor)),
      ),
    );
  }
}
