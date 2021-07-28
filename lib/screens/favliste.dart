import 'package:flutter/material.dart';
import 'appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class favlisteScreen extends StatefulWidget {
  @override
  _favlisteScreenState createState() => _favlisteScreenState();
}

class _favlisteScreenState extends State<favlisteScreen> {
  String category = "";
  String length = "";
  String sound = "";
  String favMed = "";
  int icon = 0;


  Future<void> _setStringSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("favMed", favMed);
  }

  Future<String> _getStringFromSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("favMed") ?? "Test";
  }

  @override
  void initState() {
    super.initState();
    _getStringFromSharedPref().then((s) {
      favMed = s;
    });
  }

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
                  "Kurz 3:00 Stumm",
                  style: TextStyle(
                    fontSize: 20,
                    wordSpacing: 30,
                  ),
                ),
                Container(
                  width: 50,
                  child: ElevatedButton(
                    onPressed: () => {
                      favMed = "Kurz 3:00 Stumm",
                      _setStringSharedPref(),
                      print("Done1"),
                      icon = 1,
                    },
                    child: new Icon(icon == 1
                      ? Icons.favorite
                      : Icons.favorite_border),
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
                  "Kurz 5:00 Stumm",
                  style: TextStyle(
                    fontSize: 20,
                    wordSpacing: 30,
                  ),
                ),
                Container(
                  width: 50,
                  child: ElevatedButton(
                    onPressed: () => {
                      favMed = "Kurz 5:00 Stumm",
                      _setStringSharedPref(),
                      print("Done2"),
                      icon = 2,
                    },
                    child: new Icon(icon == 2
                        ? Icons.favorite
                        : Icons.favorite_border),
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
                  "Kurz 7:00 Stumm",
                  style: TextStyle(
                    fontSize: 20,
                    wordSpacing: 30,
                  ),
                ),
                Container(
                  width: 50,
                  child: ElevatedButton(
                    onPressed: () => {
                      favMed = "Kurz 7:00 Stumm",
                      _setStringSharedPref(),
                      print("Done3"),
                      icon = 3,
                    },
                    child: new Icon(icon == 3
                        ? Icons.favorite
                        : Icons.favorite_border),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => {
                _getStringFromSharedPref(),
                print(favMed),
              },
            ),
          ),
        ],
      ),
    );
  }
}


