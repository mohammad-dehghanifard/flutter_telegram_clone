import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/helpers/widget/button_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/input_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/sized_widget.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.primaryContainer,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              H(MediaQuery.sizeOf(context).height * 0.05),
              Image.asset(context.isDarkMode? "assets/images/logo_dark.png" :"assets/images/logo_light.png"),
              H(MediaQuery.sizeOf(context).height * 0.03),
              Text("ثبت نام",style: context.textTheme.titleLarge),
              H(MediaQuery.sizeOf(context).height * 0.02),
              // form
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 48),
                  decoration: BoxDecoration(
                    color: context.theme.scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(32),
                      topLeft: Radius.circular(32),
                    )
                  ),
                  child:  SingleChildScrollView(
                    child: Column(
                      children: [
                        // full name
                        const InputWidget(

                            hintText: "نام و نام خانوادگی",
                            icon: FeatherIcons.user),
                        const H(15),
                        // phone number
                        const InputWidget(hintText: "شماره موبایل",icon: FeatherIcons.smartphone,type: TextInputType.phone),
                        const H(15),
                        // password
                        const InputWidget(hintText: "رمز عبور",type: TextInputType.visiblePassword),
                        const H(15),
                        // repeat password
                        const InputWidget(hintText: "تکرار رمز عبور",type: TextInputType.visiblePassword),
                        const H(15),
                        // set image
                        const InputWidget(hintText: "انتخاب عکس پروفایل",icon: FeatherIcons.image,isActive: false),
                        H(MediaQuery.sizeOf(context).height * 0.05),
                        // button
                        ButtonWidget(onPress: () {}, text: "ثبت نام")
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
