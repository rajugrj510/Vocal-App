import 'dart:async';

import 'package:audio_player_example/api/sound_player.dart';
import 'package:audio_player_example/api/sound_recorder.dart';
import 'package:audio_player_example/widget/timer_widget.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Audio Recorder';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.red),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final timerController = TimerController();
  final recorder = SoundRecorder();
  final player = SoundPlayer();

  @override
  void initState() {
    super.initState();

    recorder.init();
    player.init();
  }

  @override
  void dispose() {
    player.dispose();
    recorder.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        backgroundColor: Colors.black87,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildPlayer(),
              SizedBox(height: 16),
              buildStart(),
              SizedBox(height: 20),
              buildPlay(),
            ],
          ),
        ),
      );

  Widget buildPlay() {
    final isPlaying = player.isPlaying;
    final icon = isPlaying ? Icons.stop : Icons.play_arrow;
    final text = isPlaying ? 'Stop Playing' : 'Play Recording';

    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(175, 50),
        primary: Colors.white,
        onPrimary: Colors.black,
      ),
      icon: Icon(icon),
      label: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onPressed: () async {
        if (!recorder.isRecordingAvailable) return;

        await player.togglePlaying(whenFinished: () => setState(() {}));
        setState(() {});
      },
    );
  }

  Widget buildStart() {
    final isRecording = recorder.isRecording;
    final icon = isRecording ? Icons.stop : Icons.mic;
    final text = isRecording ? 'STOP' : 'START';
    final primary = isRecording
        ? Color.fromARGB(255, 255, 20, 20)
        : Color.fromARGB(240, 81, 224, 24);
    final onPrimary = isRecording
        ? Color.fromARGB(255, 240, 243, 239)
        : Color.fromARGB(255, 255, 255, 255);

    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(175, 50),
        primary: primary,
        onPrimary: onPrimary,
      ),
      icon: Icon(icon),
      label: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onPressed: () async {
        if (player.isPlaying) return;

        await recorder.toggleRecording();
        final isRecording = recorder.isRecording;
        setState(() {});

        if (isRecording) {
          timerController.startTimer();
        } else {
          timerController.stopTimer();
        }
      },
    );
  }

  Widget buildPlayer() {
    final text = recorder.isRecording ? 'Now Recording' : 'Press Start';
    final animate = player.isPlaying || recorder.isRecording;

    return AvatarGlow(
      endRadius: 140,
      animate: animate,
      repeatPauseDuration: Duration(milliseconds: 100),
      child: CircleAvatar(
        radius: 100,
        backgroundColor: Color.fromARGB(193, 255, 19, 19),
        child: CircleAvatar(
          radius: 92,
          backgroundColor: Color.fromARGB(255, 244, 67, 54).withBlue(70),
          child: player.isPlaying
              ? Icon(Icons.play_arrow, size: 120)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.mic, size: 32),
                    TimerWidget(controller: timerController),
                    SizedBox(height: 8),
                    Text(text),
                  ],
                ),
        ),
      ),
    );
  }
}
