import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:tonic/tonic.dart';

class Piano extends StatefulWidget {
  const Piano({Key? key}) : super(key: key);

  @override
  _PianoState createState() => _PianoState();
}

class _PianoState extends State<Piano> {
  final FlutterMidi flutterMidi = FlutterMidi();

  @override
  void initState() {
    setupMIDIPlugin();
    super.initState();
  }

  Future<void> setupMIDIPlugin() async {
    flutterMidi.unmute();
    ByteData _byte = await rootBundle.load('assets/Piano.sf2');
    flutterMidi.prepare(sf2: _byte);
  }

  double get keyWidth => 80 + (80 * _widthRatio);
  double _widthRatio = 0.0;
  bool _showLabels = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vocal App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(title: Text("Piano")),
          drawer: Drawer(
              child: SafeArea(
                  child: ListView(children: <Widget>[
            Container(height: 20.0),
            ListTile(title: Text("Change Width")),
            Slider(
                activeColor: Colors.redAccent,
                inactiveColor: Colors.white,
                min: 0.0,
                max: 1.0,
                value: _widthRatio,
                onChanged: (double value) =>
                    setState(() => _widthRatio = value)),
            Divider(),
            ListTile(
                title: Text("Show Labels"),
                trailing: Switch(
                    value: _showLabels,
                    onChanged: (bool value) =>
                        setState(() => _showLabels = value))),
            Divider(),
          ]))),
          body: ListView.builder(
            itemCount: 7,
            scrollDirection: Axis.vertical,
            controller: ScrollController(initialScrollOffset: 1500.0),
            itemBuilder: (BuildContext context, int index) {
              final int i = index * 12;
              return SafeArea(
                child: Stack(children: <Widget>[
                  Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    _buildKey(24 + i, false),
                    _buildKey(26 + i, false),
                    _buildKey(28 + i, false),
                    _buildKey(29 + i, false),
                    _buildKey(31 + i, false),
                    _buildKey(33 + i, false),
                    _buildKey(35 + i, false),
                  ]),
                  Positioned(
                      left: 0.0,
                      //right: 80.0,
                      bottom: 8,
                      top: 0.0,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(height: keyWidth * .5),
                            _buildKey(25 + i, true),
                            _buildKey(27 + i, true),
                            Container(height: keyWidth),
                            _buildKey(30 + i, true),
                            _buildKey(32 + i, true),
                            _buildKey(34 + i, true),
                            Container(height: keyWidth * .5),
                          ])),
                ]),
              );
            },
          )),
    );
  }

  Widget _buildKey(int midi, bool accidental) {
    playNote() {
      flutterMidi.playMidiNote(midi: midi);
    }

    stopNote() {
      flutterMidi.stopMidiNote(midi: midi);
    }

    final pitchName = Pitch.fromMidiNumber(midi).toString();
    final pianoKey = Stack(
      children: <Widget>[
        Semantics(
            button: true,
            hint: pitchName,
            child: Material(
                borderRadius: borderRadius,
                color: accidental ? Colors.black : Colors.white,
                child: InkWell(
                  borderRadius: borderRadius,
                  highlightColor: Colors.grey,
                  onTap: () {},
                  onTapDown: (_) => playNote(),
                ))),
        Positioned(
            left: 0.0,
            right: 15.0,
            bottom: 20.0,
            child: _showLabels
                ? Text(pitchName,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: !accidental ? Colors.black : Colors.white))
                : Container()),
      ],
    );
    if (accidental) {
      return Container(
          height: keyWidth,
          width: keyWidth * 3,
          margin: EdgeInsets.symmetric(vertical: 2.0),
          padding: EdgeInsets.symmetric(vertical: keyWidth * .1),
          child: Material(
              elevation: 6.0,
              borderRadius: borderRadius,
              shadowColor: Color(0x802196F3),
              child: pianoKey));
    }
    return Container(
        height: keyWidth,
        child: pianoKey,
        margin: EdgeInsets.symmetric(vertical: 2.0));
  }
}

const BorderRadius borderRadius = BorderRadius.only(
    topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0));
