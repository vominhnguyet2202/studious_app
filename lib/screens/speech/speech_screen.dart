import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studious_app/configs/themes/app_color.dart';

import '../../controllers/speech_controller.dart';
import '../../widgets/questions/custom_app_bar.dart';

class SpeechView extends GetView<SpeechController> {
  const SpeechView({super.key});
  static const String routeName = '/speech';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(title: "Speech Text"),
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Obx(() => Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      controller.speechText.value,
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  )),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
            animate: controller.isListening.value,
            glowColor: Colors.amber.withOpacity(0.5),
            endRadius: 75.0,
            duration: const Duration(milliseconds: 2000),
            repeatPauseDuration: const Duration(milliseconds: 100),
            repeat: true,
            child: FloatingActionButton(
              onPressed: () {
                controller.listen();
              },
              child: Icon(
                  controller.isListening.value ? Icons.mic_off : Icons.mic),
            )),
      ),
    );
  }
}
