import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'HomePage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _key = GlobalKey<ScaffoldState>();
  bool isSignedIn = false;
  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();
  List<String> links = [];

  @override
  void initState() {
    links = [];
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _databaseReference.child('youtube_links').onValue.listen((event) {
        for (var i123 = 0; i123 < 3; i123++) {
          setState(() {
            links.add(event.snapshot.value[i123]);
          });
        }
      });
    });
    Timer(
        Duration(seconds: 8),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      links: links,
                    ))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Color(0xaac6c6c6),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                child: Image(
                  image: AssetImage(
                    'images/splashscreenmg.png',
                  ),
                  fit: BoxFit.fill,
                ),
                decoration: BoxDecoration(color: Colors.white),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  HeartbeatProgressIndicator(
                    // child: CircularProgressIndicator(
                    //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    // ),
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Developed with ♥ by",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Lobster',
                        fontStyle: FontStyle.italic,
                        fontSize: 16.0,
                        color: Colors.white),
                  ),
                  Text(
                    'Darshil Chheda',
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Lobster',
                        fontStyle: FontStyle.italic,
                        fontSize: 16.0,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20.0,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
