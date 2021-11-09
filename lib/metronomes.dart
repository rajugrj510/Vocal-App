// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'Round_Icon_Button.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'package:audioplayers/audioplayers.dart';
//import 'package:audioplayers/audio_cache.dart';

bool _visible = true; //set widget visibility to true at the start
int time01 = 0; //variables that track the beat
bool time01_start =
    false; //Make sure timer is stopped at the beginning(First timer)
bool time02_start = false; //Second timer
bool time03_start = false; //Third timer
bool Slow = false; //Slow tempo
bool Fast = false; //Fast tempo
bool Normal = false; //Default tempo
int count = 1; //Determine the tempo
var Seconds = 1; //Duration of timers

double time = 1 / 3.0; //formula for tempo, first timer
double time2 = 1 / 4.0; //second timer
double time3 = 1 / 6.0; //third timer
Duration _getDuration() {
  //Three duration functions for timer
  //tempo conversion
  return Duration(
    seconds: time.toInt(),
    milliseconds: (time * 1000).toInt() % 1000,
    microseconds: (time * 1000000).toInt() % 1000,
  );
}

Duration _getDuration2() {
  //tempo conversion
  return Duration(
    seconds: time.toInt(),
    milliseconds: (time2 * 1000).toInt() % 1000,
    microseconds: (time2 * 1000000).toInt() % 1000,
  );
}

Duration _getDuration3() {
  //tempo conversion
  return Duration(
    seconds: time.toInt(),
    milliseconds: (time3 * 1000).toInt() % 1000,
    microseconds: (time3 * 1000000).toInt() % 1000,
  );
}

var period = _getDuration(); //Initialize period to a Duration function

class timerPage extends StatefulWidget {
  //metronome
  @override
  _timerPage createState() => _timerPage();
}

class _timerPage extends State<timerPage> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
//END OF JAHRON ADDED CODE

class Metronome extends StatefulWidget {
  @override
  _MetronomeState createState() => _MetronomeState();
}

class _MetronomeState extends State<Metronome> {
  AudioPlayer audPlayer = AudioPlayer();

  int count = 1;
  void _toggle() {
    //toggle widget visibility depending on if the time01 variable is even or odd
    setState(() {
      if (time01 % 2 == 0) {
        _visible = !_visible;
      } else {
        _visible = true;
      }
    });
  }

  //NORMAL TEMPO**********************
  time01_button_event() async {
    //Toggle metronome
    if (count == 1) {
      Normal = true;
      Slow = false;
      Fast = false;
    }
    if (time01_start) {
      time01_start = false;
    } else {
      time01_start = true;
    }
    if (Normal == true && Slow == false && Fast == false) {
      period = _getDuration2();
    }
    Timer.periodic(/*Duration(seconds: Seconds)*/ period, (timer) {
      //First timer
      if (Normal == true && Slow == false && Fast == false) {
        //Metronome beat
        if (time01_start == false) {
          //Pause metronome
          timer.cancel();
          _visible = true;
          audPlayer.pause();
        } else {
          //origninal audio implementation; has some initial delay
          _toggle();
          if (!_visible) {
            audPlayer.stop();
          } else {
            audPlayer.play("assets/assets_click_1.wav", isLocal: true);
            audPlayer.stop; //was commented out
          }
        }
        setState(() {});
      } else {
        timer.cancel();
        audPlayer.stop();
      }
    });
  }

  //SLOWEST TEMPO***********************

  time02_button_event() {
    //Second timer
    if (count == 0) {
      Normal = false;
      Slow = true;
      Fast = false;
    }
    //Toggle metronome
    if (time02_start) {
      time02_start = false;
    } else {
      time02_start = true;
    }

    if (Normal == false && Slow == true && Fast == false) {
      /*Jay = 2.0;
      Seconds = Jay.toInt();*/
      period = _getDuration();
    }

    Timer.periodic(/*Duration(seconds: Seconds)*/ period, (timer) {
      //Metronome beat
      if (Normal == false && Slow == true && Fast == false) {
        if (time02_start == false) {
          //Pause metronome
          timer.cancel();
          _visible = true;
          audPlayer.pause();
        } else {
          _toggle();
          if (!_visible) {
            audPlayer.stop();
          } else {
            audPlayer.play("assets/assets_click_1.wav", isLocal: true);
            audPlayer.stop; //was commented out
          }
        }
      } else {
        timer.cancel();
        audPlayer.stop();
      }
      setState(() {});
    });
  }

  //FASTEST TEMPO******************
  time03_button_event() {
    //Third timer
    //Toggle metronome
    if (count == 2) {
      Normal = false;
      Fast = true;
      Slow = false;
    }
    if (time03_start) {
      time03_start = false;
    } else {
      time03_start = true;
    }
    if (Normal == false && Slow == false && Fast == true) {
      /*Jay = -1;
      Seconds = Jay.toInt();*/
      period = _getDuration3();
    }
    Timer.periodic(/*Duration(seconds: Seconds)*/ period, (timer) {
      if (Normal == false && Slow == false && Fast == true) {
        //Metronome beat
        if (time03_start == false) {
          //Pause metronome
          timer.cancel();
          _visible = true;
          audPlayer.pause();
        } else {
          _toggle();
          if (!_visible) {
            audPlayer.stop();
          } else {
            audPlayer.play("assets/assets_click_1.wav", isLocal: true);
            audPlayer.stop; //was commented out
          }
        }
      } else {
        timer.cancel();
        audPlayer.stop();
      }
      setState(() {});
    });
  }

  int tempo = 70;
  double value = 99;
  double tempTemp = 1.0;
  String meter = '4/4';
  String subdiv = 'SUB/DIV';
  void numericKeypadModal(context, tempo) {
    int tempTemp = 130;
    showModalBottomSheet(
        backgroundColor: Color(0xFF6A8BFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(70.0),
          ),
        ),
        isDismissible: false,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            //height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 8.0, bottom: 2.0),
                  height: 15.0,
                  width: 70.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                Expanded(
                  child: Container(
                    //padding: EdgeInsets.only(left: 40.0, right: 40.0),
                    height: 410.0,
                    width: 350.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF337FF3),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(80.0),
                      ),
                    ),
                    //This is the column of number keypad
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //This is the container for textfield for setting Tempo
                        Container(
                            height: 50.0,
                            width: 100.0,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Center(
                              child: Text(
                                tempTemp.toString(),
                                style: ktextStyle,
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          //This is the Row of number [7, 8, 9]
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    tempTemp = 100;
                                  });
                                },
                                style: kstyleLeftNumberButton,
                                child: Text(
                                  '7',
                                ),
                              ),
                              SizedBox(width: ksizedBoxWidth),
                              ElevatedButton(
                                onPressed: () {},
                                style: kstyleCenterNumberButton,
                                child: Text(
                                  '8',
                                ),
                              ),
                              SizedBox(width: ksizedBoxWidth),
                              ElevatedButton(
                                onPressed: () {},
                                style: kstyleRightNumberButton,
                                child: Text(
                                  '9',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          //This is the Row of number [4, 5, 6]
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: kstyleLeftNumberButton,
                                child: Text(
                                  '4',
                                ),
                              ),
                              SizedBox(width: ksizedBoxWidth),
                              ElevatedButton(
                                onPressed: () {},
                                style: kstyleCenterNumberButton,
                                child: Text(
                                  '5',
                                ),
                              ),
                              SizedBox(width: ksizedBoxWidth),
                              ElevatedButton(
                                onPressed: () {},
                                style: kstyleRightNumberButton,
                                child: Text(
                                  '6',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          //This is the Row of number [1, 2, 3]
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: kstyleLeftNumberButton,
                                child: Text(
                                  '1',
                                ),
                              ),
                              SizedBox(width: ksizedBoxWidth),
                              ElevatedButton(
                                onPressed: () {},
                                style: kstyleCenterNumberButton,
                                child: Text(
                                  '2',
                                ),
                              ),
                              SizedBox(width: ksizedBoxWidth),
                              ElevatedButton(
                                onPressed: () {},
                                style: kstyleRightNumberButton,
                                child: Text(
                                  '3',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          //This is the Row of number [c, 0, set]
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20.0,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: kstyleClearButton,
                                child: Text(
                                  'c',
                                ),
                              ),
                              SizedBox(width: 8.0),
                              ElevatedButton(
                                onPressed: () {},
                                style: kstyleCenterNumberButton,
                                child: Text(
                                  '0',
                                ),
                              ),
                              SizedBox(width: ksizedBoxWidth),
                              ElevatedButton(
                                onPressed: () {},
                                style: kstyleSetButton,
                                child: Text(
                                  'set',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    //This is they button style for TAP button

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
                    //This is the container for the meter
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
                          //This is the container for sub/div
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
                              max: 400.0,
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
                              max: 400.0,
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
                              max: 400.0,
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
                              max: 400.0,
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
                        onPressed: () {
                          //Decrease tempo
                          if (count > 0) {
                            count--;

                            if (count == 0) {
                              //If normal tempo
                              Normal = true;
                              Slow = false;
                              Fast = false;
                              time02_button_event();
                              time03_button_event();
                              time01_button_event();
                            }

                            if (count == 1) {
                              //If slow tempo
                              Normal = false;
                              Slow = true;
                              Fast = false;
                              time01_button_event();
                              time03_button_event();
                              time02_button_event();
                            }

                            if (count == 2) {
                              //If fast tempo
                              Normal = false;
                              Slow = false;
                              Fast = true;
                              time02_button_event();
                              time01_button_event();
                              time03_button_event();
                            }
                          }
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 30.0,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (count == 1) {
                            time01_button_event(); //Normal
                          }
                          if (count == 0) {
                            time02_button_event(); //Slowest
                          }
                          if (count == 2) {
                            time03_button_event(); //Fastest
                          }
                        },
                        icon: Icon(Icons.play_arrow),
                        iconSize: 100.0,
                      ),
                      IconButton(
                        onPressed: () {
                          if (count < 2) {
                            count++;

                            if (count == 0) {
                              //If normal tempo
                              Normal = true;
                              Slow = false;
                              Fast = false;
                              time02_button_event();
                              time03_button_event();
                              time01_button_event();
                            }

                            if (count == 1) {
                              //If slow tempo
                              Normal = false;
                              Slow = true;
                              Fast = false;
                              time01_button_event();
                              time03_button_event();
                              time02_button_event();
                            }

                            if (count == 2) {
                              //If fast tempo
                              Normal = false;
                              Slow = false;
                              Fast = true;
                              time02_button_event();
                              time01_button_event();
                              time03_button_event();
                            }
                          }
                        },
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
                //This is for the tap button
                ElevatedButton(
                  style: kstyleTap,
                  onPressed: () {
                    numericKeypadModal(context, tempo);
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18.0, 9.0, 18.0, 9.0),
                    child: Text(
                      'TAP',
                      style: ktextStyle,
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
                                tempo = tempo - 10;
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
                                tempo = tempo + 10;
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
