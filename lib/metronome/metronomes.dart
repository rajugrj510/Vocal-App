// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vocal_app/metronome/constants.dart';
import 'Round_Icon_Button.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Metronome extends StatefulWidget {
  @override
  _MetronomeState createState() => _MetronomeState();
}

class _MetronomeState extends State<Metronome> {
  int tempo = 70;
  double value = 99;
  double temp = 1.0;
  String meter = '4/4';
  String subdiv = 'SUB/DIV';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFAE0A14),
      appBar: AppBar(
        backgroundColor: Color(0xFF390202),
        title: Container(
          width: 280,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 10.0),
            child: Text(
              'BREATHING METRONOME',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //This is the top container for Metronome number
          Container(
            height: 200.0,
            width: 600.0,
            margin: EdgeInsets.fromLTRB(17.0, 40.0, 30.0, 30.0),
            decoration: BoxDecoration(
                color: Color(0xFFEE0708),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5,
                    offset: Offset(3, 8),
                  )
                ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 120.0,
                    width: 200.0,
                    margin:
                        EdgeInsets.only(left: 15.0, top: 45.0, bottom: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        tempo.toString(), //tempo number in the widget
                        style: TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                // Row of vertical slider.
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 45.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                meter, //The meter data show
                                style: kdivisionTextStyle,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                subdiv,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 145.0,
                      //This is the row of slider in vertical direction.
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SfSliderTheme(
                            data: SfSliderThemeData(
                              thumbColor: Colors.blue[200],
                              activeTrackHeight: kactiveSliderHeight,
                              inactiveTrackHeight: kinactiveSliderHeight,
                              activeTrackColor: kactiveSliderTrackColor,
                              inactiveTrackColor: Colors.black,
                              trackCornerRadius: -1.0,
                            ),
                            child: SfSlider.vertical(
                              min: 0.0,
                              max: 100.0,
                              value: tempo,
                              onChanged: (newVal) {
                                setState(() {
                                  tempo = newVal.toInt();
                                });
                              },
                            ),
                          ),
                          SfSliderTheme(
                            data: SfSliderThemeData(
                              thumbColor: Colors.blue[200],
                              activeTrackHeight: kactiveSliderHeight,
                              inactiveTrackHeight: kinactiveSliderHeight,
                              activeTrackColor: kactiveSliderTrackColor,
                              inactiveTrackColor: Colors.black,
                              trackCornerRadius: -1.0,
                            ),
                            child: SfSlider.vertical(
                              min: 0.0,
                              max: 100.0,
                              value: tempo,
                              onChanged: (newVal) {
                                setState(() {
                                  tempo = newVal.toInt();
                                });
                              },
                            ),
                          ),
                          SfSliderTheme(
                            data: SfSliderThemeData(
                              thumbColor: Colors.blue[200],
                              activeTrackHeight: kactiveSliderHeight,
                              inactiveTrackHeight: kinactiveSliderHeight,
                              activeTrackColor: kactiveSliderTrackColor,
                              inactiveTrackColor: Colors.black,
                              trackCornerRadius: -1.0,
                            ),
                            child: SfSlider.vertical(
                              min: 0.0,
                              max: 100.0,
                              value: tempo,
                              onChanged: (newVal) {
                                setState(() {
                                  tempo = newVal.toInt();
                                });
                              },
                            ),
                          ),
                          SfSliderTheme(
                            data: SfSliderThemeData(
                              thumbColor: Colors.blue[200],
                              activeTrackHeight: kactiveSliderHeight,
                              inactiveTrackHeight: kinactiveSliderHeight,
                              activeTrackColor: kactiveSliderTrackColor,
                              inactiveTrackColor: Colors.black,
                              trackCornerRadius: -1.0,
                            ),
                            child: SfSlider.vertical(
                              min: 0.0,
                              max: 100.0,
                              value: tempo,
                              onChanged: (newVal) {
                                setState(() {
                                  tempo = newVal.toInt();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //This is the play button
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 220,
                  height: 220,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 30.0,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.play_arrow),
                        iconSize: 100.0,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          //This is where the last set of buttons will be for the metronome
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //This container is for the tap button
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
                    child: Text(
                      'TAP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                //This container is for the increase and decrease icon.
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              //perform action for metronome
                              setState(() {
                                tempo--;
                              });
                            }),
                        Container(
                          width: 40.0,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              tempo.toString(),
                              style: ktextStyle,
                            ),
                          ),
                        ),
                        RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              //perform action for metronome
                              setState(() {
                                tempo++;
                              });
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
