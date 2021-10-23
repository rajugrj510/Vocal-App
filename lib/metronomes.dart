import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

bool _visible = true; //set widget visibility to true at the start
int time01 = 0; //variables that track the beat
int time02 = 0;
bool time01_start = false; //Make sure timer is stopped at the beginning

double Tpo = 3.0; //variable for tempo
double Tpo2 = Tpo; //backup tempo variable
bool add = false;
void changeTempo() {
  //increase the tempo
  time--;
  _getDuration();
}

void changeTempoDecrease() {
  //decrease the tempo
  if (time01 >= 0) {
    time++;
    _getDuration();
  }
}

double time = 1 / Tpo; //formula for tempo

Duration _getDuration() {
  //tempo conversion
  return Duration(
    seconds: time.toInt(),
    milliseconds: (time * 1000).toInt() % 1000,
    microseconds: (time * 1000000).toInt() % 1000,
  );
}

var period = _getDuration();

class timerPage extends StatefulWidget {
  //metronome
  @override
  _timerPage createState() => _timerPage();
}

class _timerPage extends State<timerPage> {
  int count = 1;
  /*void _toggle() { //toggle visibility of the widget (This is duplicated but something weird happens when i remove the duplicate)
    setState(() {
      if (time01 % 2 == 0) {
        _visible = !_visible; 
      } else {
        _visible = true;
      }
      time01++;
    });
  }*/

  //var period = _getDuration();

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

  // var period = _getDuration();

  time01_button_event() {
    //Toggle metronome
    if (time01_start) {
      time01_start = false;
    } else {
      time01_start = true;
    }

    Timer.periodic(period, (timer) {
      //Metronome beat
      if (time01_start == false) {
        //Pause metronome
        timer.cancel();
        _visible = true;
        time01 = 0;
        //Tpo = 4.0;
        //timer = null;

      } else {
        //play metronome
        timer.isActive;
        //toggle visibility
        //Toggle sound
        _toggle();
        time01++;
      }
      //  setState(() {});
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
                        changeTempoDecrease();

                        time01_start = false;

                        _getDuration();
                        time01_button_event();
                        time01_start = true;
                        time01_button_event();
                        time01_button_event();
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    IconButton(
                      onPressed: () {
                        time01_button_event();
                      },

                      icon: Icon(Icons.play_arrow), //Play button
                      iconSize: 90,
                    ),
                    IconButton(
                      onPressed: () {
                        //Increase tempo
                        changeTempo();

                        time01_start = false;

                        _getDuration();
                        time01_button_event();
                        time01_start = true;
                        time01_button_event();

                        time01_button_event();
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



/*import 'package:flutter/material.dart';

class Metronome extends StatefulWidget {
  const Metronome({ Key? key }) : super(key: key);

  @override
  _MetronomeState createState() => _MetronomeState();
}

class _MetronomeState extends State<Metronome> {
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
              Container(
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
            ],
          ),

          SizedBox(height: 150,),

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
                      onPressed: (){},
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.play_arrow),
                      iconSize: 90,
                    ),
                    IconButton(
                      onPressed: (){},
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
          SizedBox(height: 90,),

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
                      onPressed: (){}, 
                      icon: Icon(Icons.add_circle_outline_rounded)
                      ),
                    Text('1'),
                    IconButton(
                      onPressed: (){}, 
                      icon: Icon(Icons.do_not_disturb_on_outlined)
                      ),
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
*/