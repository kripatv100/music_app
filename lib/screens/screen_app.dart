import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/models/music.dart';
import 'package:music_app/screens/screen_home.dart';
import 'package:music_app/screens/screen_library.dart';
import 'package:music_app/screens/screen_search.dart';

class ScreenApp extends StatefulWidget {
  const ScreenApp({super.key});

  @override
  State<ScreenApp> createState() => _ScreenAppState();
}

class _ScreenAppState extends State<ScreenApp> {
  String audiosset = "assets/";
  final _audioPlayer = AudioPlayer();
  late bool isPlaying;
  int currentTanIndex = 0;
  Music? music;
  var Tabs = [];

  Widget miniPlayer(Music? music, {bool stop = false}) {
    this.music = music;

    if (stop) {
      isPlaying = false;
      _audioPlayer.stop();
    }

    Size deviceSize = MediaQuery.of(context).size;
    if (music == null) {
      return SizedBox();
    }

    return AnimatedContainer(
      duration: const Duration(microseconds: 500),
      color: Colors.blueGrey,
      height: 50,
      // width: deviceSize.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            music.image,
            fit: BoxFit.cover,
          ),
          Text(
            music.name,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          IconButton(
              onPressed: () async {
                isPlaying = !isPlaying;
                if (isPlaying) {
                  await _audioPlayer.play(AssetSource(music.audioURL));
                } else {
                  await _audioPlayer.pause();
                }
              },
              icon: isPlaying
                  ? Icon(Icons.pause, color: Colors.white)
                  : Icon(Icons.play_arrow, color: Colors.white))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Tabs = [ScreenHome(miniPlayer), ScreenSearch(), ScreenLibrary()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tabs[currentTanIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          miniPlayer(music),
          BottomNavigationBar(
              currentIndex: currentTanIndex,
              onTap: (currentIndex) {
                print("The Current Index is $currentIndex");
                setState(() {
                  currentTanIndex = currentIndex;
                });
              },
              backgroundColor: Colors.black45,
              selectedLabelStyle: TextStyle(color: Colors.white),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.library_books,
                      color: Colors.white,
                    ),
                    label: 'YourLibrary'),
              ]),
        ],
      ),
    );
  }
}
