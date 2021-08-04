import 'package:flutter/material.dart';

import 'appbar.dart';
import 'confirm_screen.dart';

class musicScreen extends StatefulWidget {
  String title;

  musicScreen(String t) {
    this.title = t;
  }

  @override
  _musicScreenState createState() => _musicScreenState();
}

class _musicScreenState extends State<musicScreen> {
  Icon musik = Icon(Icons.play_arrow);

  List<String> songs = [
    "Lied 1",
    "Lied 2",
    "Lied 3",
    "Lied 4",
    "Lied 5"
  ];

  int play = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarback(context, widget.title),
      body: ListView.builder(
        itemCount: songs.length,
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
                  Text("${songs[index]}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 50,),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        play++;
                        if(play % 2 == 0) {
                          musik = Icon(Icons.pause);
                        } else {
                          musik = Icon(Icons.play_arrow);
                        }
                      });
                    },
                    child: musik,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmScreen(widget.title + " - " + songs[index])));
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
