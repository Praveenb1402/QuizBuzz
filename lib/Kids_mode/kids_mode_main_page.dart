import 'package:flutter/material.dart';
import 'package:quizbuz/Kids_mode/gest_buttons_kids_mode/gest_who_am_I.dart';

class Kids_Mode_Main_page extends StatefulWidget {
  const Kids_Mode_Main_page({super.key});

  @override
  State<Kids_Mode_Main_page> createState() => _Kids_Mode_Main_pageState();
}

class _Kids_Mode_Main_pageState extends State<Kids_Mode_Main_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "QuizBuzz",
            style: TextStyle(fontFamily: 'RubikDoodleTriangles', fontSize: 65),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 253, 221, 89),
          centerTitle: true),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("backgrounds/kids_mode_background.png"),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Normal Mode",
                      style: TextStyle(
                          fontFamily: 'RubikDoodleShadow',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.popAndPushNamed(context, '/Main_Page');
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    'backgrounds/kids_mode_logo.png'),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height - 340,
                child: const SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      //gesture for who am i
                      Gesture_Who_am_i_()
                    ],
                  ),
                ),
              ),
              const Text("Did You Know", textAlign: TextAlign.center),
              const Text(
                "......Did You Know Text......",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}