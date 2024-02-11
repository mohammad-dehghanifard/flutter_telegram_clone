import 'package:flutter/material.dart';

class H extends StatelessWidget {
  const H(this.height,{super.key});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class W extends StatelessWidget {
  const W(this.width,{super.key});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}

