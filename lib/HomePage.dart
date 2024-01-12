import 'package:flutter/material.dart';
import 'package:logix_player_flutter/LogixVideoPlayer.dart';
import 'package:logix_player_plugin/logix_player_plugin.dart';

class MyGridView extends StatelessWidget {
  final List<GridItem> assets;

  const MyGridView({super.key, required this.assets});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: GridView.count(
        crossAxisCount: 2,
        children: assets,
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String image;
  final String title;
  final String videoUrl;

  const GridItem(
      {super.key,
      required this.image,
      required this.title,
      required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    final plugin = LogixPlayerPlugin();
    plugin.initState();
    return Card(
      color: const Color(0xFF0D0B25), // Set the background color to black
      margin: const EdgeInsets.all(10.0), // Set margin to create padding
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LogixVideoPlayer(
                      title: title,
                      videoUrl: videoUrl,
                      logixPlayerPlugin: plugin,
                    )),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppLogoTitle extends StatelessWidget {
  final String? appLogo;
  final String logoTitle;
  final String? subtitle;

  const AppLogoTitle(
      {super.key, this.appLogo, required this.logoTitle, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (appLogo != null)
          Image.asset(
            appLogo!,
            height: 24,
            width: 24,
          ),
        const SizedBox(
          width: 8,
        ),
        Text(
          logoTitle,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              height: 27), // Set text color to white
        ),
        const SizedBox(
          width: 8,
        ),
        if (subtitle != null)
          Container(
            height: 20,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: const Color(0xFF8940FF),
            ),
            alignment: Alignment.center,
            child: Text(
              subtitle!,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w700),
            ),
          ),
      ],
    );
  }
}
