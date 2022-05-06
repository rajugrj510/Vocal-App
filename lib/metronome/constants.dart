import 'package:flutter/material.dart';

const kactiveSliderTrackColor = Color(0xFF1565C0);
const kthumbColor = Color(0xFF42A5F5);

const kactiveSliderHeight = 8.0;
const kinactiveSliderHeight = 8.0;
const ksizedBoxWidth = 6.0;

const ktextStyle = TextStyle(
  color: Colors.white,
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
);
const ktextMeterStyle = TextStyle(
  color: Colors.white,
  fontSize: 30.0,
  fontWeight: FontWeight.w600,
);
const kdivisionTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 15.0,
  fontWeight: FontWeight.bold,
);
//Button style for Tap button at the metronome screen
final ButtonStyle kstyleTap = ElevatedButton.styleFrom(
  primary: Colors.blueAccent,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
  textStyle: const TextStyle(
    color: Colors.white,
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  ),
);
final ButtonStyle kstyleCenterNumberButton = ElevatedButton.styleFrom(
  primary: Colors.black,
  elevation: 30.0,
  padding: EdgeInsets.fromLTRB(25.0, 12.0, 25.0, 12.0),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
  ),
  textStyle: const TextStyle(
    color: Colors.white,
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  ),
);
final ButtonStyle kstyleLeftNumberButton = ElevatedButton.styleFrom(
  primary: Colors.black,
  padding: EdgeInsets.fromLTRB(25.0, 12.0, 25.0, 12.0),
  elevation: 30.0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.horizontal(
      left: Radius.circular(20.0),
      right: Radius.circular(8.0),
    ),
  ),
  textStyle: const TextStyle(
    color: Colors.white,
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  ),
);
final ButtonStyle kstyleRightNumberButton = ElevatedButton.styleFrom(
  primary: Colors.black,
  padding: EdgeInsets.fromLTRB(25.0, 12.0, 25.0, 12.0),
  elevation: 30.0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.horizontal(
      left: Radius.circular(8.0),
      right: Radius.circular(20.0),
    ),
  ),
  textStyle: const TextStyle(
    color: Colors.white,
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  ),
);

final ButtonStyle kstyleClearButton = ElevatedButton.styleFrom(
  primary: Colors.yellow[800],
  shadowColor: Colors.black,
  padding: EdgeInsets.fromLTRB(25.0, 12.0, 25.0, 12.0),
  elevation: 30.0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.horizontal(
      left: Radius.circular(20.0),
      right: Radius.circular(8.0),
    ),
  ),
  textStyle: const TextStyle(
    color: Colors.white,
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  ),
);
final ButtonStyle kstyleSetButton = ElevatedButton.styleFrom(
  shadowColor: Colors.black,
  padding: EdgeInsets.fromLTRB(15.0, 12.0, 25.0, 12.0),
  primary: Color(0xFFD22E2F),
  elevation: 30.0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.horizontal(
      left: Radius.circular(8.0),
      right: Radius.circular(20.0),
    ),
  ),
  textStyle: const TextStyle(
    color: Colors.white,
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  ),
);
