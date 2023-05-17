import 'package:flutter/material.dart';
import 'package:studious_app/configs/themes/ui_paraments.dart';

import '../../configs/themes/app_color.dart';

enum AnswerStatus { correct, wrong, answered, notanswered }

class AnswerCard extends StatelessWidget {
  const AnswerCard(
      {Key? key,
      required this.answer,
      this.isSelected = false,
      required this.onTap})
      : super(key: key);
  final String answer;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: UIParamenters.cardBorderRadius,
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: UIParamenters.cardBorderRadius,
            color: isSelected
                ? answerSelectedColor()
                : Theme.of(context).cardColor,
            border: Border.all(
                color:
                    isSelected ? answerSelectedColor() : answerBorderColor())),
        child: Text(
          answer,
          style: TextStyle(
            color: isSelected ? onSurfaceTextColor : null,
          ),
        ),
      ),
    );
  }
}

class CorrectAnswer extends StatelessWidget {
  const CorrectAnswer({super.key, required this.answer});
  final String answer;
  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      color: correctAnswerColor.withOpacity(0.1),
      // decoration: BoxDecoration(borderRadius: UIParamenters.cardBorderRadius),
      child: Text(
        answer,
        style: const TextStyle(
            color: correctAnswerColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class WrongAnswer extends StatelessWidget {
  const WrongAnswer({super.key, required this.answer});
  final String answer;
  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      color: wrongAnswerColor.withOpacity(0.1),
      // decoration: BoxDecoration(borderRadius: UIParamenters.cardBorderRadius),
      child: Text(
        answer,
        style: const TextStyle(
            color: wrongAnswerColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class NotedAnswer extends StatelessWidget {
  const NotedAnswer({super.key, required this.answer});
  final String answer;
  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      color: notAnsweredColor.withOpacity(0.1),
      // decoration: BoxDecoration(borderRadius: UIParamenters.cardBorderRadius),
      child: Text(
        answer,
        style: const TextStyle(
            color: notAnsweredColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
