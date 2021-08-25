import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'appbar.dart';
import 'confirm_screen.dart';

class musicScreen extends StatefulWidget {
  String title;

  musicScreen(String t) {
    this.title = t;
  }

  static List<String> songs = ["pause", "Chorus", "Lied 3", "Lied 4", "Lied 5"];

  @override
  _musicScreenState createState() => _musicScreenState();
}

class _musicScreenState extends State<musicScreen> {
  Icon musik = Icon(Icons.play_arrow);
  bool isPlaying = false;

  AudioPlayer _audioPlayer = AudioPlayer();
  static AudioCache _audioCache = AudioCache(prefix: 'assets/sounds/');

  void _playFile(String file) async {
    _audioPlayer = await _audioCache.loop(file + ".mp3");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarback(context, widget.title),
      body: ListView.builder(
          itemCount: musicScreen.songs.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.5, color: Colors.black),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "${musicScreen.songs[index]}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (isPlaying) {
                            setState(() {
                              musik = Icon(Icons.play_arrow);
                            });
                            _audioPlayer.stop();
                            isPlaying = false;
                          } else {
                            setState(() {
                              musik = Icon(Icons.pause);
                            });
                            _playFile(musicScreen.songs[index]);
                            isPlaying = true;
                          }
                        });
                      },
                      child: musik,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConfirmScreen(
                                    widget.title +
                                        " - " +
                                        musicScreen.songs[index])));
                      },
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
