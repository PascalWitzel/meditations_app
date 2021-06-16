import 'package:flutter/material.dart';
import 'package:meditations_app/screens/appbar.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarhome(context, "Home"),
    );
  }
}
