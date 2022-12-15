import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studious_app/configs/themes/app_color.dart';
import 'package:studious_app/controllers/play_video_controller.dart';
import 'package:chewie/chewie.dart';

class PlayVideo extends GetView<PlayVideoController> {
  const PlayVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Watch Video"),
      ),
      body: Column(children: [
        GetBuilder<PlayVideoController>(
          init: PlayVideoController(),
          builder: (controller) => Expanded(
              child: Center(
            child: controller.chewieController != null &&
                    controller.chewieController!.videoPlayerController.value
                        .isInitialized
                ? Chewie(controller: controller.chewieController!)
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Loading'),
                      ]),
          )),
        )
        // Container(
        //   decoration: BoxDecoration(gradient: mainGradient()),
        //   height: 300,
        //   // child: controller.value.initialized,
        // ),
        // Expanded(
        //     child: ListView.builder(
        //         itemCount: videos.length,
        //         itemBuilder: (context, index) {
        //           return Padding(
        //             padding: const EdgeInsets.all(8),
        //             child: Row(
        //               children: [
        //                 SizedBox(
        //                   height: 100,
        //                   width: 100,
        //                   child: Image.network(
        //                     videos[index].thumb_url,
        //                     fit: BoxFit.contain,
        //                   ),
        //                 ),
        //                 const SizedBox(
        //                   width: 20,
        //                 ),
        //                 Text(
        //                   videos[index].name,
        //                   style: const TextStyle(fontSize: 25),
        //                 )
        //               ],
        //             ),
        //           );
        //         }))
      ]),
    );
  }
}
