import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:audioplayers/audioplayers.dart';

AudioPlayer newPlayer = new AudioPlayer();
AudioCache audio = new AudioCache(fixedPlayer: newPlayer);
bool play = false;
bool stop = true;
playAudio() {
  if (play == false || stop == true) {
    audio.play("audio/demoaudio.mp3");
    play = true;
    stop = false;
  }
}

pauseAudio() {
  if (play == true) {
    newPlayer.pause();
    play = false;
  }
}

stopAudio() {
  if (play == true && stop == false) {
    newPlayer.stop();
    play = false;
    stop = true;
  }
}

myapp() {
  FlutterStatusbarcolor.setStatusBarColor(Colors.greenAccent);
  FlutterStatusbarcolor.setNavigationBarColor(Colors.blue.shade900);

  var body = Scaffold(
    appBar: AppBar(
      title: Text("Melody"),
      backgroundColor: Colors.redAccent,
    ),
    backgroundColor: Colors.limeAccent,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 400,
          height: 400,
          child: Image.asset("images/796858.jpg"),
        ),
        Row(
          children: <Widget>[
            FlatButton(
              onPressed: playAudio,
              child: Icon(Icons.play_arrow),
            ),
            FlatButton(
              onPressed: pauseAudio,
              child: Icon(Icons.pause),
            ),
            FlatButton(
              onPressed: stopAudio,
              child: Icon(Icons.stop),
            ),
          ],
        ),
      ],
    ),
  );

  var design = MaterialApp(
    home: body,
    debugShowCheckedModeBanner: false,
  );
  return design;
}
