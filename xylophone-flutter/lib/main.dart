import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int number) {
    final player = AudioCache();
    player.play('note$number.wav');
  }

  Container createSoundButton(Color color, int numberOfSound) {
    return Container(
      child: Expanded(
        child: FlatButton(
          child: Container(),
          onPressed: () {
            playSound(numberOfSound);
          },
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              createSoundButton(Colors.red, 1),
              createSoundButton(Colors.orange, 2),
              createSoundButton(Colors.yellow, 3),
              createSoundButton(Colors.green, 4),
              createSoundButton(Colors.teal, 5),
              createSoundButton(Colors.blue, 6),
              createSoundButton(Colors.purple, 7),
            ],
          ),
        ),
      ),
    );
  }
}
