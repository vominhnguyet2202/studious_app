import 'package:flutter/material.dart';
import 'package:studious_app/configs/themes/app_color.dart';
import 'package:video_player/video_player.dart';

import '../../configs/themes/custom_text_style.dart';
import '../../models/video_model.dart';
import '../../widgets/common/background.dart';
import '../../widgets/questions/custom_app_bar.dart';

class WatchVideo extends StatefulWidget {
  const WatchVideo({super.key});
  static const String routeName = '/watch';

  @override
  State<WatchVideo> createState() => _WatchVideoState();
}

class _WatchVideoState extends State<WatchVideo> {
  late VideoPlayerController _controller;
  int _curentIndex = 0;

  void _playVideo({int index = 0, bool init = false}) {
    if (index < 0 || index >= videos.length) return;

    if (!init) {
      _controller.pause();
    }
    setState(() {
      _curentIndex = index;
    });

    _controller = VideoPlayerController.network(videos[_curentIndex].url)
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..initialize().then((value) => _controller.play());
  }

  @override
  void initState() {
    super.initState();
    _playVideo(init: true);
  }

  String _videoDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        titleWidget: Text(
          "Let's watch video with me!",
          style: appBarTS,
        ),
      ),
      body: BackgroundDecoration(
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    gradient: mainGradient(),
                    // borderRadius: const BorderRadius.only(
                    //     topRight: Radius.circular(20),
                    //     topLeft: Radius.circular(20)),
                    borderRadius: BorderRadius.circular(8)),
                height: 300,
                child: _controller.value.isInitialized
                    ? Column(
                        children: <Widget>[
                          SizedBox(
                            height: 220,
                            child: VideoPlayer(_controller),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ValueListenableBuilder(
                                  valueListenable: _controller,
                                  builder:
                                      (context, VideoPlayerValue value, child) {
                                    return Text(
                                      _videoDuration(value.position),
                                      style: const TextStyle(
                                          color: onSurfaceTextColor,
                                          fontSize: 18),
                                    );
                                  }),
                              Expanded(
                                  child: SizedBox(
                                height: 5,
                                child: VideoProgressIndicator(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    _controller,
                                    allowScrubbing: true),
                              )),
                              Text(
                                _videoDuration(_controller.value.duration),
                                style: const TextStyle(
                                    color: onSurfaceTextColor, fontSize: 18),
                              )
                            ],
                          ),
                          IconButton(
                              onPressed: () => _controller.value.isPlaying
                                  ? _controller.pause()
                                  : _controller.play(),
                              icon: Icon(
                                _controller.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: onSurfaceTextColor,
                                size: 35,
                              ))
                        ],
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                            color: onSurfaceTextColor),
                      )),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white.withOpacity(0.3)),
                child: ListView.builder(
                    itemCount: videos.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => _playVideo(index: index),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
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
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
