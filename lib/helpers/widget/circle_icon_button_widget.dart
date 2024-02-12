import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleIconButtonWidget extends StatelessWidget {
  const CircleIconButtonWidget({
    super.key, required this.icon, required this.onTap,
  });
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.theme.colorScheme.secondaryContainer
        ),
        child:  Icon(icon,size: 18),
      ),
    );
  }
}
