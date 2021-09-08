import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meditations_app/screens/was_ist_meditation.dart';
import 'package:meditations_app/screens/wie_geht_meditation.dart';
import 'package:meditations_app/themes/theme_notifier.dart';
import 'package:meditations_app/themes/theme_values.dart';
import 'package:provider/provider.dart';
import 'appbar.dart';
import 'favliste.dart';
import 'package:shared_preferences/shared_preferences.dart';

class settingsScreen extends StatefulWidget {
  @override
  _settingsScreenState createState() => _settingsScreenState();
}

class _settingsScreenState extends State<settingsScreen> {
  TextEditingController _controller = TextEditingController(text: "");
  int anzMed = 0;
  int dauerMed = 0;
  List<String> images = [
    "assets/images/Download.jpg",
    "assets/images/Steinturm02.jpg",
    "assets/images/Meditation Berg.jpg",
    "assets/images/Meditation Ozean.jpg",
  ];
  var random = new Random();

  Future<void> _setStringSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Name", _controller.text);
  }

  Future<String> _getStringFromSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("Name") ?? "Test";
  }

  Future<int> _getIntSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      anzMed = prefs.getInt('anzahl') ?? -1;
    });
  }

  Future<int> _getDauerIntSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      dauerMed = prefs.getInt('dauer') ?? -1;
    });
  }

  @override
  void initState() {
    super.initState();
    _getStringFromSharedPref().then((s) {
      _controller.text = s;
    });
    _getIntSharedPref();
    _getDauerIntSharedPref();
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: appbarSetting(context, "Settings"),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage(images[random.nextInt(images.length - 1)]),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2.0,
                    ),
                  ),
                  child: Column(children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          margin: EdgeInsets.only(top: 5.0),
                          width: 320,
                          child: TextField(
                            controller: _controller,
                            maxLength: 25,
                            decoration: InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(),
                                hintText: 'Name',
                                focusColor: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 120,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () => {
                              _controller.text,
                              _setStringSharedPref(),
                            },
                            child: Text("Speichern"),
                          ),
                        ),
                        Container(
                          width: 120,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () => {
                              _controller.text = "Name",
                              _setStringSharedPref(),
                            },
                            child: Text("Verwerfen"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0)
                  ]),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 0.0, top: 15.0, right: 0.0, bottom: 15.0),
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
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2.0,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 0.0, top: 10.0, right: 0.0, bottom: 10.0),
                      child: Text(
                        "Farbauswahl",
                        style: TextStyle(
                          fontSize: 20,
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
                            onPressed: () {
                              themeNotifier.setTheme(blueTheme, "blueTheme");
                            },
                            child: _getIcon(themeNotifier, blueTheme),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              shape: CircleBorder(),
                            ),
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              themeNotifier.setTheme(orangeTheme, "orangeTheme");
                            },
                            child: _getIcon(themeNotifier, orangeTheme),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              shape: CircleBorder(),
                            ),
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              themeNotifier.setTheme(greenTheme, "greenTheme");
                            },
                            child: _getIcon(themeNotifier, greenTheme),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.lightGreen,
                              shape: CircleBorder(),
                            ),
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              themeNotifier.setTheme(purpleTheme, "purpleTheme");
                            },
                            child: _getIcon(themeNotifier, purpleTheme),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple,
                              shape: CircleBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 0.5, color: Colors.black),
                      ),
                    ),
                    margin: EdgeInsets.only(
                        left: 0.0, top: 20.0, right: 0.0, bottom: 0.0),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Anzahl der Meditationen: $anzMed",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 0.5, color: Colors.black),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Insgesamte Dauer: $dauerMed",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 170,
                        height: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => wasIstMeditation()));
                          },
                          child: Text("Was ist Meditation?"),
                        ),
                      ),
                      Container(
                        width: 170,
                        height: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => wieGehtMeditation()));
                          },
                          child: Text("Wie geht Meditation?"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getIcon(ThemeNotifier themeNotifier, buttonThemeData) {
    bool selected = (themeNotifier.getTheme() == buttonThemeData);

    return Container(
      key: Key((selected) ? "ON" : "OFF"),
      child: Icon(
        (selected) ? Icons.done : Icons.close,
        color: Theme.of(context).textTheme.headline1.color,
        size: 20.0,
      ),
    );
  }
}
