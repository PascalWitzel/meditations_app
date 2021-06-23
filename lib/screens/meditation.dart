import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';

class meditationsScreen extends StatelessWidget {
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
                    left: 0.0, top: 50.0, right: 0.0, bottom: 0.0),
                child: Text(
                  mName,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                    left: 0.0, top: 230.0, right: 0.0, bottom: 0.0),
                child: CircularProgressIndicator(
                  strokeWidth: 200,
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
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: MediaQuery. of(context). size. width / 2.3, top: 150.0, right: 0.0, bottom: 0.0),
                  child: ElevatedButton(
                      onPressed: () {}, child: Icon(Icons.pause)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50.0, top: 150.0, right: 0.0, bottom: 0.0),
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
