// ignore_for_file: prefer_const_constructors

import 'package:defendor_app_v0_1/modules/providers/theme_provider.dart';
import 'package:defendor_app_v0_1/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class BuildTrainingTab extends ConsumerStatefulWidget {
  const BuildTrainingTab({super.key, required this.demoVidUrl});
  final String demoVidUrl;

  @override
  ConsumerState<BuildTrainingTab> createState() => _BuildTrainingTabState();
}

class _BuildTrainingTabState extends ConsumerState<BuildTrainingTab> {
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
    final themeState = ref.read(appThemeStateNotifier);

    return _controller.value.isInitialized
        ? SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Stack(
                fit: StackFit.loose,
                clipBehavior: Clip.none,
                alignment: AlignmentDirectional.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _controller.value.isPlaying
                                  ? _controller.pause()
                                  : _controller.play();
                            });
                          },
                          child: AspectRatio(
                            aspectRatio: 1.0 / 1.0,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: VideoPlayer(_controller)),
                          ),
                        ),
                      ),
                      VideoProgressIndicator(
                        _controller,
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                            playedColor:
                                themeState.isDarkModeEnabled ? defXWht : defLBlu),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: _controller.value.isPlaying ? false : true,
                    child: _controller.value.isPlaying
                        ? Icon(
                            Icons.play_arrow,
                            size: 60,
                            color: defGry,
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                _controller.value.isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                              });
                            },
                            child: Icon(
                              Icons.pause,
                              size: 60,
                              color: defGry,
                            ),
                          ),
                  ),
                  Positioned(
                    top: 330,
                    left: 330,
                    child: FloatingActionButton(
                      backgroundColor: defBBlu,
                      shape: CircleBorder(),
                      onPressed: () {},
                      child: Icon(Icons.camera),
                    ),
                  ),
                ]),
          )
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
