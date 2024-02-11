import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/helpers/widget/button_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/sized_widget.dart';
import 'package:flutter_telegram_clone/modules/auth/pages/login_page.dart';
import 'package:flutter_telegram_clone/modules/auth/pages/register_page.dart';
import 'package:flutter_telegram_clone/modules/home/pages/home_page.dart';
import 'package:get/get.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(context.isDarkMode? "assets/images/logo_dark.png" :"assets/images/logo_light.png"),
            H(MediaQuery.sizeOf(context).height * 0.20),
            // buttons
            ButtonWidget(onPress: () => Get.to(const HomePage()), text: "ثبت نام",primary: false),
            const H(15),
            ButtonWidget(onPress: () => Get.to(const LoginPage()), text: "ورود"),
            H(MediaQuery.sizeOf(context).height * 0.04),
          ],
        ),
      ),
    );
  }
}
