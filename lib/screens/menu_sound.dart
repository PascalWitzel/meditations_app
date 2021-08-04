import 'package:flutter/material.dart';
import 'package:meditations_app/painter/curve_painter.dart';
import 'package:meditations_app/screens/appbar.dart';

import 'confirm_screen.dart';
import 'menu_home.dart';
import 'music_auswahl.dart';

class MenuSound extends StatelessWidget {

  String title;

  MenuSound(String t) {
    this.title = t;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarback(context, title),
      body: CustomPaint(
        painter: CurvePainter(0.9, 0.7, context),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(child: Text(
                      "Wähle den Ton während\nder Meditation",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1
                  )),
                  buildMenuCrate(Icons.volume_off, "Stumm", context, MaterialPageRoute(builder: (context) => ConfirmScreen(title + " - " + "Stumm"))),
                  buildMenuCrate(Icons.speaker_notes, "Anleitung", context, MaterialPageRoute(builder: (context) => ConfirmScreen(title + " - " + "Anleitung"))),
                  buildMenuCrate(Icons.music_note, "Musik", context, MaterialPageRoute(builder: (context) => musicScreen(title))),
                ],
              ),
            ]
        ),
      ),
    );
  }
}