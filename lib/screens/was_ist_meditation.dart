import 'dart:math';

import 'package:flutter/material.dart';
import 'appbar.dart';

class wasIstMeditation extends StatelessWidget {

  List<String> images = [
    "assets/images/Download.jpg",
    "assets/images/Steinturm02.jpg",
    "assets/images/Meditation Berg.jpg",
    "assets/images/Meditation Ozean.jpg",
  ];
  var random = new Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarback(context, "Was ist Meditation"),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage(images[random.nextInt(images.length - 1)]),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  "Der Begriff Meditation lässt sich vom lateinischen 'meditatio' (das Nachdenken über) bzw. 'medio' (die Mitte) ableiten und steht unter anderem für mentale Versenkung. Meditation ist eine spirituelle Praxis, die durch Konzentrationsübungen tiefe Entspannung und veränderte Bewusstseinszustände erreichen kann.",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: Theme.of(context).textTheme.headline1.fontFamily,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Image(image: AssetImage("assets/images/Meditation Berg.jpg")),
                ),
                Text(
                  "Ziel ist die Stille oder auch innere Leere, das Freisein von jeglichen Gedanken. In religiöser Hinsicht will man die Erleuchtung erlangen, das 'Eins-Sein mit dem Ganzen'.",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: Theme.of(context).textTheme.headline1.fontFamily,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
