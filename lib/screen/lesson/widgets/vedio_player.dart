import 'dart:async';

import 'package:afto_school_task/core/utils/app_colors.dart';
import 'package:afto_school_task/core/utils/app_icons.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

class VideoPlaying extends StatefulWidget {
  const VideoPlaying({super.key, required this.videoUrl});
  final String videoUrl;
  @override
  _VideoPlayingState createState() => _VideoPlayingState();
}

class _VideoPlayingState extends State<VideoPlaying> {
  late VideoPlayerController _controller;
  bool isButton = false;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      widget.videoUrl,
    )..initialize().then((_) {
        setState(() {});
      });
    _controller.setLooping(true);
    _controller.addListener(() {
      if (_controller.value.position.inSeconds ==
          _controller.value.duration.inSeconds) {
        _controller.pause();
        _controller.seekTo(Duration(seconds: 0));
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onDoubleTap: () {
        _controller.pause();
        Navigator.push<_PlayerVideoAndPopPage>(
          context,
          MaterialPageRoute<_PlayerVideoAndPopPage>(
            builder: (BuildContext context) => _PlayerVideoAndPopPage(duration: _controller.value.position,),
          ),
        );
      },
      onTap: () {
        isButton = true;
        setState(() {});
        Timer(const Duration(seconds: 5), () {
          isButton = false;
          setState(() {});
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: AspectRatio(
                  aspectRatio: 16/9,
                  child: Builder(
                    builder: (context) {
                      return VideoPlayer(_controller);
                    }
                  ),
                ),
              ),
            ),
          ),
          isButton
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Duration currentPosition = _controller.value.position;
                        Duration targetPosition =
                            currentPosition - const Duration(seconds: 15);
                        _controller.seekTo(targetPosition);
                      },
                      child: SvgPicture.asset(AppIcons.backSecoundIcon),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 50.w),
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white.withOpacity(0.5)),
                        child: Center(
                          child: Icon(
                            _controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: AppColors.white,
                            size: 40.w,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Duration currentPosition = _controller.value.position;
                        Duration targetPosition =
                            currentPosition + const Duration(seconds: 15);
                        _controller.seekTo(targetPosition);
                      },
                      child: SvgPicture.asset(AppIcons.nextSecoundIcon),
                    ),
                  ],
                )
              : SizedBox(),
          isButton
              ? Positioned(
                  bottom: 10,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 30,
                    ),
                    child: ProgressBar(
                      timeLabelTextStyle: const TextStyle(color: Colors.white),
                      timeLabelPadding: 12,
                      thumbGlowRadius: 10,
                      progress: Duration(
                          seconds: _controller.value.position.inSeconds),
                      total: Duration(
                          seconds: _controller.value.duration.inSeconds),
                      progressBarColor: const Color(0xFFF17A46),
                      baseBarColor: Colors.white,
                      thumbColor: Colors.white,
                      barHeight: 3.0,
                      thumbRadius: 5.0,
                      onSeek: (duration) {
                        _controller.seekTo(duration);
                      },
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

class _PlayerVideoAndPopPage extends StatefulWidget {
  Duration duration;

  _PlayerVideoAndPopPage({required this.duration});

  @override
  _PlayerVideoAndPopPageState createState() => _PlayerVideoAndPopPageState();
}

class _PlayerVideoAndPopPageState extends State<_PlayerVideoAndPopPage> {
  late VideoPlayerController _videoPlayerController;
  bool startedPlaying = false;

  @override
  void initState() {
    super.initState();

    _videoPlayerController =
        VideoPlayerController.asset('assets/vedio/bmw.mp4');
    _videoPlayerController.addListener(() {
      if (startedPlaying && !_videoPlayerController.value.isPlaying) {
        Navigator.pop(context);
      }
    });
    _videoPlayerController.seekTo(widget.duration);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future<bool> started() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.play();
    startedPlaying = true;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child:  AspectRatio( key: Key('aspectRatioKey'),
        aspectRatio: 16/9,
        child: VideoPlayer(_videoPlayerController),

      ),
    );
  }
}
