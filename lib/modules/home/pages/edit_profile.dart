import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/helpers/widget/button_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/input_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/page_app_bar_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/sized_widget.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const PageAppBarWidget(title: 'ویرایش پروفایل'),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Image.asset(context.isDarkMode? "assets/images/logo_dark.png" :"assets/images/logo_light.png"),
                    H(MediaQuery.sizeOf(context).height * 0.03),
                    // full name
                    const InputWidget(hintText: "نام و نام خانوادگی"),
                    const H(15),
                    // password
                    const InputWidget(hintText: "رمز عبور",type: TextInputType.visiblePassword),
                    const H(15),
                    // repeat password
                    const InputWidget(hintText: "تکرار رمز عبور",type: TextInputType.visiblePassword),
                    const H(15),
                    // set image
                    const InputWidget(hintText: "انتخاب عکس پروفایل",isActive: false),
                    H(MediaQuery.sizeOf(context).height * 0.10),
                    // button
                    ButtonWidget(onPress: () {}, text: "ثبت نام")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
