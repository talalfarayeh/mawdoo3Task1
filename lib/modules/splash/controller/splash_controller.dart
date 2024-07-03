import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mawdo333/modules/login/binding/login_binding.dart';
import 'package:mawdo333/modules/login/view/login_view.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  Future<void> onInit() async {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.forward();
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 5));
      correctPage();
    });
  }

  void correctPage() {
    Get.offAll(() => const LoginView(), binding: LoginBinding());
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
