import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';

class meditationsScreen extends StatefulWidget {
  @override
  _meditationsScreenState createState() => _meditationsScreenState();
}

class _meditationsScreenState extends State<meditationsScreen> {
  String mName = "Name der Meditation";
  double mFortschritt = 0.7;
  String mDauer = "3:00";

  @override
  Widget build(BuildContext context) {
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
                child: Text(
                  mName,
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
                      mDauer,
                      style: TextStyle(
                        fontSize: 40,
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
                        onPressed: () {}, child: Icon(Icons.pause)),
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
