import 'package:flutter/material.dart';
import 'package:quizbuz/Bouns_packages/bouns_card/Bouns_attempts.dart';
import 'package:quizbuz/Bouns_packages/bouns_card/Skipper.dart';
import 'package:quizbuz/Bouns_packages/bouns_card/add_timer_container.dart';
import 'package:quizbuz/Bouns_packages/bouns_card/freeze_bites.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bossters_page extends StatefulWidget {
  const Bossters_page({super.key});

  @override
  State<Bossters_page> createState() => _Bossters_pageState();
}

class _Bossters_pageState extends State<Bossters_page> {
  late int _try_again_lifeline = 0;
  late int _addtime_lifeline = 0;
  late int _skip_quesion_lifeline = 0;
  late int _freeze_time_lifeline = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOptioncount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage("backgrounds/main_page_backgound_normal.png"),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Booster Packages",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'RubikDoodleTriangles', fontSize: 30),
                ),
                Row(
                  children: [
                    Add_time_container(owned: _addtime_lifeline),
                    // Booster_container(name:"Time Adder",option:0),
                    FreezeState(owned: _freeze_time_lifeline),
                  ],
                ),
                Row(
                  children: [
                    Skipper(owned: _skip_quesion_lifeline),
                    Bonus_attempts(owned: _try_again_lifeline),
                    // Booster_container(name: "Skipper", option: 2),
                    // Booster_container(name: "Bonus Attempts", option: 3),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: FilledButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.deepOrange)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Back",
                        style: TextStyle(
                            fontFamily: 'RubikDoodleShadow',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getOptioncount() async {
    late SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _try_again_lifeline = prefs.getInt('tryagainlifeline')!;
      _addtime_lifeline = prefs.getInt('addtimelifeline')!;
      _skip_quesion_lifeline = prefs.getInt('skipquestion')!;
      _freeze_time_lifeline = prefs.getInt('freezetime')!;
      print("added");
    });
  }
}
