import 'package:flutter/material.dart';
import 'appbar.dart';

class favlisteScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarback(context, "Favoriten"),
    );
  }
}
