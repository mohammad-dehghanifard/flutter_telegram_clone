import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_clone/helpers/widget/button_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/input_widget.dart';
import 'package:flutter_telegram_clone/helpers/widget/sized_widget.dart';
import 'package:flutter_telegram_clone/modules/auth/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              Text("ورود",style: context.textTheme.titleLarge),
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
                    child: GetBuilder<LoginController>(
                      init: LoginController(),
                      builder: (buildController) {
                        return Form(
                          key: buildController.formKey,
                          child: Column(
                            children: [
                              // phone number
                              InputWidget(
                                  controller: buildController.request.mobileController,
                                  validator: buildController.request.mobileValidate,
                                  hintText: "شماره موبایل",
                                  icon: FeatherIcons.smartphone,
                                  type: TextInputType.phone),
                              const H(15),
                              // password
                              InputWidget(
                                  controller: buildController.request.passwordController,
                                  validator: buildController.request.passWordValidate,
                                  hintText: "رمز عبور",
                                  type: TextInputType.visiblePassword),
                              H(MediaQuery.sizeOf(context).height * 0.05),
                              // button
                              ButtonWidget(
                                  onPress: buildController.login,
                                  loading: buildController.loading,
                                  text: "ثبت نام")
                            ],
                          ),
                        );
                      }
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
