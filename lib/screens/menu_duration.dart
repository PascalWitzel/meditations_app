import 'package:flutter/material.dart';
import 'package:meditations_app/painter/curve_painter.dart';
import 'package:meditations_app/routeAnimations/fade_route.dart';
import 'package:meditations_app/screens/appbar.dart';

import 'menu_home.dart';
import 'menu_sound.dart';

class MenuDuration extends StatelessWidget {

  String title;
  List<String> times = [];

  MenuDuration(String t) {
    this.title = t;
  }

  @override
  Widget build(BuildContext context) {
    if(title == "Kurz"){
      times.add("3:00");
      times.add("5:00");
      times.add("7:00");
    } else if(title == "Mittel") {
      times.add("10:00");
      times.add("15:00");
      times.add("30:00");
    } else if(title == "Lang") {
      times.add("60:00");
      times.add("90:00");
      times.add("120:00");
    }
    return Scaffold(
      appBar: appbarback(context, title),
      body: CustomPaint(
        painter: CurvePainter(0.7, 0.5),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(child: Text(
                      "Wähle die Länge der Meditation\n",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1
                  )),
                  buildMenuCrate(Icons.timelapse, times[0], context, FadeRoute(page: MenuSound(title + " - " + times[0]))),
                  buildMenuCrate(Icons.timelapse, times[1], context, FadeRoute(page: MenuSound(title + " - " + times[1]))),
                  buildMenuCrate(Icons.timelapse, times[2], context, FadeRoute(page: MenuSound(title + " - " + times[2]))),
                ],
              ),
            ]
        ),
      ),
    );
  }
}
