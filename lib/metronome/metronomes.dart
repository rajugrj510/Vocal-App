// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:vocal_app/metronome/constants.dart';
import 'constants.dart';
import 'Round_Icon_Button.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

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

//Metronome class
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
          // audPlayer.pause();
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
        //audPlayer.stop();
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
            //audPlayer.play("assets/assets_click_1.wav", isLocal: true);
            //audPlayer.stop; //was commented out
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
            // audPlayer.stop; //was commented out
          }
        }
      } else {
        timer.cancel();
        //audPlayer.stop();
      }
      setState(() {});
    });
  }

  int tempo = 70;
  double value = 99;
  double tempTemp = 1.0;
  double frameWidth = 370;

  @override
  Widget build(BuildContext context) {
    frameWidth = 380;
    //This is they button style for TAP button
    return Scaffold(
      backgroundColor: Color(0XFFAE0A14),
      appBar: AppBar(
          backgroundColor: Color(0xFF180C0C),
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
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
          leading: Row(
            children: [
              SizedBox(
                width: 8.0,
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(FontAwesomeIcons.angleLeft),
              ),
            ],
          )),
      body: Container(
        //This is the container for all the mentronome functionality.
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.5, 0.6, 0.9],
            colors: [
              Color(0xFF1B0909),
              Color(0XFFAE0A14),
              Color(0XFFAE0A14),
              Color(0xFFEE0708),
            ],
          ),
        ),
        //This is the column of three widget container
        //--Top container containing tempo and slider
        //*Second contains the play and next and previous button
        //--Third contain Tap and Increment and decrement button.
        child: Column(
          children: [
            //This is the top container for Metronome number
            Container(
              height: 180.0,
              width: 600.0,
              margin: EdgeInsets.fromLTRB(17.0, 20.0, 30.0, 10.0),
              //decoration color for the top boxs
              decoration: BoxDecoration(
                  color: Color(0xFFEE0708),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 4,
                      offset: Offset(4, 2),
                    )
                  ]),
              //This is the tempo box
              child: Container(
                height: 200.0,
                width: 100.0,
                margin: EdgeInsets.all(40.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color(0xFF5465DE),
                        Color(0xFF6B8CFF),
                        Color(0xFF6775CF)
                      ]),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Visibility(
                    visible: _visible,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
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
            ),
            //This is the play button
            Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // this is the first from buttom frame widget paint
                  //Add this CustomPaint widget to the Widget Tree
                  CustomPaint(
                    size: Size(400, (400 * 0.7606803797468354).toDouble()),
                    painter: RPSBackCustomPainter(),
                  ),
                  //Pink color frame, second from the buttom
                  CustomPaint(
                    size: Size(400, (400 * 0.6163034705407587).toDouble()),
                    painter: RPSLeftLightCustomPainter(),
                  ),
                  //Solid frame paint, Third position in stack from bottom
                  CustomPaint(
                    size: Size(frameWidth,
                        (frameWidth * 0.8097030531158511).toDouble()),
                    painter: RPSRightDarkCustomPainter(),
                  ),
                  //This frame is the Top frame from the screen
                  Positioned(
                    height: 300,
                    child: CustomPaint(
                      size: Size(frameWidth,
                          (frameWidth * 0.9939737199818759).toDouble()),
                      painter: RPSTopFrameCustomPainter(),
                    ),
                  ),
                  //This is the top stacked widget where all the functionality
                  //are created
                  Container(
                    //This is the white circle container which contains
                    //the buttons.
                    width: 220,
                    height: 205,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //Three Icon button previous, next and Play
                        Material(
                          color: Colors.white,
                          child: IconButton(
                            splashColor: Colors.blue,
                            //disabledColor: Colors.deepOrange,
                            onPressed: () {
                              //Decrease tempo
                              if (count > 0) {
                                count--;
                                tempo--;
                                tempo--;

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
                              FontAwesomeIcons.chevronLeft,
                              size: 30.0,
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.white,
                          child: IconButton(
                            splashColor: Colors.blue,
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
                            icon: Icon(FontAwesomeIcons.play),
                            iconSize: 60.0,
                          ),
                        ),
                        Material(
                          color: Colors.white,
                          child: IconButton(
                            splashColor: Colors.blue,
                            onPressed: () {
                              //increase tempo
                              if (count < 2) {
                                count++;
                                tempo++;
                                tempo++;

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
                              FontAwesomeIcons.chevronRight,
                              size: 30.0,
                            ),
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
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                          //this  is the icon for the decrease icon
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
                              child: Visibility(
                                visible: _visible,
                                maintainSize: true,
                                maintainAnimation: true,
                                maintainState: true,
                                child: Text(
                                  tempo.toString(),
                                  style: ktextStyle,
                                ),
                              ),
                            ),
                          ),
                          //this is the icon for the increase icon
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
      ),
    );
  }
}

//This is the class for bottom frame from the Screen
//Function custom painter is called and passed with height, results in painting
//widget
class RPSBackCustomPainter extends CustomPainter {
  @override
  //This function is used to calulate the size of the width and height.
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.03792998, size.height * 0.8817733);
    path_0.cubicTo(
        size.width * 0.03792998,
        size.height * 0.8817733,
        size.width * -0.08894699,
        size.height * -0.02833396,
        size.width * 0.1234324,
        size.height * 0.1450806);
    path_0.cubicTo(
        size.width * 0.3358117,
        size.height * 0.3184956,
        size.width * 0.5913291,
        size.height * -0.3405840,
        size.width * 0.6233386,
        size.height * 0.2548060);
    path_0.cubicTo(
        size.width * 0.6553441,
        size.height * 0.8501976,
        size.width * 0.8918908,
        size.height * 0.5009158,
        size.width * 0.9515229,
        size.height * 0.6833697);
    path_0.cubicTo(
        size.width * 1.011151,
        size.height * 0.8658242,
        size.width * 1.026962,
        size.height * 0.8966043,
        size.width * 0.9341179,
        size.height * 0.9783359);
    path_0.cubicTo(
        size.width * 0.8412698,
        size.height * 1.060073,
        size.width * 0.03792998,
        size.height * 0.8817733,
        size.width * 0.03792998,
        size.height * 0.8817733);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.03322116, size.height * 0.4999912),
        Offset(size.width * 0.9999802, size.height * 0.4999912),
        [Color(0xffFF1729).withOpacity(0.5), Color(0xff000000).withOpacity(1)],
        [0.73, 1]);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//This is the class for Second from the bottom frame from the Screen
//Function custom painter is called and passed with height, results in painting
//widget
class RPSLeftLightCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.03590557, size.height * 0.9445972);
    path_0.cubicTo(
        size.width * -0.02212018,
        size.height * 0.7650366,
        size.width * -0.02076021,
        size.height * -0.04042834,
        size.width * 0.1224657,
        size.height * 0.1463380);
    path_0.cubicTo(
        size.width * 0.3088329,
        size.height * 0.3893949,
        size.width * 0.5993664,
        size.height * -0.3805949,
        size.width * 0.6325343,
        size.height * 0.2643685);
    path_0.cubicTo(
        size.width * 0.6657022,
        size.height * 0.9093296,
        size.width * 0.9070460,
        size.height * 0.5902986,
        size.width * 0.9677280,
        size.height * 0.7281183);
    path_0.cubicTo(
        size.width * 1.028414,
        size.height * 0.8659437,
        size.width * 0.9998265,
        size.height * 0.8903099,
        size.width * 0.9048547,
        size.height * 0.9340113);
    path_0.cubicTo(
        size.width * 0.8098830,
        size.height * 0.9777183,
        size.width * 0.07048426,
        size.height * 1.051392,
        size.width * 0.03590557,
        size.height * 0.9445972);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * -0.0007935714, size.height * 0.4998659),
        Offset(size.width * 0.9996126, size.height * 0.4998659),
        [Color(0xffFF7395).withOpacity(0.7), Color(0xff000000).withOpacity(1)],
        [0.14, 1]);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//This is the class for right dark frame from the Screen
//Function custom painter is called and passed with height, results in painting
//widget
class RPSRightDarkCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9362275, size.height * 0.1232639);
    path_0.cubicTo(
        size.width * 0.8638101,
        size.height * -0.06676395,
        size.width * 0.8638101,
        size.height * 0.6598244,
        size.width * 0.7552028,
        size.height * 0.07855320);
    path_0.cubicTo(
        size.width * 0.7030029,
        size.height * -0.2011214,
        size.width * 0.5942785,
        size.height * 0.3412727,
        size.width * 0.4203137,
        size.height * 0.5592149);
    path_0.cubicTo(
        size.width * 0.3472296,
        size.height * 0.6507490,
        size.width * 0.1957645,
        size.height * 0.3536348,
        size.width * 0.1397256,
        size.height * 0.4474401);
    path_0.cubicTo(
        size.width * 0.05185571,
        size.height * 0.5945300,
        size.width * 0.03111857,
        size.height * 0.7045351,
        size.width * 0.03111857,
        size.height * 0.7045351);
    path_0.cubicTo(
        size.width * 0.03111857,
        size.height * 0.7045351,
        size.width * -0.03196792,
        size.height * 0.9185795,
        size.width * 0.02268791,
        size.height * 0.9725878);
    path_0.cubicTo(
        size.width * 0.07734379,
        size.height * 1.026596,
        size.width * 0.9274864,
        size.height * 0.9962345,
        size.width * 0.9724174,
        size.height * 0.9169163);
    path_0.cubicTo(
        size.width * 1.017353,
        size.height * 0.8376033,
        size.width * 1.008632,
        size.height * 0.3132924,
        size.width * 0.9362275,
        size.height * 0.1232639);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.0004236219, size.height * 0.5000000),
        Offset(size.width * 0.9999540, size.height * 0.5000000),
        [Color(0xffB90018).withOpacity(1), Color(0xff000000).withOpacity(1)],
        [0.73, 1]);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//This is the class for top frame from the Screen
//Function custom painter is called and passed with height, results in painting
//widget
class RPSTopFrameCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9580063, size.height * 0.1207456);
    path_0.cubicTo(
        size.width * 0.8866923,
        size.height * -0.06571870,
        size.width * 0.8866923,
        size.height * 0.6472276,
        size.width * 0.7797327,
        size.height * 0.07687329);
    path_0.cubicTo(
        size.width * 0.7282556,
        size.height * -0.1975565,
        size.width * 0.6212415,
        size.height * 0.3346655,
        size.width * 0.4499089,
        size.height * 0.5485048);
    path_0.cubicTo(
        size.width * 0.3779715,
        size.height * 0.6383376,
        size.width * 0.2287526,
        size.height * 0.3467962,
        size.width * 0.1735696,
        size.height * 0.4388262);
    path_0.cubicTo(
        size.width * 0.08702673,
        size.height * 0.5831576,
        size.width * 0.06659674,
        size.height * 0.6910998,
        size.width * 0.06659674,
        size.height * 0.6910998);
    path_0.cubicTo(
        size.width * 0.06659674,
        size.height * 0.6910998,
        size.width * -0.04637109,
        size.height * 0.8312266,
        size.width * 0.02203158,
        size.height * 0.9324126);
    path_0.cubicTo(
        size.width * 0.09043407,
        size.height * 1.033599,
        size.width * 0.8601405,
        size.height * 1.007106,
        size.width * 0.9311464,
        size.height * 0.9408870);
    path_0.cubicTo(
        size.width * 1.002148,
        size.height * 0.8746680,
        size.width * 1.029325,
        size.height * 0.3072103,
        size.width * 0.9580063,
        size.height * 0.1207456);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffFF171D).withOpacity(0.2);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
