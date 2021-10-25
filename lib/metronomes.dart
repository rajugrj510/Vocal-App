import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

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

class Metronome extends StatefulWidget {
  const Metronome({Key? key}) : super(key: key);

  @override
  _MetronomeState createState() => _MetronomeState();
}

class _MetronomeState extends State<Metronome> {
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
  time01_button_event() {
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
        } else {
          _toggle();
        }
        setState(() {});
      } else {
        timer.cancel();
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
        } else {
          _toggle();
        }
      } else {
        timer.cancel();
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
        } else {
          _toggle();
        }
      } else {
        timer.cancel();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('BREATHING METRONOME'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                //Remove Visibility to stop widget from blinking
                visible: _visible,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Container(
                  color: Colors.red,
                  width: 300,
                  height: 150,
                  child: Text(
                    'TEMPO',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),

          SizedBox(
            height: 150,
          ),

          //This is the play button
          Row(
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
                      icon: Icon(Icons.arrow_back_ios),
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

                      icon: Icon(Icons.play_arrow), //Play button
                      iconSize: 90,
                    ),
                    IconButton(
                      //Increasing
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
                      icon: Icon(Icons.arrow_forward_ios),
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
          SizedBox(
            height: 90,
          ),

          //This is where the last set of buttons will be for the metronome
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 50,
                color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add_circle_outline_rounded)),
                    Text('1'),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.do_not_disturb_on_outlined)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
