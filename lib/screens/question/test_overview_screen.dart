import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studious_app/configs/themes/ui_paraments.dart';
import 'package:studious_app/widgets/common/main_button.dart';
import 'package:studious_app/widgets/content_arer.dart';

import '../../configs/themes/custom_text_style.dart';
import '../../controllers/question_paper/question_controller.dart';
import '../../widgets/common/background.dart';
import '../../widgets/questions/answer_card.dart';
import '../../widgets/questions/count_down_time.dart';
import '../../widgets/questions/custom_app_bar.dart';
import '../../widgets/questions/question_number_card.dart';

class TestOverviewScreen extends GetView<QuestionsController> {
  const TestOverviewScreen({Key? key}) : super(key: key);

  static const String routeName = '/testoverview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: controller.completedTest,
      ),
      body: BackgroundDecoration(
          child: Column(
        children: [
          Expanded(
              child: ContentArea(
                  child: Column(
            children: [
              Row(
                children: [
                  CountdownTimer(
                      color: UIParamenters.isDarkMode()
                          ? Theme.of(context).textTheme.bodyText1!.color
                          : Theme.of(context).primaryColor,
                      time: ''),
                  Obx(
                    () => Text(
                      '${controller.time} Remaining',
                      style: countDownTimerTs(),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.allQuestions.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: Get.width ~/ 75,
                      childAspectRatio: 1,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (_, index) {
                      AnswerStatus? answerStatus;
                      if (controller.allQuestions[index].selectedAnswer !=
                          null) {
                        answerStatus = AnswerStatus.answered;
                      }
                      return QuestionNumberCard(
                          index: index + 1,
                          status: answerStatus,
                          onTap: () => controller.jumbToQuestion(index));
                    }),
              ),
              ColoredBox(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Padding(
                    padding: UIParamenters.mobileScreenPadding,
                    child: MainButton(
                      onTap: () {
                        controller.complete();
                      },
                      title: "Complete",
                    )),
              )
            ],
          )))
        ],
      )),
    );
  }
}
