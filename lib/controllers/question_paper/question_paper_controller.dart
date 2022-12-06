import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:studious_app/controllers/auth_controller.dart';
import 'package:studious_app/firebase_ref/refrences.dart';
import 'package:studious_app/models/question_paper_model.dart';
import 'package:studious_app/services/firebase_store_sevice.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    // List<String> imgName = ['biology', 'chemistry', 'maths', 'physics'];
    try {
      // QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      // var paperList = data.docs
      //     .map((paper) => QuestionPaperModel.fromSnapshot(paper))
      //     .toList();
      // allPapers.assignAll(paperList);
      // for (var paper in paperList) {
      //   final imgUrl =
      //       await Get.find<FireBaseStorageService>().getImage(paper.title);
      //   paper.imageUrl = imgUrl;
      //   print(imgUrl);
      // }
      // allPapers.assignAll(paperList);

      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();

      var paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      for (var qPaper in paperList) {
        var querySnapshot =
            await questionPaperRF.doc(qPaper.id).collection("questions").get();
        var allQuestions = querySnapshot.docs
            .map((doc) => {...doc.data(), "id": doc.id})
            .toList();
        var finalQuestionsMapList = <Map<String, dynamic>>[];
        for (var element in allQuestions) {
          final answersDoc = await questionPaperRF
              .doc(qPaper.id)
              .collection("questions")
              .doc(element["id"])
              .collection("answers")
              .get();
          final answersCurrentQuestion =
              answersDoc.docs.map((e) => e.data()).toList();
          var tempQuestion = {...element, "answers": answersCurrentQuestion};
          finalQuestionsMapList.add(tempQuestion);
        }
        qPaper.questions = [
          ...finalQuestionsMapList.map((e) => Questions.fromJson(e)).toList()
        ];
      }
      allPapers.assignAll(paperList);
      for (var paper in paperList) {
        final imgUrl =
            await Get.find<FireBaseStorageService>().getImage(paper.title);
        paper.imageUrl = imgUrl;
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      print(e);
    }
  }

  void navigateToQuestions(
      {required QuestionPaperModel paper, bool tryAgain = false}) {
    AuthController _authController = Get.find();
    if (_authController.isLoggedIn()) {
      if (tryAgain) {
        Get.back();
        // Get.offNamed();
      } else {
        //  Get.toNamed(QuestionScreen.routeName, arguments: paper);
      }
    } else {
      _authController.showLoginAlertDialog();
    }
  }
}
