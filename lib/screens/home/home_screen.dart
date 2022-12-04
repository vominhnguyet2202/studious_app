import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:get/get.dart';
import 'package:studious_app/configs/themes/ui_paraments.dart';
import 'package:studious_app/controllers/question_paper/question_paper_controller.dart';
import 'package:studious_app/screens/home/question_card.dart';
import 'package:studious_app/widgets/content_arer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
        body: ContentArea(
      addPadding: false,
      child: Obx(
        () => ListView.separated(
          itemBuilder: (context, index) {
            return ClipRRect(
              child: SizedBox(
                height: 200,
                width: 200,
                child: FadeInImage(
                  image: NetworkImage(
                      _questionPaperController.allPaperImages[index]),
                  placeholder:
                      const AssetImage("assets/images/app_splash_logo.png"),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 20,
            );
          },
          itemCount: _questionPaperController.allPaperImages.length,
          // padding: UIParamenters.mobileScreenPadding,
          // shrinkWrap: true,
          // itemBuilder: (context, index) {
          //   return QuestionCard(
          //     model: _questionPaperController.allPapers[index],
          //   );
          // },
          // separatorBuilder: (context, index) {
          //   return const SizedBox(
          //     height: 20,
          //   );
          // },
          // itemCount: _questionPaperController.allPapers.length,
        ),
      ),
    ));
  }
}
