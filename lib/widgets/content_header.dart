import 'package:clonetflix/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../models/content_model.dart';
import 'package:video_player/video_player.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;
  const ContentHeader({required this.featuredContent, super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: _ContentHeaderMobile(featuredContent: featuredContent),
        desktop: _ContentHeaderDesktop(featuredContent: featuredContent));
  }
}

class _ContentHeaderMobile extends StatelessWidget {
  final Content featuredContent;

  const _ContentHeaderMobile({super.key, required this.featuredContent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featuredContent.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 110.0,
          child: SizedBox(
            width: 250,
            child: Image.asset(featuredContent.titleImageUrl!),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                icon: Icons.add,
                title: 'List',
                onTap: () {},
              ),
              const _PlayButton(),
              VerticalIconButton(
                icon: Icons.info_outline,
                title: 'Info',
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ContentHeaderDesktop extends StatefulWidget {
  final Content featuredContent;

  const _ContentHeaderDesktop({super.key, required this.featuredContent});

  @override
  State<_ContentHeaderDesktop> createState() => _ContentHeaderDesktopState();
}

class _ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {
  VideoPlayerController? _videoController;
  bool _isMuted = true;

  @override
  void initState() {
    super.initState();
    final videoUri = Uri.parse(widget.featuredContent.videoUrl!);
    _videoController = VideoPlayerController.networkUrl(videoUri)
      ..initialize().then((_) => setState(() {}))
      ..setVolume(0)
      ..play()
      ..setLooping(true);
  }

  @override
  void dispose() {
    _videoController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _videoController!.value.isPlaying ? _videoController!.pause() : _videoController!.play(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Positioned(
            bottom: -1.0,
            left: 0,
            right: 0,
            child: AspectRatio(
                aspectRatio: _videoController!.value.isInitialized ? _videoController!.value.aspectRatio : 2.344,
                child: _videoController!.value.isInitialized
                    ? VideoPlayer(_videoController!)
                    : Image.asset(
                        widget.featuredContent.imageUrl,
                        fit: BoxFit.cover,
                      )),
          ),
          Container(
            height: 500.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            left: 60,
            right: 60,
            bottom: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250,
                  child: Image.asset(widget.featuredContent.titleImageUrl!),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  widget.featuredContent.description!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w100,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(2.0, 4.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const _PlayButton(),
                    const SizedBox(
                      width: 16.0,
                    ),
                    VerticalIconButton(
                      icon: Icons.info_outline,
                      title: 'More Info',
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    if (_videoController!.value.isInitialized)
                      IconButton(
                        icon: Icon(
                          _isMuted ? Icons.volume_off : Icons.volume_up,
                        ),
                        color: Colors.white,
                        iconSize: 30.0,
                        onPressed: () => setState(() {
                          _videoController!.setVolume(_isMuted ? 100 : 0);
                          _isMuted = _videoController!.value.volume == 0;
                        }),
                      )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(150.0, 40.0),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        side: const BorderSide(color: Colors.white, width: 2.0),
      ),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        size: 20.0,
      ),
      label: const Text(
        'Play',
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
      ),
    );
  }
}
