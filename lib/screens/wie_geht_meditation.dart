import 'package:flutter/material.dart';
import 'appbar.dart';

class wieGehtMeditation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarback(context, "Wie geht Meditation"),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  "Es gibt zwei verschiedene (äußere) Arten der Meditation: Bei der passiven Meditation sitzt oder liegst du ohne dich zu bewegen. Bei der aktiven Meditation hingegen führst du körperliche Übungen aus. Das kann einfaches Gehen sein, aber ebenso Yoga und bestimmte Kampfkunststile umfassen. Auch das Beten oder Aufsagen von Affirmation (Glaubenssätze) und Mantras gehört dazu.",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: Theme.of(context).textTheme.headline1.fontFamily,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Image(image: AssetImage("assets/images/yogasunset.jpg")),
                ),
                Text(
                  "Essenzieller Kern jeder Form der Meditation ist die Bündelung der Aufmerksamkeit. Dabei kannst du dich auf verschiedene Objekte konzentrieren: deine Atmung, körperliche Empfindungen, Emotionen, Gerüche, Geräusche oder ein Bild vor deinem geistigen Auge.",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: Theme.of(context).textTheme.headline1.fontFamily,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Image(image: AssetImage("assets/images/Steinturm03.jpg")),
                ),
                Text(
                  "Das Ziel der Meditation ist es, deinen Geist zu fokussieren und dadurch zu beruhigen. Wenn du über einen längeren Zeitraum regelmäßig meditierst, wirst du den Fortschritt spüren. Gesundheit und Immunsystem werden gestärkt, du fühlst dich weniger gestresst und bist ausgeglichener. Ein weiterer positiver Effekt: Konzentrationsfähigkeit und Kreativität steigen.",
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
