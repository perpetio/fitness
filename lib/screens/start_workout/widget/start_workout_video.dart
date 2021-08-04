import 'dart:async';

import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/data/exercise_data.dart';
import 'package:flutter/cupertino.dart';
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
  late Future<void> _initializeVideoPlayerFuture;
  late bool isPlayButtonHidden = false;
  Timer? timer;
  Timer? videoTimer;

  @override
  void initState() {
    _controller = VideoPlayerController.asset(widget.exercise.video);

    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: GestureDetector(
              child: ClipRect(
                child: Stack(
                  children: [
                    _createVideoContainer(),
                    if (!isPlayButtonHidden) _createPlayButton(),
                  ],
                ),
              ),
              onTap: () {
                setState(() {
                  isPlayButtonHidden = !isPlayButtonHidden;
                });
              },
            ),
          );
        } else {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
      },
    );
  }

  Widget _createVideoContainer() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: VideoPlayer(_controller),
    );
  }

  Widget _createPlayButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          timer?.cancel();
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
              widget.onPauseTapped(_getCurrentTime());
            } else {
              _controller.play();
              _playTimer();
              widget.onPlayTapped(_getCurrentTime());
            }
          });
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: ColorConstants.white.withOpacity(0.8),
          ),
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            color: ColorConstants.primaryColor,
          ),
        ),
      ),
    );
  }

  void _playTimer() {
    timer = Timer(Duration(seconds: 3), () {
      setState(() {
        isPlayButtonHidden = true;
      });
    });
  }

  int _getCurrentTime() {
    int duration = _controller.value.duration.inSeconds;
    int position = _controller.value.position.inSeconds;

    return duration - position;
  }
}
