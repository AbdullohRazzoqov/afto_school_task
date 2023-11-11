import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class PlayVideo extends StatefulWidget {
  const PlayVideo({super.key, required this.videoUrl});
  final String videoUrl;
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<PlayVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      widget.videoUrl,
    )..initialize().then((_) {
        setState(() {});
      });
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _controller.value.size.width * 0.5,
              height: 174,
              child: VideoPlayer(_controller),
            ),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 0,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              color: const Color(0xFF9ED480),
              size: 34.h,
            ),
          ),
        )
      ],
    );
  }
}
