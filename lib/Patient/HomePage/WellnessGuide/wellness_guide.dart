import 'package:flutter/material.dart';
import 'package:lunan/Patient/HomePage/landing_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';

class WellnessGuide extends StatelessWidget {
  final String embeddedVideoURL1 = "https://www.youtube.com/embed/-7-CAFhJn78";
  final String embeddedVideoURL2 = "https://www.youtube.com/embed/cyMxWXlX9sU";
  final String embeddedVideoURL3 = "https://www.youtube.com/embed/rvaqPPjtxng";
  final String embeddedVideoURL4 = "https://www.youtube.com/embed/8TuRYV71Rgo";
  final String embeddedVideoURL5 = "https://www.youtube.com/embed/krBvzDlL0mM";
  final String embeddedVideoURL6 = "https://www.youtube.com/embed/C5L8Z3qA1DA";

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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LandingPage()),
            );
          },
          color: Color(0xff4D455D), // Change this color to your desired color
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: const Text(
                  'Breathing Exercise',
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
              Container(
                margin: const EdgeInsets.all(10),
                child: YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: YoutubePlayer.convertUrlToId(embeddedVideoURL1)!,
                    flags: const YoutubePlayerFlags(autoPlay: false),
                  ),
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.amber,
                  progressColors: ProgressBarColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: const Text(
                  'Meditation Guide',
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
              Container(
                margin: const EdgeInsets.all(10),
                child: YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: YoutubePlayer.convertUrlToId(embeddedVideoURL2)!,
                    flags: const YoutubePlayerFlags(autoPlay: false),
                  ),
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.amber,
                  progressColors: ProgressBarColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: const Text(
                  'Sleep Meditation',
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
              Container(
                margin: const EdgeInsets.all(10),
                child: YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: YoutubePlayer.convertUrlToId(embeddedVideoURL3)!,
                    flags: const YoutubePlayerFlags(autoPlay: false),
                  ),
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.amber,
                  progressColors: ProgressBarColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: const Text(
                  'Stretching Guide',
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
              Container(
                margin: const EdgeInsets.all(10),
                child: YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: YoutubePlayer.convertUrlToId(embeddedVideoURL4)!,
                    flags: const YoutubePlayerFlags(autoPlay: false),
                  ),
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.amber,
                  progressColors: ProgressBarColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: const Text(
                  'Relaxation Guide',
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
              Container(
                margin: const EdgeInsets.all(10),
                child: YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: YoutubePlayer.convertUrlToId(embeddedVideoURL5)!,
                    flags: const YoutubePlayerFlags(autoPlay: false),
                  ),
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.amber,
                  progressColors: ProgressBarColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: const Text(
                  'Positive Energy',
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
              Container(
                margin: const EdgeInsets.all(10),
                child: YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: YoutubePlayer.convertUrlToId(embeddedVideoURL6)!,
                    flags: const YoutubePlayerFlags(autoPlay: false),
                  ),
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.amber,
                  progressColors: ProgressBarColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}