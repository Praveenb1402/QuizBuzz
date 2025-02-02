import 'package:flutter/material.dart';

class Setting_Page extends StatefulWidget {
  const Setting_Page({super.key});

  @override
  State<Setting_Page> createState() => _Setting_PageState();
}

class _Setting_PageState extends State<Setting_Page> {
  bool _background_music = true;
  bool _click_sound = true;
  bool _all_mute = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const FittedBox(
            child: Text(
              "Settings",
              style:
                  TextStyle(fontFamily: 'RubikDoodleTriangles', fontSize: 40),
            ),
          ),
          automaticallyImplyLeading: false,
          // backgroundColor: const Color.fromARGB(255, 253, 237, 167),
          centerTitle: true),
      body: SafeArea(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //       image: AssetImage(
              //           "backgrounds/main_page_backgound_normal.png"),
              //       fit: BoxFit.cover),
              // ),
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        // decoration: const BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius:
                        //         BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Background Music",
                              style: TextStyle(fontSize: 20),
                            ),
                            Switch(
                                value: _background_music,
                                onChanged: (value) {
                                  setState(() {
                                    _background_music = value;
                                  });
                                })
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        // decoration: const BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius:
                        //         BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Click Sound",
                              style: TextStyle(fontSize: 20),
                            ),
                            Switch(
                                value: _click_sound,
                                onChanged: (value) {
                                  setState(() {
                                    _click_sound = value;
                                  });
                                })
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        // decoration: const BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius:
                        //         BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "All mute",
                              style: TextStyle(fontSize: 20),
                            ),
                            Switch(
                                value: _all_mute,
                                onChanged: (value) {
                                  setState(() {
                                    _all_mute = value;
                                  });
                                })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
