import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studious_app/bindings/intinal_binding.dart';
import 'package:studious_app/controllers/theme_controller.dart';
import 'package:studious_app/routers/app_router.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(GetMaterialApp(
//     home: DataUploaderScreen(),
//   )
//
//       );
// }

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.find<ThemeController>().lightTheme,
      getPages: AppRouters.routes(),
    );
  }
}
