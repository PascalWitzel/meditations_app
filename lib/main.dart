import 'package:flutter/material.dart';
import 'package:meditations_app/screens/menu_home.dart';
import 'package:meditations_app/themes/theme_notifier.dart';
import 'package:meditations_app/themes/theme_values.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(blueTheme), child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeNotifier.getTheme(),
      home: HomeScreen(),
    );
  }
}