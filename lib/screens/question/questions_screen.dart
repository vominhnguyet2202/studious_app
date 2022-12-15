import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studious_app/configs/themes/app_color.dart';
import 'package:studious_app/configs/themes/ui_paraments.dart';
import 'package:studious_app/controllers/question_paper/question_controller.dart';
import 'package:studious_app/firebase_ref/loading_status.dart';
import 'package:studious_app/widgets/common/background.dart';
import 'package:studious_app/widgets/common/main_button.dart';
import 'package:studious_app/widgets/common/question_place_holder.dart';
import 'package:studious_app/widgets/content_arer.dart';

import '../../configs/themes/custom_text_style.dart';
import '../../widgets/questions/answer_card.dart';
import '../../widgets/questions/count_down_time.dart';
import '../../widgets/questions/custom_app_bar.dart';
import 'test_overview_screen.dart';

class QuestionScreen extends GetView<QuestionsController> {
  // lets our view know about the controller
  const QuestionScreen({Key? key}) : super(key: key);
  static const String routeName = "/questionsscreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true, // nice touch
        appBar: CustomAppBar(
          leading: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: const ShapeDecoration(
                shape: StadiumBorder(
                    side: BorderSide(color: onSurfaceTextColor, width: 2))),
            child: Obx(() => CountdownTimer(
                  time: controller.time.value,
                  color: onSurfaceTextColor,
                )),
          ),
          showActionIcon: true,
          titleWidget: Obx(() => Text(
                "Q.${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}",
                style: appBarTS,
              )),
        ),
        body: BackgroundDecoration(
          child: Obx(
            (() => Column(
                  children: [
                    if (controller.loadingStatus.value == LoadingStatus.loading)
                      const Expanded(
                          child: ContentArea(child: QuestionScreenHolder())),
                    if (controller.loadingStatus.value ==
                        LoadingStatus.complete)
                      Expanded(
                        child: ContentArea(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.only(top: 25),
                            child: Column(
                              children: [
                                Text(
                                  controller.currentQuestion.value!.question,
                                  style: questionTS,
                                ),
                                GetBuilder<QuestionsController>(
                                  // Specify what type of controller is being reacted to, so we can hook into its state and underlying methods
                                  id: "answers_list",
                                  builder: (controller) {
                                    return ListView.separated(
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.only(top: 25),
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: ((context, index) {
                                        final answer = controller
                                            .currentQuestion
                                            .value!
                                            .answers[index];
                                        return AnswerCard(
                                          isSelected: answer.identifier ==
                                              controller.currentQuestion.value!
                                                  .selectedAnswer,
                                          answer:
                                              "${answer.identifier}. ${answer.answer}",
                                          onTap: () {
                                            controller.selectedAnswer(
                                                answer.identifier);
                                          },
                                        );
                                      }),
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                        height: 10,
                                      ),
                                      itemCount: controller.currentQuestion
                                          .value!.answers.length,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ColoredBox(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Padding(
                        padding: UIParamenters.mobileScreenPadding,
                        child: Row(
                          children: [
                            Visibility(
                                visible: controller.isFirstQuestion,
                                child: SizedBox(
                                  width: 55,
                                  height: 55,
                                  child: MainButton(
                                    onTap: () {
                                      controller.prevQuestion();
                                    },
                                    child: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Get.isDarkMode
                                          ? onSurfaceTextColor
                                          : Theme.of(context).primaryColor,
                                    ),
                                  ),
                                )),
                            Expanded(
                              child: Visibility(
                                  visible: controller.loadingStatus.value ==
                                      LoadingStatus.complete,
                                  child: MainButton(
                                    onTap: () {
                                      controller.isLastQuestion
                                          ? Get.toNamed(
                                              TestOverviewScreen.routeName)
                                          : controller.nextQuestion();
                                    },
                                    title: controller.isLastQuestion
                                        ? 'Complete'
                                        : 'Next',
                                  )),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ));
  }
}
