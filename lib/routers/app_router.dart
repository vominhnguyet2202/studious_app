import 'package:get/get.dart';
import 'package:studious_app/controllers/question_paper/question_paper_controller.dart';
import 'package:studious_app/controllers/zoom_drawer_controller.dart';
import 'package:studious_app/screens/chat/chat_screen.dart';
import 'package:studious_app/screens/home/home_screen.dart';
import 'package:studious_app/screens/introduction/introduction.dart';
import 'package:studious_app/screens/login/login_screen.dart';
import 'package:studious_app/screens/question/answer_check_screen.dart';
import 'package:studious_app/screens/question/answer_reports.dart';
import 'package:studious_app/screens/question/questions_screen.dart';
import 'package:studious_app/screens/question/result_screen.dart';
import 'package:studious_app/screens/speech/speech_screen.dart';
import 'package:studious_app/screens/splash/splash_screen.dart';
import 'package:studious_app/widgets/tabbar/bottom_tab_bar.dart';

import '../controllers/question_paper/question_controller.dart';
import '../controllers/speech_controller.dart';
import '../screens/question/test_overview_screen.dart';

class AppRouters {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(name: "/introduction", page: () => const IntroductionScreen()),
        GetPage(
            name: "/home",
            page: () => HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
              Get.put(MyZoomDrawerController());
            })),
        GetPage(name: LoginScreen.routerName, page: () => const LoginScreen()),
        GetPage(
            name: QuestionScreen.routeName,
            binding: BindingsBuilder(() {
              Get.put(QuestionsController());
            }),
            page: () =>
                const QuestionScreen()), // Bindings to be able to hook into the controller that we wrapped over this widget // Maybe l am using the wrong terminology
        GetPage(
            name: AnswersReport.routeName, page: () => const AnswersReport()),
        GetPage(
            name: TestOverviewScreen.routeName,
            page: () => const TestOverviewScreen()),
        GetPage(name: ChatScreen.routeName, page: () => ChatScreen()),
        GetPage(name: "/tabbar", page: () => BottomAppBar()),
        GetPage(
          name: SpeechView.routeName,
          page: () => const SpeechView(),
          binding: BindingsBuilder(() {
            Get.put(SpeechController());
          }),
        ),
        GetPage(name: ResultScreen.routeName, page: () => const ResultScreen()),
        GetPage(
            name: AnswerCheckScreen.routeName,
            page: () => const AnswerCheckScreen())
      ];
}
