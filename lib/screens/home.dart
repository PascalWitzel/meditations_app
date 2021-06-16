import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditations_app/screens/appbar.dart';

import 'menu_duration.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarhome(context, "Home"),
      body: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(child: Text("Wähle deine Meditation")),
              buildMenuCrate(Icons.timelapse, "Kurz", context, MenuDuration("Kurz")),
              buildMenuCrate(Icons.timelapse, "Mittel", context, MenuDuration("Mittel")),
              buildMenuCrate(Icons.timelapse, "Lang", context, MenuDuration("Lang")),
            ],
          ),
        ]
      ),
    );
  }
}

Widget buildMenuCrate(IconData i, String text, context, route) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => route)
      );
    },
    child: Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black87, width: 2),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(2.0, 2.0),
          )
        ],
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
          ]
      ),
    ),
  );
}
