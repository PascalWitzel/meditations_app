import 'package:flutter/material.dart';
import 'package:meditations_app/screens/welcome_screen.dart';
import 'package:meditations_app/themes/theme_notifier.dart';
import 'package:meditations_app/themes/theme_values.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String themeString = prefs.getString('theme') ?? "orangeTheme";
  ThemeData theme;
  if(themeString == "orangeTheme"){
    theme = orangeTheme;
  } else if(themeString == "greenTheme"){
    theme = greenTheme;
  } else if(themeString == "purpleTheme"){
    theme = purpleTheme;
  } else {
    theme = blueTheme;
  }
  runApp(ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(theme), child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    themeNotifier.getThemeSP();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeNotifier.getTheme(),
      home: WelcomeScreen(),
    );
  }
}