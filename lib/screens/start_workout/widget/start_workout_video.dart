import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/data/exercise_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class StartWorkoutVideo extends StatefulWidget {
  final ExerciseData exercise;
  final Function(int) onPlayTapped;
  final Function(int) onPauseTapped;

  StartWorkoutVideo({
    required this.exercise,
    required this.onPlayTapped,
    required this.onPauseTapped,
  });
  @override
  _StartWorkoutVideoState createState() => _StartWorkoutVideoState();
}

class _StartWorkoutVideoState extends State<StartWorkoutVideo> {
  late VideoPlayerController _controller;
  // late Future<void> _initializeVideoPlayerFuture;
  late bool isPlayButtonHidden = false;
  late ChewieController _chewieController;
  Timer? timer;
  Timer? videoTimer;
  // bool _isVideoPlaying = false;

  @override
  void initState() {
    _controller = VideoPlayerController.asset(widget.exercise.video);

    _controller.initialize();

    _chewieController = ChewieController(
        videoPlayerController: _controller,
        looping: true,
        autoPlay: false,
        deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
        aspectRatio: 15 / 10,
        placeholder: Center(child: CupertinoActivityIndicator()),
        materialProgressColors: ChewieProgressColors(playedColor: ColorConstants.primaryColor));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: _controller.value.aspectRatio, child: _createVideoContainer());
  }

  Widget _createVideoContainer() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Theme(data: Theme.of(context).copyWith(platform: TargetPlatform.android), child: Chewie(controller: _chewieController)),
    );
  }

  // Widget _createPlayButton() {
  //   return Center(
  //     child: GestureDetector(
  //       onTap: () {
  //         // timer?.cancel();
  //         _chewieController.isPlaying ? _chewieController.pause() : _chewieController.play();
  //         setState(() {
  //           _isVideoPlaying = _chewieController.isPlaying;
  //         });
  //         // setState(() {
  //         //   if (_controller.value.isPlaying) {
  //         //     _controller.pause();
  //         //     widget.onPauseTapped(_getCurrentTime());
  //         //   } else {
  //         //     _controller.play();
  //         //     _playTimer();
  //         //     widget.onPlayTapped(_getCurrentTime());
  //         //   }
  //         // });
  //       },
  //       child: Container(
  //         height: 50,
  //         width: 50,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(30),
  //           color: ColorConstants.white.withOpacity(0.8),
  //         ),
  //         child: Icon(
  //           _isVideoPlaying ? Icons.pause : Icons.play_arrow,
  //           color: ColorConstants.primaryColor,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // void _playTimer() {
  //   timer = Timer(Duration(seconds: 3), () {
  //     setState(() {
  //       isPlayButtonHidden = true;
  //     });
  //   });
  // }

  // int _getCurrentTime() {
  //   int duration = _controller.value.duration.inSeconds;
  //   int position = _controller.value.position.inSeconds;

  //   return duration - position;
  // }
}
