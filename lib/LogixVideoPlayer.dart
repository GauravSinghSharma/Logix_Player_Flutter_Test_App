import 'package:flutter/material.dart';
import 'package:logix_player_plugin/logix_player_plugin.dart';
import 'package:logix_player_plugin/logix_player_plugin_platform_interface.dart';
import 'package:logix_player_plugin/ui/VideoPlayer.dart';

class LogixVideoPlayer extends StatelessWidget {
  final String title;
  final String videoUrl;
  final LogixPlayerPlugin logixPlayerPlugin;

  const LogixVideoPlayer(
      {super.key,
      required this.title,
      required this.videoUrl,
      required this.logixPlayerPlugin});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            VideoPlayer(
              title: title,
              videoUrl: videoUrl,
              playerPlugin: logixPlayerPlugin,
              isAutoPlayEnabled: false,
              portraitPlayerHeight: 210,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 100.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          logixPlayerPlugin.prepareAndPlay(videoUrl, title,
                              StreamType.VOD, ContentType.VOD, null);
                        },
                        label: const Text(
                          "Play",
                          style: TextStyle(color: Colors.purple),
                        ),
                        icon: const Icon(Icons.play_circle_fill_rounded),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          logixPlayerPlugin.pause();
                        },
                        label: const Text(
                          "Pause Player",
                          style: TextStyle(color: Colors.purple),
                        ),
                        icon: const Icon(Icons.pause_circle_filled),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          logixPlayerPlugin.play();
                        },
                        label: const Text(
                          "Resume",
                          style: TextStyle(color: Colors.purple),
                        ),
                        icon: const Icon(Icons.play_arrow_outlined),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          logixPlayerPlugin.forwardPlayer(10000);
                        },
                        label: const Text(
                          "Forward 10 sec",
                          style: TextStyle(color: Colors.purple),
                        ),
                        icon: const Icon(Icons.forward_10_outlined),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          logixPlayerPlugin.backwardPlayer(10000);
                        },
                        label: const Text(
                          "Backward 10 sec",
                          style: TextStyle(color: Colors.purple),
                        ),
                        icon: const Icon(Icons.restore_outlined),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          logixPlayerPlugin.enableSubtitle();
                        },
                        label: const Text(
                          "Show Subtitles",
                          style: TextStyle(color: Colors.purple),
                        ),
                        icon: const Icon(Icons.subtitles),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          logixPlayerPlugin.disableSubtitle();
                        },
                        label: const Text(
                          "Hide Subtitles",
                          style: TextStyle(color: Colors.purple),
                        ),
                        icon: const Icon(Icons.subtitles_off_outlined),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          logixPlayerPlugin.seekTo(20000);
                        },
                        label: const Text(
                          "Seek by 20 sec",
                          style: TextStyle(color: Colors.purple),
                        ),
                        icon: const Icon(Icons.language_outlined),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        label: const Text(
                          "Mute Player",
                          style: TextStyle(color: Colors.purple),
                        ),
                        icon: const Icon(Icons.volume_mute_outlined),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          logixPlayerPlugin.portraitPlayback();
                        },
                        label: const Text(
                          "Portrait playback",
                          style: TextStyle(color: Colors.purple),
                        ),
                        icon: const Icon(Icons.skip_previous_outlined),
                      ),
                      /* ElevatedButton.icon(
                        onPressed: () {
                          logixPlayerPlugin.landScapePlayback();
                        },
                        label: const Text(
                          "LandScape Playback",
                          style: TextStyle(color: Colors.purple),
                        ),
                        icon: const Icon(Icons.landscape_outlined),
                      ),*/
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.large(
          onPressed: () {
            logixPlayerPlugin.stop();
            logixPlayerPlugin.releasePlayer();
            Navigator.pop(context);
          },
          backgroundColor: Colors.green,
          child: const Text(
            'Stop & Kill Player',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.yellow),
          ),
        ),
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black, // Set the background color here
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
