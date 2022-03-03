import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';

enum KeyColor { WHITE, BLACK }

class PianoKey extends StatelessWidget {
  final KeyColor color;
  final double width;
  final int midiNote;
  final FlutterMidi flutterMidi;

  const PianoKey.white({
    required this.width,
    required this.midiNote,
    required this.flutterMidi,
  }) : this.color = KeyColor.WHITE;

  const PianoKey.black({
    required this.width,
    required this.midiNote,
    required this.flutterMidi,
  }) : this.color = KeyColor.BLACK;

  playNote() {
    flutterMidi.playMidiNote(midi: midiNote);
  }

  stopNote() {
    flutterMidi.stopMidiNote(midi: midiNote);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => playNote(),
      onTapUp: (_) => stopNote(),
      child: Container(
        height: width,
        decoration: BoxDecoration(
          color: color == KeyColor.WHITE ? Colors.white : Colors.black,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        ),
      ),
    );
  }
}

class Piano extends StatefulWidget {
  const Piano({Key? key}) : super(key: key);

  @override
  _PianoState createState() => _PianoState();
}

class _PianoState extends State<Piano> {
  final octaveNumber = 3;
  final FlutterMidi flutterMidi = FlutterMidi();

  @override
  void initState() {
    setupMIDIPlugin();
    super.initState();
  }

  Future<void> setupMIDIPlugin() async {
    flutterMidi.unmute();
    ByteData _byte =
        await rootBundle.load('assets/Yamaha-Grand-Lite-SF-v1.1.sf2');
    flutterMidi.prepare(sf2: _byte);
  }

  get octaveStartingNote => (octaveNumber * 12) % 128;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final whiteKeySize = constraints.maxHeight / 7;
        final blackKeySize = whiteKeySize / 2;
        return Stack(
          children: [
            _buildWhiteKeys(whiteKeySize),
            _buildBlackKeys(constraints.maxWidth, blackKeySize, whiteKeySize),
          ],
        );
      },
    );
  }

  _buildWhiteKeys(double whiteKeySize) {
    return Column(
      children: [
        PianoKey.white(
          width: whiteKeySize,
          midiNote: octaveStartingNote + 11,
          flutterMidi: flutterMidi,
        ),
        PianoKey.white(
          width: whiteKeySize,
          midiNote: octaveStartingNote + 9,
          flutterMidi: flutterMidi,
        ),
        PianoKey.white(
          width: whiteKeySize,
          midiNote: octaveStartingNote + 7,
          flutterMidi: flutterMidi,
        ),
        PianoKey.white(
          width: whiteKeySize,
          midiNote: octaveStartingNote + 5,
          flutterMidi: flutterMidi,
        ),
        PianoKey.white(
          width: whiteKeySize,
          midiNote: octaveStartingNote + 4,
          flutterMidi: flutterMidi,
        ),
        PianoKey.white(
          width: whiteKeySize,
          midiNote: octaveStartingNote + 2,
          flutterMidi: flutterMidi,
        ),
        PianoKey.white(
          width: whiteKeySize,
          midiNote: octaveStartingNote,
          flutterMidi: flutterMidi,
        ),
      ],
    );
  }

  _buildBlackKeys(
      double pianoHeight, double blackKeySize, double whiteKeySize) {
    return Container(
      width: pianoHeight * 0.55,
      child: Column(
        children: [
          SizedBox(
            height: whiteKeySize - blackKeySize / 2,
          ),
          PianoKey.black(
            width: blackKeySize,
            midiNote: octaveStartingNote + 10,
            flutterMidi: flutterMidi,
          ),
          SizedBox(
            height: whiteKeySize - blackKeySize,
          ),
          PianoKey.black(
            width: blackKeySize,
            midiNote: octaveStartingNote + 8,
            flutterMidi: flutterMidi,
          ),
          SizedBox(
            height: whiteKeySize - blackKeySize,
          ),
          PianoKey.black(
            width: blackKeySize,
            midiNote: octaveStartingNote + 6,
            flutterMidi: flutterMidi,
          ),
          SizedBox(
            height: whiteKeySize,
          ),
          SizedBox(
            height: whiteKeySize - blackKeySize,
          ),
          PianoKey.black(
            width: blackKeySize,
            midiNote: octaveStartingNote + 3,
            flutterMidi: flutterMidi,
          ),
          SizedBox(
            height: whiteKeySize - blackKeySize,
          ),
          PianoKey.black(
            width: blackKeySize,
            midiNote: octaveStartingNote + 1,
            flutterMidi: flutterMidi,
          ),
        ],
      ),
    );
  }
}
