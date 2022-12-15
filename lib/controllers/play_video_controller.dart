import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studious_app/models/video_model.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class PlayVideoController extends GetxController {
  late VideoPlayerController _controller;
  ChewieController? chewieController;
  int _curentIndex = 0;
  @override
  void onInit() {
    playVideo();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _controller.dispose();
    chewieController!.dispose();
    super.onClose();
  }

  Future<void> playVideo({int index = 0, bool init = false}) async {
    if (index < 0 || index >= videos.length) return;
    _controller = VideoPlayerController.network(videos[_curentIndex].url);
    await Future.wait([_controller.initialize()]);
    chewieController = ChewieController(
        videoPlayerController: _controller,
        autoPlay: true,
        looping: true,
        materialProgressColors: ChewieProgressColors(
            playedColor: Colors.red,
            handleColor: Colors.cyan,
            backgroundColor: Colors.yellowAccent,
            bufferedColor: Colors.lightGreen),
        placeholder: Container(
          color: Colors.greenAccent,
        ),
        autoInitialize: true);
    update();
  }
}
