import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FlutterVido extends StatefulWidget {
  @override
  _FlutterVidoState createState() => _FlutterVidoState();
}

class _FlutterVidoState extends State<FlutterVido> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: "WhO4NsdH",
      // 'dQw4w9WgXcQ', // Replace with your YouTube video ID
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    onReady: () {},
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Text(
                        '1-Dars: ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Kompiyuterga Flutter o'rnatish\nAndroid Studio o'rnatish  ",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => DarsPage(darsName: 'dars 1')),
                  // );
                },
                child: const Text('  Test Bajarish '),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
