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
  String setFavMed = "";
  String getFavMed = "";


  Future<void> _setStringSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('favourite', setFavMed);
  }

  Future<String> _getStringFromSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    getFavMed = prefs.getString('favourite') ?? "nop";
    return getFavMed;
  }

  @override
  void initState() {
    super.initState();
    _getStringFromSharedPref().then((s) {
      getFavMed = s;
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
                      setFavMed = "Kurz 3:00 Stumm",
                      _setStringSharedPref(),
                      print("Done1"),
                    },
                    child: new Icon(_getStringFromSharedPref() == "Kurz 3:00 Stumm"
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
                      setFavMed = "Kurz 5:00 Stumm",
                      _setStringSharedPref(),
                      print("Done2"),
                    },
                    child: new Icon(_getStringFromSharedPref() == "Kurz 5:00 Stumm"
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
                      setFavMed = "Kurz 7:00 Stumm",
                      _setStringSharedPref(),
                      print("Done3"),
                    },
                    child: new Icon(_getStringFromSharedPref() == "Kurz 7:00 Stumm"
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
                print(getFavMed),
              },
            ),
          ),
        ],
      ),
    );
  }
}


