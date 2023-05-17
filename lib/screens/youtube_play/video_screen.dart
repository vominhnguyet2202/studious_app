import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studious_app/configs/themes/app_color.dart';
import 'package:studious_app/configs/themes/custom_text_style.dart';
import 'package:studious_app/controllers/play_video_controller.dart';
import 'package:chewie/chewie.dart';
import 'package:studious_app/models/video_model.dart';
import 'package:studious_app/widgets/common/background.dart';
import 'package:studious_app/widgets/questions/custom_app_bar.dart';
import 'package:video_player/video_player.dart';

class PlayVideo extends GetView<PlayVideoController> {
  PlayVideo({super.key});
  static const String routeName = '/playvideo';
  // late VideoPlayerController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        titleWidget: Text(
          "Let's listen to music!",
          style: appBarTS,
        ),
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
      ]),
    );
  }
}
 

        /**
     * 
     Column(children: [
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
     */
        
 /**
  * 
BackgroundDecoration(
        child: ListView.builder(
            itemCount: videos.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.network(
                        videos[index].thumb_url,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      videos[index].name,
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
              );
            }),
      ),
  */