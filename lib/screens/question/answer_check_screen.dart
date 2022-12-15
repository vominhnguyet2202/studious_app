import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:studious_app/configs/themes/custom_text_style.dart';
import 'package:studious_app/controllers/question_paper/question_controller.dart';
import 'package:studious_app/models/question_paper_model.dart';
import 'package:studious_app/screens/question/result_screen.dart';
import 'package:studious_app/widgets/content_arer.dart';
import 'package:studious_app/widgets/questions/answer_card.dart';
import 'package:studious_app/widgets/questions/custom_app_bar.dart';

import '../../widgets/common/background.dart';

class AnswerCheckScreen extends GetView<QuestionsController> {
  const AnswerCheckScreen({super.key});
  static String routeName = "/answerscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        titleWidget: Obx(
          () => Text(
            "Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, "0")}",
            style: appBarTS,
          ),
        ),
        showActionIcon: true,
        onMenuActionTap: () {
          Get.toNamed(ResultScreen.routeName);
        },
      ),
      body: BackgroundDecoration(
          child: Obx(() => Column(
                children: [
                  Expanded(
                      child: ContentArea(
                          child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(children: [
                      Text(controller.currentQuestion.value!.question),
                      GetBuilder<QuestionsController>(
                          id: 'answer_review_list',
                          builder: (context) {
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller
                                  .currentQuestion.value!.answers.length,
                              itemBuilder: (context, index) {
                                final answer = controller
                                    .currentQuestion.value!.answers[index];
                                final selectedAnswer = controller
                                    .currentQuestion.value!.selectedAnswer;
                                final correctAnswer = controller
                                    .currentQuestion.value!.correctAnswer;
                                final String answerText =
                                    '${answer.identifier}. ${answer.answer}';
                                if (correctAnswer == selectedAnswer &&
                                    answer.identifier == selectedAnswer) {
                                  return CorrectAnswer(answer: answerText);
                                } else if (selectedAnswer == null) {
                                  return NotedAnswer(answer: answerText);
                                } else if (correctAnswer != selectedAnswer &&
                                    answer.identifier == selectedAnswer) {
                                  return WrongAnswer(answer: answerText);
                                } else if (correctAnswer == answer.identifier) {
                                  return CorrectAnswer(answer: answerText);
                                }
                                return AnswerCard(
                                  answer: answerText,
                                  onTap: () {},
                                  isSelected: false,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 10,
                                );
                              },
                            );
                          })
                    ]),
                  )))
                ],
              ))),
    );
  }
}
