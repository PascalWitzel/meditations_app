import 'package:flutter/material.dart';

import 'appbar.dart';

class musicScreen extends StatelessWidget {
  Icon musik = Icon(Icons.play_arrow);
  int play = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarback(context, "Favoriten"),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.5, color: Colors.black),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Lied 1",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    play++;
                    if(play % 2 == 0) {
                      musik = Icon(Icons.pause);
                    } else {
                      musik = Icon(Icons.play_arrow);
                    }
                  },
                  child: musik,
                ),
                ElevatedButton(
                onPressed: () {},
                  child: Icon(Icons.favorite_border),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
