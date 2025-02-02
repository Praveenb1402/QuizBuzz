import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Add_time_container extends StatefulWidget {
  int  owned;

   Add_time_container({super.key, required this.owned});

  @override
  State<Add_time_container> createState() => _Add_time_containerState();
}

class _Add_time_containerState extends State<Add_time_container> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _bonus_controller = TextEditingController(text: "1");
    return Container(
      margin: EdgeInsets.only(top: 30, left: 10),
      padding: EdgeInsets.all(10),
      width: (MediaQuery.of(context).size.width / 2) - 15,
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Time Adder"),
          Text("Total Owned: " + widget.owned.toString()),
          Text(
            "This add 10 more seconds to the timer. ",
            textAlign: TextAlign.center,
          ),
          Text(
            "Cost: 5 Coins",
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
                  icon: Icon(Icons.exposure_minus_1)),
              Container(
                width: 55,
                height: 70,
                child: TextFormField(
                  controller: _bonus_controller,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
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
                  icon: Icon(Icons.exposure_plus_1)),
            ],
          ),
          FilledButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.deepOrange)),
              onPressed: () async {
                late SharedPreferences prefs;
                prefs = await SharedPreferences.getInstance();
                setState(() {
                  prefs.setInt(
                      'tryagainlifeline',
                      int.parse(_bonus_controller.text) +
                          int.parse(widget.owned.toString()));
                  print("pdated");
                  widget.owned=prefs.getInt('tryagainlifeline')!;
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
