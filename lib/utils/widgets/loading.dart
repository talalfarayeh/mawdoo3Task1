import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:mawdo333/utils/constant/app_colors.dart';
 
class Loading extends StatelessWidget {
  final AppLoadingController appLoading;
  const Loading({super.key, required this.appLoading});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => appLoading.isLoading.value
          ? AbsorbPointer(
              child: Center(
                child: Container(
                  width: Get.width / 5,
                  height: Get.width / 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.black.withOpacity(0.85),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.16),
                          blurRadius: 10,
                          spreadRadius: 0.5,
                          offset: const Offset(0, 3),
                        )
                      ]),
                  child: Stack(
                    children: [Center(child: appLoading.loadingWidget)],
                  ),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}

class AppLoadingController {
  RxBool isLoading = false.obs;
  var loadingWidget = const SpinKitFadingCircle(
    color: AppColors.primary,
    size: 40.0,
  );

  void loading() {
    isLoading.value = true;
  }

  void stop() {
    isLoading.value = false;
  }
}
