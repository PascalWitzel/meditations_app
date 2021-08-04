import 'package:flutter/material.dart';
import 'appbar.dart';

class wasIstMeditation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarback(context, "Was ist Meditation"),
      body: Center(
        child: Text(
          "Meditation ist gut"
        ),
      ),
    );
  }
}
