import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WellnessGuideT extends StatelessWidget {
  const WellnessGuideT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5E9CF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffF5E9CF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Color(0xff4D455D), // Change this color to your desired color
        ),
      ),
      body: WellnessVideos(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
        },
        child: Icon(Icons.add),
        backgroundColor: const Color(0xff4D455D),
      ),
    );
  }
}

class WellnessVideos extends StatefulWidget {
  @override
  _WellnessVideosState createState() => _WellnessVideosState();
}

class _WellnessVideosState extends State<WellnessVideos> {
  final List<String> videoURLs = [
    "https://youtu.be/-7-CAFhJn78",
    "https://youtu.be/cyMxWXlX9sU",
    "https://youtu.be/rvaqPPjtxng",
    "https://youtu.be/8TuRYV71Rgo",
    "https://youtu.be/krBvzDlL0mM",
    "https://youtu.be/C5L8Z3qA1DA",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            for (int i = 0; i < videoURLs.length; i++) ...{
              WellnessVideoCard(videoURL: videoURLs[i]),
            }
          ],
        ),
      ),
    );
  }
}

class WellnessVideoCard extends StatefulWidget {
  final String videoURL;

  WellnessVideoCard({required this.videoURL});

  @override
  _WellnessVideoCardState createState() => _WellnessVideoCardState();
}

class _WellnessVideoCardState extends State<WellnessVideoCard> {
  late YoutubePlayerController _controller;
  bool isVideoLoaded = false;

  @override
  void initState() {
    super.initState();
    final videoID = YoutubePlayer.convertUrlToId(widget.videoURL)!;
    _controller = YoutubePlayerController(
      initialVideoId: videoID,
      flags: const YoutubePlayerFlags(
        autoPlay: false, // Auto-play is disabled
      ),
    );
    _controller.addListener(listener);
  }

  void listener() {
    if (_controller.value.isReady && !isVideoLoaded) {
      setState(() {
        isVideoLoaded = true;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
          child: Text(
            'Video Title', // Replace with your video title
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20,
              color: Color(0xff4D455D),
            ),
          ),
        ),
        const Divider(
          color: Color(0xff4D455D),
          thickness: 2,
        ),
        isVideoLoaded
            ? YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                progressColors: ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
              )
            : InkWell(
                onTap: () {
                  _controller.play();
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  color: Colors.black,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
