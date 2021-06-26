import 'package:flutter/material.dart';
import 'appbar.dart';
import 'favliste.dart';

class settingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarback(context, "Settings"),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                margin: EdgeInsets.only(
                    left: 0.0, top: 20.0, right: 0.0, bottom: 0.0),
                width: 320,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => favlisteScreen()));
                  },
                  child: Text("Favoriten"),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                margin: EdgeInsets.only(
                    left: 0.0, top: 20.0, right: 0.0, bottom: 0.0),
                width: 320,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Name'),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 120,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Speichern"),
                ),
              ),
              Container(
                width: 120,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Verwerfen"),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              margin: EdgeInsets.only(
                  left: 0.0, top: 20.0, right: 0.0, bottom: 0.0),
              child: Text(
                "Farbauswahl",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("1"),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                  ),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("2"),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                  ),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("3"),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                  ),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("4"),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 0.0, top: 20.0, right: 0.0, bottom: 0.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Statistik 1",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Statistik 2",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Statistik 3",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Statistik 4",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Statistik 5",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
