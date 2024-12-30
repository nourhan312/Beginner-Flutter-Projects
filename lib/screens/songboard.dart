import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../utils/utils.dart';
import '../widgets/circle_play_button.dart';
import '../widgets/rectangle_button.dart';

class SongBoard extends StatefulWidget {
  const SongBoard({
    super.key,
    required this.musicName,
    required this.musicSource,
    required this.imageSource,
    required this.heroTag,
  });

  final String musicName;
  final String musicSource;
  final String imageSource;
  final String heroTag;

  @override
  State<SongBoard> createState() => _SongBoardState();
}

class _SongBoardState extends State<SongBoard> {
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    setAudio();

    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future<void> setAudio() async {
    AssetSource source = AssetSource('musics/${widget.musicSource}');
    await player.setSource(source);
    await player.setReleaseMode(ReleaseMode.loop);
    await player.play(source);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242424),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            Hero(
              tag: widget.heroTag,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/${widget.imageSource}',
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.musicName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              activeColor: Colors.deepPurple,
              inactiveColor: Colors.deepPurple[200],
              onChanged: (value) async {
                final newPosition = Duration(seconds: value.toInt());
                await player.seek(newPosition);
                if (!isPlaying) {
                  await player.resume();
                }
              },
            ),
            CirclePlayButton(isPlaying: isPlaying, player: player),
            Text(
              "${_formatDuration(position)} / ${_formatDuration(duration)}",
              style: const TextStyle(color: Colors.white70),
            ),
            Spacer(),
            RectangleButton(
              onPressed: () async {
                await player.stop();
                Navigator.pop(context);
              },
              child: Text(
                "Go to Dashboard",
                style: kButtonTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
