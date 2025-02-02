import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quizbuz/Kids_mode/kids_mode_main_page.dart';
import 'package:quizbuz/menu_page.dart';
import 'package:quizbuz/question_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure that SharedPreferences is initialized
  unawaited(MobileAds.instance.initialize());
  var device = ["6C29B82811BA858E06EF0BC86400BE5B"];

  RequestConfiguration requestConfiguration = RequestConfiguration(testDeviceIds: device);
  MobileAds.instance.updateRequestConfiguration(requestConfiguration);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? _granted = prefs.getBool('granted');
  if (_granted == null) {
    prefs.setDouble('coins', 100.00);
    prefs.setInt('addtimelifeline', 5);//Time Adder lifeline
    prefs.setInt('tryagainlifeline', 5);//bonus Attempts
    prefs.setInt('freezetime', 5);
    prefs.setInt('skipquestion', 5);

    prefs.setBool('granted', true);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/Main_Page': (context) => Main_Page(),
        '/Kids_Main_Page': (context) => Kids_Mode_Main_page(),
        '/Question_Page': (context) => Question_Page(
              mode: "easy",
              round_name: "Time Buzz",
            )
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Main_Page(),
    );
  }
}
