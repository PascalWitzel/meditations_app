import 'package:flutter/material.dart';
import 'package:meditations_app/screens/appbar.dart';

import 'meditation.dart';

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
    TextStyle confirmText = TextStyle(fontFamily: Theme.of(context).textTheme.headline1.fontFamily, fontSize: 18);
    return Scaffold(
      appBar: appbarback(context, "Bestätigen"),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ],
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black87, width: 2.5),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.category, size: 30,),
                        Icon(Icons.timelapse, size: 30,),
                        Icon(Icons.volume_up, size: 30,),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(category, style: confirmText),
                        Text(length, style: confirmText),
                        Text(sound, style: confirmText),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => meditationsScreen(category, length, sound)));
                  }, child: Text("Starten" ,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                )
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(onPressed: () {
                Navigator.pop(context);
              }, child: Text("Zurück")),
            ],
            ),
          ]
        ),
      ),
    );
  }
}
