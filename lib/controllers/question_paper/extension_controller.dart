import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:studious_app/controllers/question_paper/question_controller.dart';

import '../../firebase_ref/refrences.dart';
import '../auth_controller.dart';

extension QuestionControllerExtension on QuestionsController {
  int get correctQuestionCount => allQuestions
      .where((element) => element.selectedAnswer == element)
      .toList()
      .length;

  String get correctAnsweredQuestions {
    return '$correctQuestionCount out of ${allQuestions.length} are correct';
  }

  String get points {
    var ponts = (correctQuestionCount / allQuestions.length) *
        100 *
        (questionPaperModel.timeSeconds - remainingSeconds) /
        questionPaperModel.timeSeconds *
        100;
    return points.toString();
  }

  Future<void> saveTestResult() async {
    var batch = fireStore.batch();
    User? user = Get.find<AuthController>().getUser();
    if (user == null) {
      batch.set(
          userRF
              .doc(user!.email)
              .collection('myrecent_tests')
              .doc(questionPaperModel.id),
          {
            "points": points,
            "correct_answer": '$correctQuestionCount/${allQuestions.length}',
            "question_id": questionPaperModel.id,
            "time": questionPaperModel.timeSeconds - remainingSeconds,
          });
      batch.commit();
      navigatorToHome();
    }
  }
}
