import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/modules/home/widgets/home_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeAppBarWidget()
          ],
        ),
      ),
    );
  }
}
