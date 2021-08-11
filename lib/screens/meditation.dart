import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'appbar.dart';
import 'dart:math' as math;

class meditationsScreen extends StatefulWidget {
  String category;
  String duration;
  String sound;
  String med;

  meditationsScreen(String c, String d, String e) {
    this.category = c;
    this.duration = d.split(":")[0];
    this.sound = e;
    med = category + ' ' + duration + ' ' + sound;
    _meditationsScreenState(med, category);
  }

  @override
  _meditationsScreenState createState() =>
      _meditationsScreenState(med, category);
}

class _meditationsScreenState extends State<meditationsScreen>
    with TickerProviderStateMixin {
  String mName = "Name der Meditation";
  String set = "";
  String setFavMedWMed = "favourite";
  String getFavMedWMed = "";

  _meditationsScreenState(String a, String b) {
    this.set = a;
    this.mName = b;
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

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(minutes: int.parse(widget.duration)),
    );
    controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);
    _getStringFromSharedPref().then((s) {
      getFavMedWMed = s;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarende(context, "Meditation"),
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
                                  if (controller.isDismissed) {
                                    return new Text(
                                      "Meditation beendet",
                                      style: TextStyle(fontSize: 50),
                                      textAlign: TextAlign.center,
                                    );
                                  } else {
                                    return new Text(
                                      "Meditation pausiert",
                                      style: TextStyle(fontSize: 50),
                                      textAlign: TextAlign.center,
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
                              });
                            } else {
                              controller.reverse(
                                  from: controller.value == 0.0
                                      ? 1.0
                                      : controller.value);
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    child: FittedBox(
                      child: FloatingActionButton(
                          onPressed: () => {
                                setFavMedWMed = set,
                                _setStringSharedPref(),
                                print("Done"),
                              },
                          child: new Icon(
                              _getStringFromSharedPref() == getFavMedWMed
                                  ? Icons.favorite
                                  : Icons.favorite_border)),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () => {
                          _getStringFromSharedPref(),
                          print(getFavMedWMed),
                        },
                      )),
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
      ..strokeWidth = 10.0
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
