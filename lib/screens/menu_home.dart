import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditations_app/painter/curve_painter.dart';
import 'package:meditations_app/routeAnimations/fade_route.dart';
import 'package:meditations_app/screens/appbar.dart';

import 'menu_duration.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarhome(context, "Meditation"),
      body: Container(
        child: CustomPaint(
          painter: CurvePainter(0.5, 0.3),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Text(
                  "Wähle die Kategorie deiner\nMeditation",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1,
                )),
                buildMenuCrate(Icons.timelapse, "Kurz", context, FadeRoute(page: MenuDuration("Kurz"))),
                buildMenuCrate(Icons.timelapse, "Mittel", context, FadeRoute(page: MenuDuration("Mittel"))),
                buildMenuCrate(Icons.timelapse, "Lang", context, FadeRoute(page: MenuDuration("Lang"))),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

Widget buildMenuCrate(IconData i, String text, context, route) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, route);
    },
    child: Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black87, width: 2),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Icon(i, size: 45),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ]),
    ),
  );
}
