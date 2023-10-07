import 'dart:async';
import 'dart:convert';
import 'package:covid19app/Models/Country.dart';
import 'package:covid19app/Screens/Contact.dart';
import 'package:covid19app/Screens/CountriesData.dart';
import 'package:covid19app/Screens/Home_View.dart';
import 'package:covid19app/Screens/Symptoms.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:hidden_drawer_menu/simple_hidden_drawer/simple_hidden_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'Models/Services.dart';
import 'Screens/About.dart';

class HomePage extends StatefulWidget {

  final List<String> links;

  const HomePage({Key key, this.links}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Country> countryWiseData;
  bool isLoading = true;
  Map worldData;
  YoutubePlayerController controller0;
  YoutubePlayerController controller1;
  YoutubePlayerController controller2;
  List<String> youtubelinks = [];
  // Future getData() async {
  //   var response = await http
  //       // .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
  //   // var response1 = await http
  //   //     .get(Uri.encodeFull(url1), headers: {"Accept": "application/json"});
  //   // http.Response response1 = await http.get('https://corona.lmao.ninja/v2/all');

  //   List data = jsonDecode(response.body);
  //   // var data1 = jsonDecode(response1.body);
  //   setState(() {
  //     countryWiseData = data;
  //     // worldData = json.decode(response1.body);
  //     // isLoading = false;
  //   });
  //   // print(worldData.values);
  // }

  @override
  void initState() {
    super.initState();
    Services.getCountrys().then((usersFromServer) {
      setState(() {
        countryWiseData = usersFromServer;
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller0 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.links[0]),
        flags: YoutubePlayerFlags(
          autoPlay: false,
        ),
      );
      controller1 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.links[1]),
        flags: YoutubePlayerFlags(
          autoPlay: false,
        ),
      );
      controller2 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.links[2]),
        flags: YoutubePlayerFlags(
          autoPlay: false,
        ),
      );
    });
    // WidgetsBinding.instance.addPostFrameCallback((_) {

    // });
    // isLoading=false;
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?',
                style: TextStyle(fontFamily: 'Courgette')),
            content: Text('Do you want to exit the Application',
                style: TextStyle(fontFamily: 'Courgette')),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No',
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'Courgette')),
              ),
              FlatButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: Text('Yes',
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'Courgette')),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SimpleHiddenDrawer(
        menu: Menu(),
        screenSelectedBuilder: (position, controller) {
          Widget screenCurrent;
          switch (position) {
            case 0:
              screenCurrent = HomeView(
                links: youtubelinks,
                controller0: controller0,
                controller1: controller1,
                controller2: controller2,
              );
              break;
            case 1:
              screenCurrent = CountriesData(
                countryData: countryWiseData,
              );
              break;
            case 2:
              screenCurrent = About();
              break;
            case 3:
              screenCurrent = Symptoms();
              break;
            case 4:
              screenCurrent = Contact();
              break;
          }

          return Scaffold(
            // appBar: AppBar(
            //   leading: IconButton(
            //       icon: Icon(Icons.menu),
            //       onPressed: () {
            //         controller.toggle();
            //       }),
            // ),
            body: Container(
              // color: Color(0xFFDDFBFB),
              // color: Color(0xFF87ADD6),
              // color: Colors.white,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.1, 0.3, 0.6, 0.9],
                  colors: [
                    Color(0xFF87ADD6),
                    Color(0xFFFCFDFE),
                    Color(0xFF87ADD6),
                    Color(0xFFFCFDFE),
                    // Colors.grey[400],
                    // Colors.blue[200]
                  ],
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 35.0,
                    left: 18.0,
                    child: IconButton(
                        // color: Colors.white,
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          controller.toggle();
                        }),
                  ),
                  Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 45.0,
                          ),
                          Center(
                            child: Text(
                              'COVID-19 App',
                              style: TextStyle(
                                  fontSize: 23.0,
                                  // color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lora'),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Expanded(child: screenCurrent),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: (MediaQuery.of(context).size.height / 2) + 75.0,
                    right: 0.0,
                    child: Container(
                      // decoration: BoxDecoration(
                      //     border: Border.all(
                      //       color: Colors.black38,
                      //       width: 1.0,
                      //     ),
                      //     borderRadius: BorderRadius.circular(5.0)),
                      height: 100.0,
                      width: 35.0,
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.yellow),
                            // margin: EdgeInsets.all(4.0),
                            child: IconButton(
                              icon: Icon(
                                Icons.call,
                                color: Colors.blue,
                              ),
                              iconSize: 15.0,
                              color: Colors.black45,
                              tooltip: 'Helpline Number',
                              onPressed: () async {
                                const dial = "tel:1075";
                                if (await canLaunch(dial)) {
                                  await launch(dial);
                                } else {
                                  throw 'Could not launch $dial';
                                }
                              },
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.yellow),
                            child: IconButton(
                              icon: Icon(
                                Icons.info_outline,
                                color: Color(0xFF0F2985),
                              ),
                              iconSize: 15.0,
                              color: Colors.black45,
                              tooltip: 'Open Site WHO\'s Website',
                              onPressed: () async {
                                if (await canLaunch(
                                    "https://www.who.int/health-topics/coronavirus")) {
                                  await launch(
                                      "https://www.who.int/health-topics/coronavirus");
                                } else {
                                  throw 'Could not launch https://www.who.int/health-topics/coronavirus';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Customer {
  String name;
  int age;

  Customer(this.name, this.age);
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with TickerProviderStateMixin {
  AnimationController _animationController;
  bool initConfigState = false;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    confListenerState(context);

    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.cyan,
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Image(
              image: AssetImage('images/IMG7.png'),
              fit: BoxFit.cover,
            ),
            // color: Color(0xFF0E1633),
            // color: Color(0xFF6E8692),
            // decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //         begin: Alignment.topRight,
            //         end: Alignment.bottomLeft,
            //         stops: [
            //       0.4,
            //       0.6
            //     ],
            //         colors: [
            //       Color(0xFF44F1A6),
            //       Color(0xFFFCFDFE),
            //       // Colors.grey[400],
            //       // Colors.blue[200]
            //     ])),
          ),
          // Center(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: <Widget>[
          //       Container(
          //         width: 250.0,
          //         height: 150.0,
          //         child: Image(
          //           image: AssetImage('images/IMG3.jpg'),
          //           // fit: BoxFit.cover,
          //         ),
          //       ),
          //       //     Container(
          //       //   // height: 65.0,
          //       //   // width: 200.0,
          //       //   child: Center(
          //       //     child: Text(
          //       //       "Stay Home, Stay Safe and Save Lives. Let the Mother-Nature Heal",
          //       //       style: TextStyle(
          //       //         color: Color(0xFF0F2985),
          //       //         fontFamily: 'Lora',
          //       //         fontWeight: FontWeight.bold,
          //       //         fontSize: 18.0,
          //       //       ),
          //       //     ),
          //       //   ),
          //       // ),
          //     ],
          //   ),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // SizedBox(height: 100.0,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Center(
                    child: Text(
                      "\"Stay Home, Stay Safe\n& Save Lives.\nLet the Mother-Nature Heal\"",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontFamily: 'Lora',
                        fontWeight: FontWeight.bold,
                        fontSize: 21.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              FadeTransition(
                opacity: _animationController,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          margin: EdgeInsets.only(bottom: 5.0),
                          padding: EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: Color(0xFFDDFBFB), width: 2.0)),
                          child: FlatButton(
                            onPressed: () {
                              SimpleHiddenDrawerProvider.of(context)
                                  .setSelectedMenuPosition(0);
                            },
                            color: Colors.black26,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.home,
                                  color: Colors.white,
                                  size: 28.0,
                                ),
                                SizedBox(width: 20.0),
                                Text(
                                  "Home Page",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Courgette',
                                    fontSize: 17.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          margin: EdgeInsets.only(bottom: 5.0),
                          padding: EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: Color(0xFFDDFBFB), width: 2.0)),
                          child: FlatButton(
                            onPressed: () {
                              SimpleHiddenDrawerProvider.of(context)
                                  .setSelectedMenuPosition(1);
                            },
                            color: Colors.black26,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.report,
                                  color: Colors.white,
                                  size: 28.0,
                                ),
                                SizedBox(width: 20.0),
                                Text(
                                  "Number of Cases\nin different\nCountries",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Courgette',
                                    fontSize: 17.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          endIndent: 100.0,
                          indent: 20.0,
                          // color: Colors.black,
                          thickness: 1.2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          margin: EdgeInsets.only(bottom: 5.0),
                          padding: EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: Color(0xFFDDFBFB), width: 2.0)),
                          child: FlatButton(
                            onPressed: () {
                              SimpleHiddenDrawerProvider.of(context)
                                  .setSelectedMenuPosition(2);
                            },
                            color: Colors.black26,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.info_outline,
                                  color: Colors.white,
                                  size: 28.0,
                                ),
                                SizedBox(width: 20.0),
                                Text(
                                  "About COVID-19",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Courgette',
                                    fontSize: 17.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          margin: EdgeInsets.only(bottom: 5.0),
                          padding: EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: Color(0xFFDDFBFB), width: 2.0)),
                          child: FlatButton(
                            onPressed: () {
                              SimpleHiddenDrawerProvider.of(context)
                                  .setSelectedMenuPosition(3);
                            },
                            color: Colors.black26,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.local_hospital,
                                  color: Colors.white,
                                  size: 28.0,
                                ),
                                SizedBox(width: 20.0),
                                Text(
                                  "Symptoms &\nPreventions",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Courgette',
                                    fontSize: 17.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          margin: EdgeInsets.only(bottom: 5.0),
                          padding: EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: Color(0xFFDDFBFB), width: 2.0)),
                          child: FlatButton(
                            onPressed: () {
                              SimpleHiddenDrawerProvider.of(context)
                                  .setSelectedMenuPosition(4);
                            },
                            color: Colors.black26,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.call,
                                  color: Colors.white,
                                  size: 28.0,
                                ),
                                SizedBox(width: 20.0),
                                Text(
                                  "Contact ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Courgette',
                                    fontSize: 17.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Container(
          //     // height: 65.0,
          //     // width: 200.0,
          //     child: Center(
          //       child: Text(
          //         "Stay Home, Stay Safe and Save Lives. Let the Mother-Nature Heal",
          //         style: TextStyle(
          //           color: Color(0xFF0F2985),
          //           fontFamily: 'Lora',
          //           fontWeight: FontWeight.bold,
          //           fontSize: 18.0,
          //         ),
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }

  void confListenerState(BuildContext context) {
    if (!initConfigState) {
      initConfigState = true;
      SimpleHiddenDrawerProvider.of(context)
          .getMenuStateListener()
          .listen((state) {
        if (state == MenuState.open) {
          _animationController.forward();
        }

        if (state == MenuState.closing) {
          _animationController.reverse();
        }
      });
    }
  }
}
