import 'package:flutter/material.dart';

import 'HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  List<GridItem> allAssets() {
    return [
      const GridItem(
          image: 'assets/one.jpg',
          title: 'Sintel',
          videoUrl:
              'https://bitmovin-a.akamaihd.net/content/sintel/hls/playlist.m3u8'),
      const GridItem(
          image: 'assets/two.jpg',
          title: 'Star Trek',
          videoUrl:
              'https://storage.googleapis.com/shaka-demo-assets/angel-one-hls/hls.m3u8'),
      const GridItem(
          image: 'assets/three.jpg',
          title: 'Tears Of Steel',
          videoUrl:
              'https://storage.googleapis.com/wvmedia/clear/h264/tears/tears.mpd'),
      const GridItem(
          image: 'assets/four.jpg',
          title: 'Big Buck Bunny',
          videoUrl:
              'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0D0B25),
          // Set the background color to black
          title: const AppLogoTitle(
            logoTitle: 'Logix Player',
            appLogo: 'assets/logo.png',
            subtitle: 'DEMO',
          ),
        ),
        body: MyGridView(
          assets: allAssets(),
        ),
      ),
      theme: ThemeData(
        scaffoldBackgroundColor:
            const Color(0xFF0D0B25), // Set the background color here
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
