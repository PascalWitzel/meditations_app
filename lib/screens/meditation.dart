import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';

class meditationsScreen extends StatefulWidget {
  @override
  _meditationsScreenState createState() => _meditationsScreenState();
}

class _meditationsScreenState extends State<meditationsScreen> {

  String mName = "Name der Meditation";
  double mFortschritt = 1;
  int mDauer = 120;

  int pTimer = 0;
  int mDauerInsgesamt = 120;
  int sekundenDauer = 0;
  int minutenDauer = 0;
  Timer timer;

  void startTimer() {
    if (timer != null) {
      timer.cancel();
    }
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(pTimer % 2 == 0) {
          Icon playTimer = Icon(Icons.play_arrow);
          if (mDauer > 0) {
            mDauer--;
          } else {
            timer.cancel();
          }
        } else {
          Icon playTimer = Icon(Icons.pause);
          timer.cancel();
        }
        //mFortschritt = (mDauerInsgesamt / mDauer / mDauerInsgesamt) as double;
      });
    });
  }

  /*void umrechnen() {
    minutenDauer = mDauer % 60;
    sekundenDauer = mDauer - (minutenDauer * 60);
  }*/

  @override
  Widget build(BuildContext context) {
    Icon playTimer = Icon(Icons.play_arrow);
    return Scaffold(
      appBar: appbarende(context, "Meditation"),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.dstATop),
            image: AssetImage("assets/images/Download.jpg"),
          ),
        ),
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(
                    left: 0.0, top: 60.0, right: 0.0, bottom: 0.0),
                child: (mDauer > 0)
                    ? Text("")
                    : Text(
                        "Done!",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
              ),
            ),
            SizedBox(
              height: 450.0,
              width: 300.0,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: 250,
                      height: 250,
                      child: new CircularProgressIndicator(
                        strokeWidth: 30,
                        value: mFortschritt,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '$mDauer',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                ),
                Container(
                  width: 80,
                  height: 80,
                  child: ElevatedButton(
                      onPressed: () => startTimer(),
                      child: playTimer),
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {}, child: Icon(Icons.favorite_border)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
