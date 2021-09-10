import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditations_app/screens/favliste.dart';
import 'package:meditations_app/screens/meditation.dart';
import 'package:meditations_app/screens/menu_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'music_fav.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String name = "Name";
  String fav = "";

  List<String> images = [
    "assets/images/Download.jpg",
    "assets/images/Steinturm02.jpg",
    "assets/images/Meditation Berg.jpg",
    "assets/images/Meditation Ozean.jpg",
  ];

  var random = new Random();

  TextEditingController _controller = TextEditingController(text: "");

  Future<String> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String nameSP = prefs.getString('Name') ?? "Name";
    name = nameSP;
    return nameSP;
  }

  Future<String> getFav() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String favSP = prefs.getString('favourite') ?? "";
    fav = favSP;
    return favSP;
  }

  Future<void> setName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Name", name);
    print(name);
  }

  Future<void> setFav(String fav) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('favourite', fav);
  }

  @override
  void initState() {
    super.initState();
    getName().then((s) {
      setState(() {
        name = s;
      });
    });
    getFav().then((s) {
      setState(() {
        fav = s;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    if (name == "Name") {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop),
              image: AssetImage(images[random.nextInt(images.length - 1)]),
            ),
          ),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Text(
                  "Willkommen neuer Nutzer! \n Bitte sag uns wie du heißt",
                  style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.headline1.fontFamily,
                      fontSize: Theme.of(context).textTheme.headline1.fontSize,
                      color: Colors.black),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2.5,
                  ),
                ),
                child: Column(children: [
                  Padding(
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
                  ElevatedButton(
                    onPressed: () => {
                      setState(() {
                        setName(_controller.text);
                        getName();
                      }),
                    },
                    child: Text("Speichern"),
                  ),
                  SizedBox(height: 20.0)
                ]),
              )
            ]),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop),
              image: AssetImage(images[random.nextInt(images.length - 1)]),
            ),
          ),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Text(
                  "Willkommen " + name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.headline1.fontFamily,
                      fontSize: Theme.of(context).textTheme.headline1.fontSize,
                      color: Colors.black
                  ),
                ),
              ),
              buildMenuCrate(Icons.menu, "Meditation wählen", context,
                  MaterialPageRoute(builder: (context) => HomeScreen())),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  if (fav != "") {
                    String category = fav.split(" ")[0];
                    String length = fav.split(" ")[1];
                    String sound = fav.split(" ")[2];
                    print(sound);
                    if (sound.trim() == "Musik") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MusicFav(category, length)));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  meditationsScreen(category, length, sound)));
                    }
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => favlisteScreen()));
                  }
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black87, width: 2),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Icon(Icons.star_border, size: 45),
                        ),
                        Text(
                          "Favorit starten",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ]),
                ),
              ),
            ]),
          ),
        ),
      );
    }
  }
}
