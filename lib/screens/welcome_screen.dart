import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditations_app/screens/favliste.dart';
import 'package:meditations_app/screens/meditation.dart';
import 'package:meditations_app/screens/menu_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String name = "Name";
  String fav = "";

  TextEditingController _controller = TextEditingController(text: "Test");

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
    if(name == "Name"){
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop),
              image: AssetImage("assets/images/Download.jpg"),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    "Willkommen neuer Nutzer! \n Bitte sag uns wie du heißt",
                    style: TextStyle(
                        fontFamily: Theme.of(context).textTheme.headline1.fontFamily,
                        fontSize: Theme.of(context).textTheme.headline1.fontSize,
                        color: Colors.black
                    ),
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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          margin: EdgeInsets.only(top: 5.0),
                          width: 320,
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(), hintText: 'Name', focusColor: Theme.of(context).primaryColor),
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
                ]
            ),
          ),
        ),
      );
    } else {
      MaterialPageRoute favRoute;
      if(fav != ""){
        favRoute = MaterialPageRoute(builder: (context) => meditationsScreen(fav.split(" ")[0], fav.split(" ")[1], fav.split(" ")[2]));
      } else {
        favRoute = MaterialPageRoute(builder: (context) => favlisteScreen());
      }
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop),
              image: AssetImage("assets/images/Download.jpg"),
            ),
          ),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      "Willkommen " + name,
                      style: TextStyle(
                        fontFamily: Theme.of(context).textTheme.headline1.fontFamily,
                        fontSize: Theme.of(context).textTheme.headline1.fontSize,
                        color: Colors.black
                      ),
                    ),
                  ),
                  buildMenuCrate(Icons.menu, "Meditation wählen", context, MaterialPageRoute(builder: (context) => HomeScreen())),
                  SizedBox(height: 20),
                  buildMenuCrate(Icons.star, "Favorit starten", context, favRoute),
                  ElevatedButton(
                    onPressed: () => {
                      setState(() {
                        setName("Name");
                        getName();
                      }),
                    },
                    child: Text("Namen löschen"),
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      setState(() {
                        setFav("");
                        getFav();
                      }),
                    },
                    child: Text("Fav löschen"),
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      setState(() {
                        setFav("Kurz 3:00 Stumm");
                        getFav();
                      }),
                    },
                    child: Text("Fav setzen"),
                  ),
                ]
            ),
          ),
        ),
      );
    }
  }
}
