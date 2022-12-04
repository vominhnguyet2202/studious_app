import 'package:get/get.dart';
import 'package:studious_app/controllers/auth_controller.dart';
import 'package:studious_app/controllers/theme_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
  }
}
