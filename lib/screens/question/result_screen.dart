import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studious_app/configs/themes/custom_text_style.dart';
import 'package:studious_app/configs/themes/ui_paraments.dart';
import 'package:studious_app/controllers/question_paper/extension_controller.dart';
import 'package:studious_app/controllers/question_paper/question_controller.dart';
import 'package:studious_app/screens/question/answer_check_screen.dart';
import 'package:studious_app/widgets/common/background.dart';
import 'package:studious_app/widgets/common/main_button.dart';
import 'package:studious_app/widgets/content_arer.dart';
import 'package:studious_app/widgets/questions/answer_card.dart';
import 'package:studious_app/widgets/questions/custom_app_bar.dart';
import 'package:studious_app/widgets/questions/question_number_card.dart';

class ResultScreen extends GetView<QuestionsController> {
  const ResultScreen({super.key});
  static const String routeName = "/resultscreen";
  @override
  Widget build(BuildContext context) {
    Color textColor =
        Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          leading: const SizedBox(height: 80),
          title: controller.correctAnsweredQuestions,
        ),
        body: BackgroundDecoration(
          child: Column(
            children: [
              Expanded(
                  child: ContentArea(
                child: Column(
                  children: [
                    SvgPicture.asset("assets/images/bulb.svg"),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 5),
                      child: Text(
                        "Congratulations!",
                        style: headerText.copyWith(color: textColor),
                      ),
                    ),
                    Text(
                      "You have ${controller.points} point",
                      style: TextStyle(color: textColor),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Tap below question numbers to view  correct answers",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Expanded(
                        child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: controller.allQuestions.length,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: Get.width ~/ 75,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8),
                            itemBuilder: (context, index) {
                              final _question = controller.allQuestions[index];
                              AnswerStatus status = AnswerStatus.notanswered;
                              final selectAnswer = _question.selectedAnswer;
                              final correctAnswer = _question.correctAnswer;
                              if (selectAnswer == correctAnswer) {
                                status = AnswerStatus.correct;
                              } else if (_question.selectedAnswer == null) {
                                status = AnswerStatus.wrong;
                              } else {
                                status = AnswerStatus.wrong;
                              }
                              return QuestionNumberCard(
                                  index: index + 1,
                                  status: status,
                                  onTap: () {
                                    controller.jumbToQuestion(index,
                                        isGoBack: false);
                                    Get.toNamed(AnswerCheckScreen.routeName);
                                  });
                            }))
                  ],
                ),
              )),
              ColoredBox(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Padding(
                  padding: UIParamenters.mobileScreenPadding,
                  child: Row(
                    children: [
                      Expanded(
                        child: MainButton(
                          onTap: () {
                            controller.tryAgain();
                          },
                          color: Colors.blueAccent,
                          title: "Try again!",
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: MainButton(
                          onTap: () {
                            controller.saveTestResult();
                          },
                          title: "Go home",
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
