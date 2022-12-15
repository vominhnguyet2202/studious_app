import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studious_app/configs/themes/app_color.dart';

import '../../controllers/speech_controller.dart';

class SpeechView extends GetView<SpeechController> {
  const SpeechView({super.key});
  static const String routeName = '/speech';
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: colorLightRed,
        appBar: AppBar(
          backgroundColor: customBlackColor,
          title: const Text("Speech Text"),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Container(
              padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
              child: Column(
                children: [
                  Obx(() => Text(
                        controller.speechText.value,
                        style: const TextStyle(fontSize: 30),
                      ))
                ],
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
            animate: controller.isListening.value,
            glowColor: Theme.of(context).primaryColor,
            endRadius: 75.0,
            duration: const Duration(milliseconds: 2000),
            repeatPauseDuration: const Duration(milliseconds: 100),
            repeat: true,
            child: FloatingActionButton(
              onPressed: () {
                controller.listen();
              },
              child: Icon(
                  controller.isListening.value ? Icons.mic : Icons.mic_none),
            )),
      );
}
