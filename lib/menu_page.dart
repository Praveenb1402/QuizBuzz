import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quizbuz/Bouns_packages/booster_page.dart';
import 'package:quizbuz/Buy%20coins/buy_coins_main_page.dart';
import 'package:quizbuz/Settings/Setting_page.dart';
import 'package:quizbuz/gesture_buttons/gest_rapidround.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'gesture_buttons/gest_quiz.dart';
import 'gesture_buttons/gest_timebuzz.dart';

class Main_Page extends StatefulWidget {
  const Main_Page({super.key});

  @override
  State<Main_Page> createState() => Main_PageState();
}

class Main_PageState extends State<Main_Page> {
  final _page_controller = PageController();
  double _total_coins = 0;
  late BannerAd _bannerAd;
  bool isAdloaded = false;

  initBannerAds() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-3940256099942544/9214589741',
        listener: BannerAdListener(onAdLoaded: (ads) {
          setState(() {
            isAdloaded = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print(error);
        }),
        request: const AdRequest());
    _bannerAd.load();
  }

  @override
  void initState() {
    super.initState();
    initBannerAds();
    getcoins();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: FittedBox(
      //       child: const Text(
      //         "QuizBuzz",
      //         style:
      //             TextStyle(fontFamily: 'RubikDoodleTriangles', fontSize: 40),
      //       ),
      //     ),
      //     automaticallyImplyLeading: false,
      //     backgroundColor: const Color.fromARGB(255, 253, 237, 167),
      //     centerTitle: true),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("backgrounds/main_page_backgound_normal.png"),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    isAdloaded
                        ? SizedBox(
                            height: _bannerAd.size.height.toDouble(),
                            width: _bannerAd.size.width.toDouble(),
                            child: AdWidget(
                              ad: _bannerAd,
                            ),
                          )
                        : const SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              "Kids Mode",
                              style: TextStyle(
                                  fontFamily: 'RubikDoodleShadow',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.popAndPushNamed(
                                    context, '/Kids_Main_Page');
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
                        Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.white),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return const Setting_Page();
                                  }));
                                },
                                icon: const Icon(Icons.settings))),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width - 175),
                      width: 150,
                      height: 35,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20))),
                            child: const Image(
                              image: AssetImage("backgrounds/coins.png"),
                              width: 45,
                              height: 35,
                            ),
                          ),
                          Text(
                            _total_coins.toString(),
                            textAlign: TextAlign.center,
                          ),
                          IconButton(
                            alignment: Alignment.center,
                            color: Colors.grey,
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return const buy_coins_main_page();
                              }));
                            },
                            icon: const Icon(Icons.add_box),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width - 175, bottom: 30),
                width: 150,
                height: 35,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      child: const Icon(
                        Icons.electric_bolt,
                        color: Colors.yellowAccent,
                        size: 35,
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        "Boosters",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                      alignment: Alignment.center,
                      color: Colors.grey,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Bossters_page()));
                      },
                      icon: const Icon(Icons.add_box),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 250,
                    child: const Gest_rapid_round(),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 250,
                    child: const Gest_timebuzz(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 250,
                    child: const Gest_quiz(),
                  ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width / 2,
                  //   height: 250,
                  //   child: Gest_coming_soon(),
                  // ),
                ],
              ),

              // Container(
              //   margin: const EdgeInsets.all(10),
              //   width: MediaQuery.of(context).size.width - 50,
              //   height: 250,
              //   child:

              // For Time Buzz
              //
              // // For Quiz
              //
              // //For Coming soon
              //

              // ),
              // SizedBox(
              //   child: SmoothPageIndicator(
              //     controller: _page_controller,
              //     count: 4,
              //     onDotClicked: (index) {
              //       _page_controller.animateToPage(
              //         index,
              //         duration: const Duration(milliseconds: 200),
              //         curve: Curves.easeInOut,
              //       );
              //     },
              //     effect: const ExpandingDotsEffect(
              //         dotHeight: 10, dotWidth: 15, spacing: 15),
              //   ),
              // ),
              const Text("Did You Know", textAlign: TextAlign.center),
              const Text(
                "......Did You Know Text......",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getcoins() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? _totalcoins = prefs.getDouble('coins');
    print(_totalcoins);
    setState(() {
      _total_coins = _totalcoins!;
    });
  }
}
