import 'package:flutter/material.dart';
import 'appbar.dart';

class favlisteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarback(context, "Favoriten"),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.5, color: Colors.black),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Länge",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Dauer",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Ton",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Container(
                  width: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.favorite_border),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.5, color: Colors.black),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Länge",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Dauer",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Ton",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Container(
                  width: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.favorite_border),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.5, color: Colors.black),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Länge",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Dauer",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Ton",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Container(
                  width: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.favorite_border),
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


