
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CenteredPlayMaterialControls extends StatefulWidget {
  const CenteredPlayMaterialControls({super.key});

  @override
  State<CenteredPlayMaterialControls> createState() =>
      _CenteredPlayMaterialControlsState();
}

class _CenteredPlayMaterialControlsState
    extends State<CenteredPlayMaterialControls> {
  late VideoPlayerController controller;
  late ChewieController chewieController;

  bool _visible = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    chewieController = ChewieController.of(context);
    controller = chewieController.videoPlayerController;
  }

  void togglePlayPause() {
    setState(() {
      controller.value.isPlaying ? controller.pause() : controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isFullscreen = chewieController.isFullScreen;

    return GestureDetector(
      onTap: () => setState(() => _visible = !_visible),
      child: Stack(
        children: [
          // Center play button
          if (_visible)
            Center(
              child: IconButton(
                iconSize: 64,
                icon: Icon(
                  controller.value.isPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_filled,
                  color: Colors.white,
                ),
                onPressed: togglePlayPause,
              ),
            ),

          if (_visible)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.black54,
           
                child: Row(
                  children: [
                    if (isFullscreen)
                      Text(
                        _formatDuration(controller.value.position),
                        style: const TextStyle(color: Colors.white),
                      ),

                    if (isFullscreen)
                      Expanded(
                        child: VideoProgressIndicator(
                          controller,
                          allowScrubbing: true,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          colors: VideoProgressColors(
                            playedColor: Colors.white,
                            backgroundColor: Colors.grey,
                          ),
                        ),
                      ),

                    if (isFullscreen)
                      Text(
                        _formatDuration(controller.value.duration),
                        style: const TextStyle(color: Colors.white),
                      ),

                    IconButton(
                      icon: Icon(
                        isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        isFullscreen
                            ? chewieController.exitFullScreen()
                            : chewieController.enterFullScreen();
                      },
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
