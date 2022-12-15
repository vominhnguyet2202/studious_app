import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:studious_app/configs/themes/app_color.dart';
import 'package:studious_app/configs/themes/app_icons.dart';
import 'package:studious_app/configs/themes/custom_text_style.dart';
import 'package:studious_app/configs/themes/ui_paraments.dart';
import 'package:studious_app/controllers/question_paper/question_paper_controller.dart';
import 'package:studious_app/controllers/zoom_drawer_controller.dart';
import 'package:studious_app/screens/home/menu_screen.dart';
import 'package:studious_app/screens/home/question_card.dart';
import 'package:studious_app/screens/speech/speech_screen.dart';
import 'package:studious_app/widgets/circle_button.dart';
import 'package:studious_app/widgets/content_arer.dart';

import '../chat/chat_screen.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    QuestionPaperController questionPaperController = Get.find();
    return Scaffold(body: GetBuilder<MyZoomDrawerController>(builder: (_) {
      return ZoomDrawer(
        controller: _.zoomDrawerController,
        showShadow: true,
        borderRadius: 50.0,
        angle: 0.0,
        style: DrawerStyle.DefaultStyle,
        slideWidth: MediaQuery.of(context).size.width * .6,
        menuScreen: const MenuScreen(),
        mainScreen: Container(
          decoration: BoxDecoration(gradient: mainGradient()),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(mobileScreenPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleButton(
                        onTap: controller.toogleDrawer,
                        child: const Icon(
                          AppIcons.menuleft,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            const Icon(
                              AppIcons.straight,
                            ),
                            Text(
                              "Hello Friend",
                              style: detailText.copyWith(
                                  color: onSurfaceTextColor),
                            ),
                            CircleButton(
                              child: const Icon(Icons.contact_support_outlined),
                              onTap: () => Get.toNamed(SpeechView.routeName),
                            )
                          ],
                        ),
                      ),
                      const Text(
                        "What do you want to learn today?",
                        style: headerText,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ContentArea(
                      addPadding: false,
                      child: Obx(() => ListView.separated(
                          padding: UIParamenters.mobileScreenPadding,
                          itemBuilder: (BuildContext context, index) {
                            return QuestionCard(
                              model: questionPaperController.allPapers[index],
                            );
                          },
                          separatorBuilder: (BuildContext context, index) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                          itemCount: questionPaperController.allPapers.length)),
                    ),
                  ),
                ),
                const BottomAppBar()
              ],
            ),
          ),
        ),
      );
    }));
  }
}
