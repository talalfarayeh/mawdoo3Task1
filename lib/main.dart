import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mawdo333/modules/splash/binding/splash_binding.dart';
import 'package:mawdo333/modules/splash/view/splash_view.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'title'.tr,
      home: const SplashView(),
      initialBinding: SplashBinding(),
    );
  }
}
