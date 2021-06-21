import 'package:flutter/material.dart';
import 'package:meditations_app/screens/appbar.dart';

class ConfirmScreen extends StatelessWidget {

  String title = " ";
  String category = " ";
  String length = " ";
  String sound = " ";

  ConfirmScreen(String t) {
    this.title = t;
    List<String> split = title.split("-");
    category = split[0].trim();
    length = split[1].trim();
    sound = split[2].trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarback(context, "Bestätigen"),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.category),
                      Icon(Icons.timelapse),
                      Icon(Icons.headphones),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(category),
                      Text(length),
                      Text(sound),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Starten")),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text("Zurück")),
          ],
          ),
        ]
      ),
    );
  }
}
