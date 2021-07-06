import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'appbar.dart';

class meditationsScreen extends StatefulWidget {
  @override
  _meditationsScreenState createState() => _meditationsScreenState();
}

class _meditationsScreenState extends State<meditationsScreen> {
  String mName = "Name der Meditation";
  double mFortschritt = 1;
  int mDauer = 120;

  GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Icon playTimer = Icon(Icons.pause);
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
                    child: SlideCountdownClock(
                      duration: Duration(
                        seconds: mDauer,
                      ),
                      separator: ':',
                      textStyle:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                      separatorTextStyle: TextStyle(
                          fontSize: 36, fontWeight: FontWeight.normal),

                      onDone: () => _key.currentState.showSnackBar(
                          SnackBar(content: Text('Meditation beendet'))),
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
                    //onPressed: () =>  startTimer(),
                    child: playTimer,
                  ),
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
