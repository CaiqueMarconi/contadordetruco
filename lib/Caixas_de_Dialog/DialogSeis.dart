import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class DialogSeis extends StatefulWidget {
  @override
  _DialogSeisState createState() => _DialogSeisState();
}

class _DialogSeisState extends State<DialogSeis> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();

  _executar() async {
    audioPlayer = await audioCache.play("truc60.mp3");
  }

  _executar1() async {
    audioPlayer = await audioCache.play("truc61.mp3");
  }

  Widget _alerta() {
    Alert(
      context: context,
      //type: AlertType.info,
      title: "TRUCOOOOOOO!!!!",
      content: Text("SEISSSSS"),
      buttons: [
        DialogButton(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.only(left: 0, right: 1),
          child: Text(
            "1",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            _executar();
            Navigator.pop(context);
          },
          color: Colors.red,
        ),
        DialogButton(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.only(left: 1, right: 1),
          child: Text(
            "2",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            _executar1();
            Navigator.pop(context);
          },
          color: Colors.green,
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          _alerta();
        });

      },
      backgroundColor: Colors.purple,
      child: Center(child: Text("Seis!")),
    );
  }
}
