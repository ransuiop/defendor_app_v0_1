// ignore_for_file: prefer_const_constructors

import 'package:defendor_app_v0_1/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BuildTrainingTab extends StatefulWidget {
  const BuildTrainingTab({super.key, required this.demoVidUrl});
  final String demoVidUrl;

  @override
  State<BuildTrainingTab> createState() => _BuildTrainingTabState();
}

class _BuildTrainingTabState extends State<BuildTrainingTab> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller =
        VideoPlayerController.contentUri(Uri.parse(widget.demoVidUrl));

    _controller.initialize().then((_) {
      setState(() {});
    });
    _controller.pause();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Stack(
            fit: StackFit.loose,
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: AspectRatio(
                    aspectRatio: 1.0 / 1.0,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: VideoPlayer(_controller)),
                  ),
                ),
                VideoProgressIndicator(_controller,
                    allowScrubbing: true,
                    colors: VideoProgressColors(playedColor: defLBlu),
                    padding: EdgeInsets.fromLTRB(16, 410, 16, 0)),
                Positioned(
                  top: 330,
                  left: 330,
                  child: FloatingActionButton(
                    backgroundColor: defBBlu,
                    shape: CircleBorder(),
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    // Display the correct icon depending on the state of the player.
                    child: Icon(_controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow),
                  ),
                ),
              ])
        // If the VideoPlayerController has finished initialization, use
        // the data it provides to limit the aspect ratio of the video.
    
        // If the VideoPlayerController is still initializing, show a
        // loading spinner.
        : Flexible(
          fit: FlexFit.loose,
          child: Center(
              child: CircularProgressIndicator(),
            ),
        );
  }
}