import 'package:flutter/material.dart';
import 'package:meditations_app/screens/meditation.dart';

import 'appbar.dart';
import 'music_auswahl.dart';

class MusicFav extends StatefulWidget {

  String category;
  String length;

  MusicFav(String c, String l) {
    this.category = c;
    this.length = l;
  }

  @override
  _MusicFavState createState() => _MusicFavState();
}

class _MusicFavState extends State<MusicFav> {
  var play = new List.filled(musicScreen.songs.length, 1);
  var musik = new List.filled(musicScreen.songs.length, Icon(Icons.play_arrow));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarback(context, "Wähle das Lied"),
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
                    Text("${musicScreen.songs[index]}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 50,),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          play[index]++;
                          print(play);
                          if(play[index] % 2 == 0) {
                            musik[index] = Icon(Icons.pause);
                          } else {
                            musik[index] = Icon(Icons.play_arrow);
                          }
                        });
                      },
                      child: musik[index],
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => meditationsScreen(widget.category, widget.length, musicScreen.songs[index])));
                      },
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
