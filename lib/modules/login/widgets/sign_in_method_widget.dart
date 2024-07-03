import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mawdo333/modules/login/controller/login_controller.dart';
import 'package:mawdo333/utils/constant/app_colors.dart';
import 'package:mawdo333/utils/widgets/main_text.dart';

class SignInMethodWidget extends StatelessWidget {
  final LoginController controller;
  final Function()? onTap;
  final String title;
  final String icon;

  const SignInMethodWidget(
      {super.key,
      required this.controller,
      this.onTap,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 22, right: 22, bottom: 22),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: Get.width,
        height: 50,
        decoration: BoxDecoration(
            color: AppColors.grey.withOpacity(0.4),
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: AppColors.grey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(icon),
            MainText(text: title),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
