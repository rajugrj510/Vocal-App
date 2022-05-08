// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:vocal_app/metronome/constants.dart';
import 'Round_Icon_Button.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';

class Metronome extends StatefulWidget {
  @override
  _MetronomeState createState() => _MetronomeState();
}

class _MetronomeState extends State<Metronome> {
  int tempo = 70;
  double value = 99;
  double tempTemp = 1.0;
  String meter = '4/4';
  String subdiv = 'SUB/DIV';
  double frameWidth = 400;
  //This is the dragable bottom sheet modal for numeric keypad
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

//This is the bottom sheet display for the meter
  void showMeterModal(context) {
    showModalBottomSheet(
        backgroundColor: Color(0xFF6B8AFD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35.0),
          ),
        ),
        isDismissible: true,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 8.0, bottom: 2.0),
                  height: 10.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 70.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF337FF3),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '3/4',
                            style: ktextMeterStyle,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 70.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF337FF3),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '4/4',
                            style: ktextMeterStyle,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 70.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF337FF3),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '6/8',
                            style: ktextMeterStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

//This the bottom sheet function to display the subdivision of the tempo.
  void showDivisionModal(context) {
    showModalBottomSheet(
        backgroundColor: Color(0xFF6B8AFD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35.0),
          ),
        ),
        isDismissible: true,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //container for the white bar at the top of container
                Container(
                  margin: EdgeInsets.only(top: 8.0, bottom: 2.0),
                  height: 10.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                  //This is the row of subdivison
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF337FF3),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: IconButton(
                          iconSize: 40.0,
                          color: Colors.white,
                          icon: Icon(Icons.music_note_outlined),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF337FF3),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: IconButton(
                          iconSize: 40.0,
                          color: Colors.white,
                          icon: Icon(Icons.music_note_outlined),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF337FF3),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: IconButton(
                          iconSize: 40.0,
                          color: Colors.white,
                          icon: Icon(Icons.music_note_outlined),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF337FF3),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: IconButton(
                          iconSize: 40.0,
                          color: Colors.white,
                          icon: Icon(Icons.music_note_outlined),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF337FF3),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: IconButton(
                          iconSize: 40.0,
                          color: Colors.white,
                          icon: Icon(Icons.music_note_outlined),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                //This is the container for the bottom dark blue line dividr
                Container(
                  margin: EdgeInsets.only(top: 8.0, bottom: 2.0),
                  height: 8.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF0055D6),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                )
              ],
            ),
          );
        });
  }

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
                onPressed: () {},
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
              height: 200.0,
              width: 600.0,
              margin: EdgeInsets.fromLTRB(17.0, 20.0, 30.0, 10.0),
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
              //This is the row of tempo box and slider
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
                  // Column of meter and sub division.
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
                            InkWell(
                              onTap: () {
                                showMeterModal(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    meter, //The meter data show
                                    style: kdivisionTextStyle,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            //This is the container for sub/div
                            InkWell(
                              splashColor: Colors.blue,
                              onTap: () {
                                showDivisionModal(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      3.0, 6.0, 3.0, 6.0),
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
                    height: 330,
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
                    height: 220,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //Three Icon button previous, next and Play
                        Material(
                          // borderRadius: BorderRadiusGeometry,
                          color: Colors.white,
                          child: IconButton(
                            splashColor: Colors.blue,
                            //disabledColor: Colors.deepOrange,
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.chevronLeft,
                              size: 30.0,
                            ),
                          ),
                        ),
                        Material(
                          child: IconButton(
                            splashColor: Colors.blue,
                            onPressed: () {},
                            icon: Icon(FontAwesomeIcons.play),
                            iconSize: 60.0,
                          ),
                        ),
                        Material(
                          child: IconButton(
                            splashColor: Colors.blue,
                            onPressed: () {},
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
