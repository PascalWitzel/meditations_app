import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditations_app/screens/settingsScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;

import 'menu_home.dart';

class meditationsScreen extends StatefulWidget {
  String category;
  String duration;
  String sound;
  String med;

  meditationsScreen(String c, String d, String e) {
    this.category = c;
    this.duration = d.split(":")[0];
    this.sound = e;
    med = category + ' ' + d + ' ' + sound;
    _meditationsScreenState(med, category, duration, sound);
  }

  @override
  _meditationsScreenState createState() =>
      _meditationsScreenState(med, category, duration, sound);
}

class _meditationsScreenState extends State<meditationsScreen>
    with TickerProviderStateMixin {
  String mName = "";
  String set = "";
  String du = "";
  String setFavMedWMed = "favourite";
  String getFavMedWMed = "";
  int sAnzMed = 0;
  int sDauerMed = 0;
  int gAnzMed = 0;
  int gDauerMed = 0;
  int aktuelleDauer = 0;
  bool einmalig = true;
  bool visibility = true;

  AudioPlayer _audioPlayer = AudioPlayer();
  static AudioCache _audioCache = AudioCache(prefix: 'assets/sounds/');
  String audio = "";


  _meditationsScreenState(String a, String b, String c, String d) {
    this.set = a;
    this.mName = b;
    this.du = c;
    this.audio = d;
  }

  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    if (controller.isAnimating) {
      if (duration.inHours < 1) {
        return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
      } else {
        return '${duration.inHours}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
      }
    }
  }

  Future<void> _setStringSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('favourite', setFavMedWMed);
  }

  Future<String> _getStringFromSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    getFavMedWMed = prefs.getString('favourite') ?? "Nööö";
    return getFavMedWMed;
  }

  Future<void> _setIntSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('anzahl', sAnzMed);
  }

  Future<void> _setDauerIntSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('dauer', sDauerMed);
  }

  Future<int> _getIntSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    gAnzMed = prefs.getInt('anzahl') ?? 0;
    return gAnzMed;
  }

  Future<int> _getDauerIntSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    gDauerMed = prefs.getInt('dauer') ?? 0;
    return gDauerMed;
  }

  void statistik() {
    if (controller.isDismissed && einmalig == true) {
      _getIntSharedPref();
      if (gAnzMed == null) {
        sAnzMed = 1;
      } else {
        sAnzMed = gAnzMed + 1;
      }
      _setIntSharedPref();
      print(sAnzMed);
      _getDauerIntSharedPref();
      aktuelleDauer = int.parse(du);
      if (gDauerMed == null) {
        sDauerMed = aktuelleDauer;
      } else {
        sDauerMed = gDauerMed + aktuelleDauer;
      }
      print(sDauerMed);
      _setDauerIntSharedPref();
      einmalig = false;
    }
  }

  void _playFile() async{
    _audioPlayer = await _audioCache.loop(audio + ".mp3");
  }

  void _stopFile() {
    _audioPlayer?.stop();
  }

  void _visible() async{
    visibility = false;
  }
  @override
  void initState() {

    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(minutes: int.parse(widget.duration)),
    );
    controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);
    einmalig = true;
    _getStringFromSharedPref().then((s) {
      setState(() {
        getFavMedWMed = s;
      });
    });
    _getIntSharedPref().then((a) {
      gAnzMed = a;
    });
    _getDauerIntSharedPref().then((d) {
      gDauerMed = d;
    });
    _playFile();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Meditation",
        ),
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () async {
            setState(() {
              controller.stop();
              _audioPlayer.pause();
            });
            if (!controller.isDismissed) {
              if (await confirm(
                context,
                title: Text('Meditation beenden'),
                content: Text('Willst du die Meditation wirklich abbrechen?'),
                textOK: Text('Ja'),
                textCancel: Text('Nein'),

              )) {
                setState(() {
                  _stopFile();
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              } else {
                controller.reverse(
                    from: controller.value == 0.0
                        ? 1.0
                        : controller.value);
                einmalig = true;
                _audioPlayer.resume();
              }
            } else {
              if (await confirm(
                context,
                title: Text('Meditation beendet'),
                content: Text('Willst du zum Meditationsmenü zurück?'),
                textOK: Text('Ja'),
                textCancel: Text('Nein'),

              )) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              } else {
              }
            }
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              child: Icon(Icons.settings),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => settingsScreen()));
              },
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.dstATop),
            image: AssetImage("assets/images/Download.jpg"),
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  mName,
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Container(
              width: 300,
              height: 300,
              child: Center(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: AnimatedBuilder(
                          animation: controller,
                          builder: (BuildContext context, Widget child) {
                            return new CustomPaint(
                                painter: TimerPainter(
                              animation: controller,
                              backgroundColor: Colors.white,
                              color: Theme.of(context).primaryColor,
                            ));
                          },
                        ),
                      ),
                      Center(
                        child: Center(
                          child: AnimatedBuilder(
                              animation: controller,
                              builder: (BuildContext context, Widget child) {
                                if (controller.isAnimating) {
                                  return new Text(
                                    timerString,
                                    style: TextStyle(fontSize: 70),
                                  );
                                } else {
                                  statistik();
                                  if (controller.isDismissed) {
                                    _stopFile();
                                    _visible();
                                    return new Text(
                                      "Meditation beendet",
                                      style: TextStyle(fontSize: 50),
                                      textAlign: TextAlign.center,
                                    );
                                  } else {
                                    return new Icon(
                                        Icons.pause,
                                      size: 120,
                                    );
                                  }
                                }
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                  ),

                  Column(
                    children: [
                      if (visibility) ... [
                      Container(
                        width: 75,
                        height: 75,
                        child: FittedBox(
                          child: FloatingActionButton(
                            child: AnimatedBuilder(
                                animation: controller,
                                builder: (BuildContext context, Widget child) {
                                  return new Icon(controller.isAnimating
                                      ? Icons.pause
                                      : Icons.play_arrow);
                                }),
                            onPressed: () {
                              setState(() {
                                if (controller.isAnimating) {
                                  setState(() {
                                    controller.stop();
                                    _audioPlayer.pause();
                                  });
                                } else {
                                  controller.reverse(
                                      from: controller.value == 0.0
                                          ? 1.0
                                          : controller.value);
                                  einmalig = true;
                                  _audioPlayer.resume();
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      ] else ... [
                        Container(
                          width: 75,
                          height: 75,
                          child: FittedBox(
                            child: FloatingActionButton(
                              child: Icon(
                                  Icons.home,
                                  ),
                              onPressed: () {
                                setState(() {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                                });
                              },
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                  Column(
                    children: [
                      if (!visibility) ... [
                      Container(
                        width: 50,
                        height: 50,
                        child: FittedBox(
                          child: FloatingActionButton(
                              onPressed: () => {
                                setState(() {
                                  visibility = true;
                                }),
                                controller.reverse(
                                  from: controller.value == 0.0
                                  ? 1.0
                                  : controller.value
                                ),
                                einmalig = true,
                                _audioPlayer.resume(),
                              },
                              child: new Icon(
                                  Icons.settings_backup_restore,
                              ),
                          ),
                        ),
                      ),
                      ] else ... [
                          Container(
                          width: 50,
                          height: 50,
                          child: FittedBox(
                            child: FloatingActionButton(
                                onPressed: () => {
                                  setState(() {
                                    setFavMedWMed = set;
                                    _setStringSharedPref();
                                    _getStringFromSharedPref();
                                  })
                                },
                                child: new Icon(
                                    set == getFavMedWMed
                                        ? Icons.favorite
                                        : Icons.favorite_border)),
                          ),
                        ),
                      ]
                    ]
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 15.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
