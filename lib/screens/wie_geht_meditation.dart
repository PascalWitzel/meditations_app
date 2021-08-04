import 'package:flutter/material.dart';
import 'appbar.dart';

class wieGehtMeditation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarback(context, "Wie geht Meditation"),
      body: Center(
        child: Text(
          "Mediation geht einfach"
        ),
      ),
    );
  }
}
