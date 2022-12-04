import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:studious_app/configs/themes/app_icons.dart';
import 'package:studious_app/configs/themes/ui_paraments.dart';
import 'package:studious_app/models/question_paper_model.dart';
import 'package:studious_app/widgets/app_icon_text.dart';

import '../../configs/themes/custom_text_style.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key, required this.model});

  final QuestionPaperModel model;
  @override
  Widget build(BuildContext context) {
    const double _padding = 10.0;
    return Container(
      decoration: BoxDecoration(borderRadius: UIParamenters.cardBorderRadius),
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(_padding),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ColoredBox(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    child: SizedBox(
                      height: Get.width * 0.015,
                      width: Get.width * 0.015,
                      child: CachedNetworkImage(
                        imageUrl: model.imageUrl!,
                        placeholder: (context, url) => Container(
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/images/app_plash_logo.png"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model.title!, style: cartTitles(context)),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 15),
                        child: Text(model.description!),
                      ),
                      Row(
                        children: [
                          AppIconText(
                              icon: Icon(Icons.help_outline,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Theme.of(context).primaryColor),
                              text: Text(
                                '${model.questionCount} questions',
                                style: detailText.copyWith(
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Theme.of(context).primaryColor),
                              )),
                          const SizedBox(
                            width: 15,
                          ),
                          AppIconText(
                              icon: Icon(Icons.timer,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Theme.of(context).primaryColor),
                              text: Text(
                                model.timeInMinits(),
                                style: detailText.copyWith(
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Theme.of(context).primaryColor),
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
                bottom: -_padding,
                right: -_padding,
                child: GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(cardBorderRadius),
                          bottomRight: Radius.circular(cardBorderRadius),
                        )),
                    child: const Icon(AppIcons.trophyOutLine),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
