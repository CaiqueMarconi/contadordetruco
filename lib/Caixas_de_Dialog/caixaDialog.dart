import 'package:contadordetruco/Caixas_de_Dialog/DialogSeis.dart';
import 'package:contadordetruco/Caixas_de_Dialog/Dialog_nove.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Dialspeed extends StatefulWidget {
  @override
  _DialspeedState createState() => _DialspeedState();
}

class _DialspeedState extends State<Dialspeed> {

  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();

  _executar()async{
    audioPlayer = await audioCache.play("truco0.mp3");
  }
  _executar1()async{
    audioPlayer = await audioCache.play("truco1.mp3");
  }
  _executar2() async {
    audioPlayer = await audioCache.play("truco2.mp3");
  }
  _executar3() async {
    audioPlayer = await audioCache.play("truco3.mp3");
  }
  _executar4() async {
    audioPlayer = await audioCache.play("truco4.mp3");
  }
  _executar5() async {
    audioPlayer = await audioCache.play("truco5.mp3");
  }
  _executar7() async {
    audioPlayer = await audioCache.play("truco7.mp3");
  }
  _executar8() async {
    audioPlayer = await audioCache.play("truco8.mp3");
  }
  _executar9() async {
    audioPlayer = await audioCache.play("truco9.mp3");
  }

  Widget _alerta(){
    Alert(
      context: context,
      //type: AlertType.info,
      title: "Escolha uma Opção!",
      content: Text ("TRUCOOOOO!!!!"),
      //image: Image.asset("images/hand.png"),
      buttons: [
        DialogButton(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.only(left: 0, right: 1),
          child:Text("1",
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
          child:Text("2",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            _executar1();
            Navigator.pop(context);
          },
          color: Colors.green,
        ),
        DialogButton(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.only(left: 1, right: 1),
          child:Text("3",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            _executar2();
            Navigator.pop(context);
          },
          color: Colors.amber,
        ),
        DialogButton(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.only(left: 1, right: 1),
          child:Text("4",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            _executar3();
            Navigator.pop(context);
          },
          color: Colors.blue,
        ),
        DialogButton(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.only(left: 1, right: 1),
          child: Text(
            "5",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            _executar4();
            Navigator.pop(context);
          },
          color: Colors.deepOrange,
          /*gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0),
          ]),*/
        ),
        DialogButton(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.only(left: 1, right: 1),
          child:Text("6",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            _executar5();
            Navigator.pop(context);
          },
          color: Colors.purple,
        ),
        /*DialogButton(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.only(left: 1, right: 1),
          child:Text("7",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            _executar6();
            Navigator.pop(context);
          },
          color: Colors.grey,
        ),*/
        DialogButton(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.only(left: 1, right: 1),
          child:Text("7",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            _executar7();
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        DialogButton(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.only(left: 1, right: 1),
          child:Text("8",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            _executar8();
            
            if (!_interstitialReady) return;
            _interstitialAd.show();
            _interstitialReady = false;
            _interstitialAd = null;
            Navigator.pop(context);
          },
          color: Colors.lightGreenAccent,
        ),
        DialogButton(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.only(left: 1, right: 0),
          child:Text("9",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            _executar9();
            Navigator.pop(context);
          },
          color: Colors.brown,
        ),
      ],
    ).show();
  }

  static final AdRequest request = AdRequest(
    nonPersonalizedAds: true,
  );

  InterstitialAd _interstitialAd;
  bool _interstitialReady = false;

  @override
  void initState() {
    super.initState();
    MobileAds.instance.initialize().then((InitializationStatus status) {
      print('Initialization done: ${status.adapterStatuses}');
      MobileAds.instance
          .updateRequestConfiguration(RequestConfiguration(
          tagForChildDirectedTreatment:
          TagForChildDirectedTreatment.unspecified))
          .then((void value) {
        createInterstitialAd();
      });
    });
  }

  void createInterstitialAd() {
    _interstitialAd ??= InterstitialAd(
      adUnitId:  "ca-app-pub-3940256099942544/1033173712",
      request: request,
      listener: AdListener(
        onAdLoaded: (Ad ad) {
          print('${ad.runtimeType} loaded.');
          _interstitialReady = true;
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('${ad.runtimeType} failed to load: $error.');
          ad.dispose();
          _interstitialAd = null;
          createInterstitialAd();
        },
        onAdOpened: (Ad ad) => print('${ad.runtimeType} onAdOpened.'),
        onAdClosed: (Ad ad) {
          print('${ad.runtimeType} closed.');
          ad.dispose();
          createInterstitialAd();
        },
        onApplicationExit: (Ad ad) =>
            print('${ad.runtimeType} onApplicationExit.'),
      ),
    )..load();
  }



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(MaterialCommunityIcons.cards_diamond,
          size: 70, color: Colors.red,),
        FloatingActionButton(onPressed: (){
          setState(() {
            _alerta();
          });
        },
          child: Center(child: Text("Truco!")),
        ),
        DialogSeis(),
        DialogNove(),
        Icon(MaterialCommunityIcons.cards_club,
          size: 70, color: Colors.black,),
      ],
    );
  }
}
