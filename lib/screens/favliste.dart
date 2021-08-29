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
  Icon fav;

  List<String> favorites = [
    "Kurz 3:00 Stumm",
    "Kurz 3:00 Anleitung",
    "Kurz 3:00 Musik",
    "Kurz 5:00 Stumm",
    "Kurz 5:00 Anleitung",
    "Kurz 5:00 Musik",
    "Kurz 7:00 Stumm",
    "Kurz 7:00 Anleitung",
    "Kurz 7:00 Musik",
    "Mittel 10:00 Stumm",
    "Mittel 10:00 Anleitung",
    "Mittel 10:00 Musik",
    "Mittel 15:00 Stumm",
    "Mittel 15:00 Anleitung",
    "Mittel 15:00 Musik",
    "Mittel 30:00 Stumm",
    "Mittel 30:00 Anleitung",
    "Mittel 30:00 Musik",
    "Lang 60:00 Stumm",
    "Lang 60:00 Anleitung",
    "Lang 60:00 Musik",
    "Lang 90:00 Stumm",
    "Lang 90:00 Anleitung",
    "Lang 90:00 Musik",
    "Lang 120:00 Stumm",
    "Lang 120:00 Anleitung",
    "Lang 120:00 Musik",
  ];

  Future<void> _setStringSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('favourite', setFavMed);
  }

  Future<String> _getStringFromSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      getFavMed = prefs.getString('favourite') ?? "nop";
    });
    return getFavMed;
  }

  @override
  void initState() {
    super.initState();
    _getStringFromSharedPref().then((s) {
      getFavMed = s;
    });
  }

  void buttonSetzen(index) {
    _getStringFromSharedPref();
    fav = new Icon(
        getFavMed != favorites[index] ? Icons.favorite_border : Icons.favorite);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarback(context, "Favoriten"),
      body: ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            buttonSetzen(index);
            return Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.5, color: Colors.black),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      favorites[index],
                      style: TextStyle(
                        fontSize: 20,
                        wordSpacing: 30,
                      ),
                    ),
                    Container(
                      width: 50,
                      child: ElevatedButton(
                          onPressed: () => {
                                setState(() {
                                  setFavMed = favorites[index];
                                  _setStringSharedPref();
                                  _getStringFromSharedPref();
                                }),
                              },
                          child: fav),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
