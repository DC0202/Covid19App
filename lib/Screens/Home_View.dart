import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeView extends StatefulWidget {
  final List<String> links;
  final YoutubePlayerController controller0;
  final YoutubePlayerController controller1;
  final YoutubePlayerController controller2;

  const HomeView(
      {Key key,
      this.links,
      this.controller0,
      this.controller1,
      this.controller2})
      : super(key: key);
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String url1 = "https://corona.lmao.ninja/v2/all";
  Map worldData;
  bool isLoading = true;
  // int i = 0;
  // String youtubeURL1 = "https://www.youtube.com/watch?v=pxoIufVFjOk";
  // String youtubeURL2 = "https://www.youtube.com/watch?v=Y9VgmhxtJFk";
  // String youtubeURL3 = "https://www.youtube.com/watch?v=9vDDM8G9tcs";
  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();
  List<String> links = [];
  List<YoutubePlayerController> controllers = [];

  String question1 = "";

  // Future getData() async {
  //   var response1 = await http
  //       .get(Uri.encodeFull(url1), headers: {"Accept": "application/json"});
  //   // http.Response response1 = await http.get('https://corona.lmao.ninja/v2/all');

  //   // var data1 = jsonDecode(response1.body);
  //   setState(() {
  //     // countryWiseData = data;
  //     worldData = json.decode(response1.body);
  //   });
  //   // print(worldData['cases']);
  // }

  Future getContent() async {
    question1 = "";
    // links = [];
    controllers = [];
    testData = [];
    var response1 = await http
        .get(Uri.encodeFull(url1), headers: {"Accept": "application/json"});
    // http.Response response1 = await http.get('https://corona.lmao.ninja/v2/all');

    // var data1 = jsonDecode(response1.body);
    setState(() {
      // countryWiseData = data;
      worldData = json.decode(response1.body);
    });
    // _databaseReference.child('youtube_links').onValue.listen((event) {
    //   for (var i123 = 0; i123 < 3; i123++) {
    //     setState(() {
    //       links.add(event.snapshot.value[i123]);
    //     });
    //   }
    // });
    _databaseReference.onValue.listen((event) {
      setState(() {
        question1 = event.snapshot.value['question1'];
      });
    });
    // _databaseReference.child('youtube_links').onValue.listen((event) {
    //   // Map<dynamic, dynamic> linksall = event.snapshot.value;
    //   for (var i123 = 0; i123 < 3; i123++) {
    //     // _databaseReference
    //     //     .child('youtube_links/$i123')
    //     //     .onValue
    //     //     .listen((event1) {

    //     // });
    //     setState(() {
    //       links.add(event.snapshot.value[i123]);
    //     });
    //   }
    // });
    _databaseReference.child('question6').onValue.listen((event) {
      // List linksall = event.snapshot.value;
      for (var i1 = 0; i1 < 5; i1++) {
        setState(() {
          testData.add(event.snapshot.value[i1]);
        });
      }
      // _databaseReference
      //     .child('youtube_links/$i')
      //     .onValue
      //     .listen((event1) {

      // });
    });
    // for (var i = 0; i < links.length; i++) {
    //   setState(() {
    //     controllers.add(
    //       YoutubePlayerController(
    //         initialVideoId: YoutubePlayer.convertUrlToId(links[i]),
    //         flags: YoutubePlayerFlags(
    //           autoPlay: false,
    //         ),
    //       ),
    //     );
    //   });
    // }
    // for (var i = 0; i < testData.length; i++) {
    //   print(testData[i]);
    // }
    // for (var i = 0; i < links.length; i++) {
    //   print(links[i]);
    // }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // this.getData();
      this.getContent();
    });
  }

  List<String> testData = [];
  //   'People can catch COVID-19 from others who have the virus. The disease spreads primarily from person to person through small droplets from the nose or mouth, which are expelled when a person with COVID-19 coughs, sneezes, or speaks.',
  //   'People can catch COVID-19 if they breathe in these droplets from a person infected with the virus. This is why it is important to stay at least 1 meter away from others.',
  //   'These droplets can land on objects and surfaces around the person such as tables, doorknobs and handrails. People can become infected by touching these objects or surfaces, then touching their eyes, nose or mouth.',
  //   'This is why it is important to wash your hands regularly with soap and water or clean with alcohol-based hand rub.',
  //   'WHO is assessing ongoing research on the ways that COVID-19 is spread and will continue to share updated findings.',
  // ];

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 20.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: <Widget>[
                  //       IconButton(
                  //         // color: Colors.white,
                  //         icon: Icon(Icons.replay),
                  //         onPressed: () async {
                  //           setState(() {
                  //             isLoading=true;
                  //             getData();
                  //           });
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    height: 200.0,
                    child: PageView(
                      physics: BouncingScrollPhysics(),
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        RubberBand(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.black87,
                            ),
                            padding: EdgeInsets.all(10.0),
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Image(
                                  image: AssetImage('images/IMG4.png'),
                                  height: 100.0,
                                  width: 100.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Total Cases:  ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Lora',
                                          fontSize: 16.0,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      Text(
                                        '${worldData['cases']}',
                                        // '$i',
                                        style: TextStyle(
                                          color: Colors.yellow,
                                          fontFamily: 'Lora',
                                          fontSize: 20.0,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        'Total Deaths:  ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Lora',
                                          fontSize: 16.0,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      Text(
                                        '${worldData['deaths']}',
                                        // '$i',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontFamily: 'Lora',
                                          fontSize: 20.0,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        'Total Recovered:  ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Lora',
                                          fontSize: 16.0,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      Text(
                                        '${worldData['recovered']}',
                                        // '$i',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontFamily: 'Lora',
                                          fontSize: 20.0,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        RubberBand(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.black87,
                            ),
                            padding: EdgeInsets.all(10.0),
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            width: 100,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Today\'s Data:  ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Lora',
                                      fontSize: 20.0,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                  Wrap(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            'Today Cases:  ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Lora',
                                              fontSize: 16.0,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                          Text(
                                            '${worldData['todayCases']}',
                                            // '$i',
                                            style: TextStyle(
                                              color: Colors.yellow,
                                              fontFamily: 'Lora',
                                              fontSize: 20.0,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ],
                                      ),
                                      // SizedBox(
                                      //   height: 10.0,
                                      // ),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            'Today Deaths:  ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Lora',
                                              fontSize: 16.0,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                          Text(
                                            '${worldData['todayDeaths']}',
                                            // '$i',
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontFamily: 'Lora',
                                              fontSize: 20.0,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ],
                                      ),
                                      // SizedBox(
                                      //   height: 10.0,
                                      // ),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            'Active Cases:  ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Lora',
                                              fontSize: 16.0,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                          Text(
                                            '${worldData['active']}',
                                            // '$i',
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontFamily: 'Lora',
                                              fontSize: 20.0,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        RubberBand(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.black87,
                            ),
                            padding: EdgeInsets.all(10.0),
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            width: 100,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Total Population:  ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Lora',
                                      fontSize: 16.0,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  Text(
                                    '${worldData['population']}',
                                    // '$i',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Lora',
                                      fontSize: 20.0,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Tests Done Overall:  ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Lora',
                                      fontSize: 16.0,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  Text(
                                    '${worldData['tests']}',
                                    // '$i',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Lora',
                                      fontSize: 20.0,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Affected Countries:  ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Lora',
                                      fontSize: 16.0,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  Text(
                                    '${worldData['affectedCountries']}',
                                    // '$i',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Lora',
                                      fontSize: 20.0,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'What is COVID-19?',
                            style: TextStyle(
                              fontFamily: 'Lora',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: question1.isEmpty ? Center(child: CircularProgressIndicator()) : Text(
                            // 'COVID-19 is the infectious disease caused by the most recently discovered coronavirus. This new virus and disease were unknown before the outbreak began in Wuhan, China, in December 2019. COVID-19 is now a pandemic affecting many countries globally.',
                            question1,
                            style: TextStyle(
                              fontFamily: 'Lora',
                              fontSize: 13.0,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Related Youtube Videos',
                            style: TextStyle(
                              fontFamily: 'Lora',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 200.0,
                          // child: PageView.builder(
                          //   itemCount: 3,
                          //   itemBuilder: (BuildContext context,i){
                          //     return Container(
                          //       height: 100.0,
                          //       width: 200.0,
                          //       color: Colors.black26,
                          //     );
                          //   },
                          // ),
                          child: widget.controller0==null ? Center(child: CircularProgressIndicator()) : PageView(
                            physics: BouncingScrollPhysics(),
                            controller: PageController(viewportFraction: 0.8),
                            scrollDirection: Axis.horizontal,
                            pageSnapping: true,
                            children: <Widget>[
                              Container(
                                // margin: EdgeInsets.all(10.0),
                                padding: EdgeInsets.all(5.0),
                                height: 175.0,
                                width: MediaQuery.of(context).size.width / 2.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                ),
                                child: YoutubePlayer(
                                  controller: widget.controller0,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10.0),
                                padding: EdgeInsets.all(5.0),
                                height: 175.0,
                                width: MediaQuery.of(context).size.width / 2.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                ),
                                child: YoutubePlayer(
                                  controller: widget.controller1,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10.0),
                                padding: EdgeInsets.all(5.0),
                                height: 175.0,
                                width: MediaQuery.of(context).size.width / 2.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                ),
                                child: YoutubePlayer(
                                  controller: widget.controller2,
                                ),
                              ),
                            ],
                          ),
                          //   child: FirebaseAnimatedList(
                          //     scrollDirection: Axis.horizontal,
                          //     physics: BouncingScrollPhysics(),
                          //     query: _databaseReference.child('youtube_links'),
                          //     itemBuilder: (BuildContext context,
                          //         DataSnapshot snapshot,
                          //         Animation<double> animation,
                          //         int index) {
                          //       return Container(
                          //         margin: EdgeInsets.only(left: 10.0),
                          //         padding: EdgeInsets.all(5.0),
                          //         height: 175.0,
                          //         width: MediaQuery.of(context).size.width / 2.3,
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(5.0),
                          //           border: Border.all(
                          //             color: Colors.black,
                          //             width: 1.0,
                          //           ),
                          //         ),
                          //         child: YoutubePlayer(
                          //           controller: controllers[index],
                          //         ),
                          //       );
                          //     },
                          //   ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'How does COVID-19 Spread?',
                            style: TextStyle(
                              fontFamily: 'Lora',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 250.0,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: testData.length,
                            itemBuilder: (BuildContext context, index) {
                              return ListTile(
                                leading: Icon(Icons.play_arrow),
                                title: Text(
                                  testData[index],
                                  style: TextStyle(
                                    fontFamily: 'Lora',
                                    fontSize: 12.0,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Preventive Measures to be taken for COVID-19',
                            style: TextStyle(
                              fontFamily: 'Lora',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Image(
                            image: AssetImage('images/IMG6.jpg'),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
