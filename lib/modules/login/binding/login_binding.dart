import 'package:get/instance_manager.dart';
import 'package:mawdo333/modules/login/controller/login_controller.dart';
 
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
