import 'package:get/get.dart';
import 'package:studious_app/controllers/question_paper/question_paper_controller.dart';
import 'package:studious_app/screens/home/home_screen.dart';
import 'package:studious_app/screens/introduction/introduction.dart';
import 'package:studious_app/screens/splash/splash_screen.dart';

class AppRouters {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(name: "/introduction", page: () => const IntroductionScreen()),
        GetPage(
          name: "/home",
          page: () => const HomeScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(QuestionPaperController());
            },
          ),
        ),
      ];
}
