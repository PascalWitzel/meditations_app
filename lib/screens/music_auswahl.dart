import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'appbar.dart';
import 'confirm_screen.dart';

class musicScreen extends StatefulWidget {
  String title;

  musicScreen(String t) {
    this.title = t;
  }

  static List<String> songs = ["pause", "Chorus", "testtesttesttesttesttestestestestestestsetes", "Lied 4", "Lied 5"];
  static List<IconData> icons = [Icons.play_arrow, Icons.play_arrow, Icons.play_arrow, Icons.play_arrow, Icons.play_arrow];

  @override
  _musicScreenState createState() => _musicScreenState();
}

class _musicScreenState extends State<musicScreen> {
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
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ],
            )
        ),
        child: ListView.builder(
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
                      Container(
                        width: 150,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            "${musicScreen.songs[index]}",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (isPlaying) {
                              _audioPlayer.stop();
                              isPlaying = false;
                              musicScreen.icons[index] = Icons.play_arrow;
                            } else {
                              _playFile(musicScreen.songs[index]);
                              isPlaying = true;
                              musicScreen.icons[index] = Icons.pause;

                            }
                          });
                        },
                        child: Icon(musicScreen.icons[index])
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
      ),
    );
  }
}
