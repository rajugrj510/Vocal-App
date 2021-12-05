import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Piano extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded keys(int soundNumber, int soundNum2) {
    return Expanded(
      flex: 1,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 2.0, top: 2.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  playSound(soundNumber);
                }, //onWhiteKeyPress,
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
                child: const Text(''),
              ),
            ),
          ),
          Positioned(
              top: -25.0,
              child: Container(
                  width: 250,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      playSound(soundNum2);
                    }, //onBlackKeyPress,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black)),
                    child: const Text(''),
                  )))
        ],
      ),
    );
  }

  Expanded whiteKey(int soundNumber) {
    return Expanded(
      flex: 1,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 2.0, top: 2.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  playSound(soundNumber);
                }, //onWhiteKeyPress,
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
                child: const Text(''),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              whiteKey(13),
              whiteKey(12),
              keys(10, 11),
              keys(8, 9),
              keys(6, 7),
              whiteKey(5),
              keys(3, 4),
              keys(1, 2),
            ],
          ),
        ),
      ),
    );
  }
}
