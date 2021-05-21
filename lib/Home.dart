import 'package:contadordetruco/Front_End/rows_nomes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Front_End/Class_Rows.dart';
import 'class_adMob/ad_state.dart';
import 'file:///C:/Users/Caique/AndroidStudioProjects/contadordetruco/lib/Caixas_de_Dialog/caixaDialog.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int quedaNos = 0;
  int quedaEles = 0;

  int nos = 0;
  int eles = 0;

  ShowDialog() {
    if (nos >= 12) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: Text("Nós vencemos")),
            content:
              // define os botões na base do dialogo
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                    child: Text("Fechar"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: new Text("Confirmar"),
                    onPressed: () {
                      setState(() {
                        quedaNos++;
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )

          );
        },
      );
    }
  }

  ShowDialogEles() {
    if (eles >= 12) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: Text("Eles venceram")),
           content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FlatButton(
                    child: Text("Fechar"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: new Text("Confirmar"),
                    onPressed: () {
                      setState(() {
                        quedaEles++;
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
          );
        },
      );
    }
  }


  void pointNos(String noss) {
    setState(() {
      if (noss == "1") {
        nos++;
      } else if (noss == "3") {
        nos = nos + 3;
      } else if (noss == "6") {
        nos = nos + 6;
      } else {
        nos = nos + 9;
      }
    });
  }

  void pointEles(String eless) {
    setState(() {
      if (eless == "1") {
        eles++;
      } else if (eless == "3") {
        eles = eles + 3;
      } else if (eless == "6") {
        eles = eles + 6;
      } else {
        eles = eles + 9;
      }
    });
  }

  void refresh() {
    setState(() {
      nos = 0;
      eles = 0;
    });
    if(quedaNos == 2){
      if (!_interstitialReady) return;
      _interstitialAd.show();
      _interstitialReady = false;
      _interstitialAd = null;
    }
  }

  void reset() {
    quedaNos = 0;
    quedaEles = 0;
  }

  BannerAd banner;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
          adUnitId: adState.bannerAdUnitId,
          size: AdSize.banner,
          request: AdRequest(),
          listener: adState.adListener,
        )..load();
      });
    });
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
      adUnitId: "ca-app-pub-3940256099942544/1033173712",
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Conta Tento",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              //color: Colors.indigo[200],
              height: MediaQuery.of(context).size.height * .23,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[400],
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 8),
                child: Column(
                  children: [
                    RowsNomes(),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            height: MediaQuery.of(context).size.height * .1,
                            width: MediaQuery.of(context).size.width * .16,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              //borderRadius: BorderRadius.circular(40),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                nos.toString(),
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                nos = nos - 1;
                              });
                            },
                            mini: true,
                            backgroundColor: Colors.red,
                            child: Center(
                              child: Text(
                                "-",
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                          Container(
                            //margin: EdgeInsets.only(top: 10),
                            height: MediaQuery.of(context).size.height * .1,
                            width: MediaQuery.of(context).size.width * .12,
                            child: FloatingActionButton(
                              backgroundColor: Colors.black87,
                              onPressed: refresh,
                              child: Icon(Icons.refresh),
                            ),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                eles = eles - 1;

                              });
                            },
                            mini: true,
                            backgroundColor: Colors.red,
                            child: Center(
                              child: Text(
                                "-",
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                            height: MediaQuery.of(context).size.height * .1,
                            width: MediaQuery.of(context).size.width * .16,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              //borderRadius: BorderRadius.circular(40),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                eles.toString(),
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Vitorias(" + quedaNos.toString() + ")",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .04,
                              width: MediaQuery.of(context).size.width * .20,
                              child: RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    reset();
                                  });
                                },
                                child: Text("reset!"),
                              ),
                            ),
                            Text(
                              "Vitorias(" + quedaEles.toString() + ")",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                    ),
                  ],
                ),
              ),
            ),
            Rows(
              onTap: () {
                pointNos("1");
                ShowDialog();
              },
              color: Colors.black,
              text: Text(
                "+1",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
              onTap1: () {
                pointEles("1");
                ShowDialogEles();
              },
              color1: Colors.red,
              text1: Text(
                "+1",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Rows(
              onTap: () {
                pointNos("3");
                ShowDialog();
              },
              color: Colors.red,
              text: Text(
                "+3",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              onTap1: () {
                pointEles("3");
                ShowDialogEles();
              },
              color1: Colors.black,
              text1: Text(
                "+3",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Rows(
              onTap: () {
                pointNos("6");
                ShowDialog();
              },
              color: Colors.black,
              text: Text(
                "+6",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
              onTap1: () {
                pointEles("6");
                ShowDialogEles();
              },
              color1: Colors.red,
              text1: Text(
                "+6",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Rows(
              onTap: () {
                pointNos("0");
                ShowDialog();
              },
              color: Colors.red,
              text: Text(
                "+9",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              onTap1: () {
                pointEles("2313");
                ShowDialogEles();
              },
              color1: Colors.black,
              text1: Text(
                "+9",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Dialspeed(),
            if (banner == null)
              SizedBox(
                height: 50,
              )
            else
              Container(
                margin: EdgeInsets.only(top: 0),
                height: 50,
                child: AdWidget(
                  ad: banner,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
