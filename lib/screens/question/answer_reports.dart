import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studious_app/configs/themes/app_color.dart';
import 'package:studious_app/configs/themes/custom_text_style.dart';
import 'package:studious_app/configs/themes/ui_paraments.dart';
import 'package:studious_app/models/question_paper_model.dart';
import 'package:studious_app/widgets/content_arer.dart';
import 'package:studious_app/widgets/dialog/dialog_widget.dart';

class AnswersReport extends StatelessWidget {
  const AnswersReport({Key? key}) : super(key: key);
  static String routeName = "/answersReport";
  @override
  Widget build(BuildContext context) {
    var resulstMap = Get.arguments as Map<String, dynamic>;
    var usersAnswerMap = resulstMap["answersMap"] as Map<int, String>;
    var actualQuestionsAMap = resulstMap["usersAnswersMap"] as Map<int, String>;
    var paperModel = resulstMap["paperModel"] as QuestionPaperModel;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: mainGradient(),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(mobileScreenPadding - 20),
            child: Column(children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                      "${correctAnswers(usersAnswerMap, actualQuestionsAMap)} out of ${actualQuestionsAMap.keys.length} where correct",
                      style: const TextStyle(
                          color: onSurfaceTextColor,
                          fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                  child: ContentArea(
                      child: ListView.separated(
                padding: UIParamenters.mobileScreenPadding,
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {
                      var currentQuestion = paperModel.questions![index];
                      Get.dialog(Dialogs.correctAnswerDialog(
                        answer: currentQuestion.answers
                            .where((element) =>
                                element.identifier ==
                                currentQuestion.correctAnswer)
                            .first
                            .answer!,
                        question: currentQuestion.question,
                        onTap: () {
                          Get.back();
                        },
                      ));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(cardBorderRadius),
                          color: Theme.of(context).cardColor),
                      height: Get.width * 0.15,
                      width: Get.width * 0.85,
                      child: Center(
                          child: Row(
                        children: [
                          usersAnswerMap[index] == actualQuestionsAMap[index]
                              ? const Icon(
                                  Icons.check_circle,
                                  color: colorLightGreen,
                                  size: 30,
                                )
                              : const Icon(
                                  Icons.close_outlined,
                                  color: colorLightRed,
                                  size: 30,
                                ),
                          Text(
                            "Q${index + 1}. ${usersAnswerMap[index]} correctAnswer is ${actualQuestionsAMap[index]}",
                            style: headerText.copyWith(
                                color: customBlackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      )),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: usersAnswerMap.keys.length,
              )))
            ]),
          ),
        ),
      ),
    );
  }

  int correctAnswers(Map<int, String> usersAnswerMap, actualQuestionsAMap) {
    var correct = 0;
    for (var key in usersAnswerMap.keys) {
      if (usersAnswerMap[key] == actualQuestionsAMap[key]) {
        correct++;
      }
    }
    return correct;
  }

  Widget buildSuccessCard() {
    return Column(
      children: const [],
    );
  }
}
