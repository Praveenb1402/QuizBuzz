import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bonus_attempts extends StatefulWidget {
  int owned;

  Bonus_attempts({super.key, required this.owned});

  @override
  State<Bonus_attempts> createState() => _Bonus_attemptsState();
}

class _Bonus_attemptsState extends State<Bonus_attempts> {
  TextEditingController _bonus_controller = TextEditingController(text: "1");

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 10),
      padding: const EdgeInsets.all(10),
      width: (MediaQuery.of(context).size.width / 2) - 15,
      height: 300,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Bonus Attempts"),
          Text("Total Owned: " + widget.owned.toString()),
          const Text(
            "This Booster Options gives a "
            "second chance to give answer to the same question",
            textAlign: TextAlign.center,
          ),
          const Text(
            "Cost: 10 Coins",
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    if (int.parse(_bonus_controller.text) > 0) {
                      _bonus_controller.text =
                          (int.parse(_bonus_controller.text) - 1).toString();
                    }
                  },
                  icon: const Icon(Icons.exposure_minus_1)),
              SizedBox(
                width: 55,
                height: 70,
                child: TextFormField(
                  controller: _bonus_controller,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.solid))),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                  onPressed: () {
                    _bonus_controller.text =
                        (int.parse(_bonus_controller.text) + 1).toString();
                  },
                  icon: const Icon(Icons.exposure_plus_1)),
            ],
          ),
          FilledButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.deepOrange)),
              onPressed: () async {
                late SharedPreferences prefs;
                prefs = await SharedPreferences.getInstance();
                prefs.setInt(
                    'addtimelifeline',
                    int.parse(_bonus_controller.text) +
                        int.parse(widget.owned.toString()));
                setState(() {
                  widget.owned = prefs.getInt('addtimelifeline')!;
                });
              },
              child: const Text(
                "Add",
                style: TextStyle(
                    fontFamily: 'RubikDoodleShadow',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
        ],
      ),
    );
  }
}
