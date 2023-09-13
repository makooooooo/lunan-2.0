import 'package:flutter/material.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_info.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';

class WellnessGuide extends StatefulWidget {
  const WellnessGuide({Key? key}) : super(key: key);

  @override
  State<WellnessGuide> createState() => _WellnessGuideState();
}

class _WellnessGuideState extends State<WellnessGuide> {
  final videoURL1 = "https://youtu.be/-7-CAFhJn78";
  final videoURL2 = "https://youtu.be/cyMxWXlX9sU";
  final videoURL3 = "https://youtu.be/rvaqPPjtxng";
  final videoURL4 = "https://youtu.be/8TuRYV71Rgo";
  final videoURL5 = "https://youtu.be/krBvzDlL0mM";
  final videoURL6 = "https://youtu.be/C5L8Z3qA1DA";

  late YoutubePlayerController _controller1;
  late YoutubePlayerController _controller2;
  late YoutubePlayerController _controller3;
  late YoutubePlayerController _controller4;
  late YoutubePlayerController _controller5;
  late YoutubePlayerController _controller6;

  @override
  void initState() {
    super.initState();
    final videoID1 = YoutubePlayer.convertUrlToId(videoURL1)!;
    _controller1 = YoutubePlayerController(
      initialVideoId: videoID1,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    final videoID2 = YoutubePlayer.convertUrlToId(videoURL2)!;
    _controller2 = YoutubePlayerController(
      initialVideoId: videoID2,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    final videoID3 = YoutubePlayer.convertUrlToId(videoURL3)!;
    _controller3 = YoutubePlayerController(
      initialVideoId: videoID3,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    final videoID4 = YoutubePlayer.convertUrlToId(videoURL4)!;
    _controller4 = YoutubePlayerController(
      initialVideoId: videoID4,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    final videoID5 = YoutubePlayer.convertUrlToId(videoURL5)!;
    _controller5 = YoutubePlayerController(
      initialVideoId: videoID5,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    final videoID6 = YoutubePlayer.convertUrlToId(videoURL6)!;
    _controller6 = YoutubePlayerController(
      initialVideoId: videoID6,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
    super.dispose();
  }

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
              MaterialPageRoute(builder: (context) => PatientInfo()),
            );
          },
          color: Color(0xff4D455D),// Change this color to your desired color
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
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
                      controller: _controller1,
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
                      controller: _controller2,
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
                      controller: _controller3,
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
                      controller: _controller4,
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
                      controller: _controller5,
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
                      controller: _controller6,
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
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xff4D455D),
      ),
    );
  }
}
