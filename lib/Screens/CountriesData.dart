import 'package:covid19app/Models/Country.dart';
import 'package:covid19app/Screens/AlphabaticalWise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class CountriesData extends StatefulWidget {
  final List<Country> countryData;

  const CountriesData({Key key, this.countryData}) : super(key: key);
  @override
  _CountriesDataState createState() => _CountriesDataState();
}

class _CountriesDataState extends State<CountriesData> {
  bool changeView = false;
  List<String> alpha = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  List<Country> data1 = List();

  @override
  void initState() {
    super.initState();
    setState(() {
      data1 = widget.countryData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -11.0,
          right: 0.0,
          child: PopupMenuButton<int>(
            onSelected: (int value) {
              setState(() {
                changeView = !changeView;
              });
            },
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              PopupMenuItem<int>(
                value: 1,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 135.0,
                        child: Text(
                          changeView ? 'List View' : 'Alphabatical View',
                          style: TextStyle(fontFamily: 'Courgette'),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Country WiseDistribution\nof Data',
                  style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Courgette',
                  ),
                  textAlign: TextAlign.center,
                ),
                !changeView ? Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.all(15.0),
                  width: MediaQuery.of(context).size.width,
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.all(15.0),
                      hintText: 'Search Country',
                      hintStyle: TextStyle(
                        fontFamily: 'Lora',
                        color: Colors.grey[350]
                      ),
                      
                      icon: Icon(Icons.search,size: 25,),
                      border: InputBorder.none
                    ),
                    style: TextStyle(
                      fontFamily: 'Lora',
                      fontSize: 16.0
                    ),
                    onChanged: (string) async {
                      if (string.isEmpty) {
                        setState(() {
                          data1 = widget.countryData;
                        });
                      }
                      setState(() {
                        data1 = widget.countryData
                            .where((u) => (u.countryName
                                .toLowerCase()
                                .startsWith(string.toLowerCase())))
                            .toList();
                      });
                    },
                  ),
                ):SizedBox(height: 0.0),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                    // height: MediaQuery.of(context).size.height / 1.35,
                    // width: MediaQuery.of(context).size.width/1.1,
                    child: !changeView
                        ? ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: data1.length,
                            itemBuilder: (BuildContext context, index) {
                              return (index == 0 || index == (data1.length - 1))
                                  ? Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Colors.black87,
                                      ),
                                      // height: 200.0,
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.fromLTRB(
                                          10.0, 0.0, 10.0, 10.0),
                                      padding: EdgeInsets.all(10.0),
                                      child: RubberBand(
                                        child: Column(
                                          children: <Widget>[
                                            Wrap(
                                              alignment: WrapAlignment.center,
                                              // mainAxisAlignment:MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image.network(
                                                  '${data1[index].flag}',
                                                  height: 50.0,
                                                  width: 75.0,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 10.0),
                                                  padding: EdgeInsets.all(5.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        'Country Name:    ',
                                                        style: TextStyle(
                                                          fontFamily: 'Lora',
                                                          fontSize: 15.0,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${data1[index].countryName}',
                                                        style: TextStyle(
                                                          fontFamily: 'Lora',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 17.0,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      'Total Cases:',
                                                      style: TextStyle(
                                                          fontFamily: 'Lora',
                                                          fontSize: 14.0,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      '${data1[index].cases}',
                                                      style: TextStyle(
                                                        fontFamily: 'Lora',
                                                        fontSize: 19.0,
                                                        color: Colors.yellow,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      'Total Deaths:',
                                                      style: TextStyle(
                                                          fontFamily: 'Lora',
                                                          fontSize: 14.0,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      '${data1[index].deaths}',
                                                      style: TextStyle(
                                                        fontFamily: 'Lora',
                                                        fontSize: 19.0,
                                                        color: Colors.red,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      'Total Recovered:',
                                                      style: TextStyle(
                                                          fontFamily: 'Lora',
                                                          fontSize: 14.0,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      '${data1[index].recovered}',
                                                      style: TextStyle(
                                                        fontFamily: 'Lora',
                                                        fontSize: 19.0,
                                                        color: Colors.green,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      'Todays Cases:',
                                                      style: TextStyle(
                                                          fontFamily: 'Lora',
                                                          fontSize: 14.0,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      '${data1[index].todayCases}',
                                                      style: TextStyle(
                                                        fontFamily: 'Lora',
                                                        fontSize: 19.0,
                                                        color: Colors.yellow,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      'Todays Deaths:',
                                                      style: TextStyle(
                                                          fontFamily: 'Lora',
                                                          fontSize: 14.0,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      '${data1[index].todayDeaths}',
                                                      style: TextStyle(
                                                        fontFamily: 'Lora',
                                                        fontSize: 19.0,
                                                        color: Colors.red,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      'Active Cases:',
                                                      style: TextStyle(
                                                          fontFamily: 'Lora',
                                                          fontSize: 14.0,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      '${data1[index].active}',
                                                      style: TextStyle(
                                                        fontFamily: 'Lora',
                                                        fontSize: 19.0,
                                                        color: Colors.yellow,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      'Critical Cases:',
                                                      style: TextStyle(
                                                          fontFamily: 'Lora',
                                                          fontSize: 14.0,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      '${data1[index].critical}',
                                                      style: TextStyle(
                                                        fontFamily: 'Lora',
                                                        fontSize: 19.0,
                                                        color: Colors.red,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      'Tests Done:',
                                                      style: TextStyle(
                                                          fontFamily: 'Lora',
                                                          fontSize: 14.0,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      '${data1[index].tests}',
                                                      style: TextStyle(
                                                        fontFamily: 'Lora',
                                                        fontSize: 19.0,
                                                        color: Colors.white,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Colors.black87,
                                      ),
                                      // height: 200.0,
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.fromLTRB(
                                          10.0, 0.0, 10.0, 10.0),
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Image.network(
                                                '${data1[index].flag}',
                                                height: 50.0,
                                                width: 75.0,
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 10.0),
                                                padding: EdgeInsets.all(5.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      'Country Name:    ',
                                                      style: TextStyle(
                                                        fontFamily: 'Lora',
                                                        fontSize: 15.0,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      '${data1[index].countryName}',
                                                      style: TextStyle(
                                                        fontFamily: 'Lora',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 17.0,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'Total Cases:',
                                                    style: TextStyle(
                                                        fontFamily: 'Lora',
                                                        fontSize: 14.0,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    '${data1[index].cases}',
                                                    style: TextStyle(
                                                      fontFamily: 'Lora',
                                                      fontSize: 19.0,
                                                      color: Colors.yellow,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'Total Deaths:',
                                                    style: TextStyle(
                                                        fontFamily: 'Lora',
                                                        fontSize: 14.0,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    '${data1[index].deaths}',
                                                    style: TextStyle(
                                                      fontFamily: 'Lora',
                                                      fontSize: 19.0,
                                                      color: Colors.red,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'Total Recovered:',
                                                    style: TextStyle(
                                                        fontFamily: 'Lora',
                                                        fontSize: 14.0,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    '${data1[index].recovered}',
                                                    style: TextStyle(
                                                      fontFamily: 'Lora',
                                                      fontSize: 19.0,
                                                      color: Colors.green,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'Todays Cases:',
                                                    style: TextStyle(
                                                        fontFamily: 'Lora',
                                                        fontSize: 14.0,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    '${data1[index].todayCases}',
                                                    style: TextStyle(
                                                      fontFamily: 'Lora',
                                                      fontSize: 19.0,
                                                      color: Colors.yellow,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'Todays Deaths:',
                                                    style: TextStyle(
                                                        fontFamily: 'Lora',
                                                        fontSize: 14.0,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    '${data1[index].todayDeaths}',
                                                    style: TextStyle(
                                                      fontFamily: 'Lora',
                                                      fontSize: 19.0,
                                                      color: Colors.red,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'Active Cases:',
                                                    style: TextStyle(
                                                        fontFamily: 'Lora',
                                                        fontSize: 14.0,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    '${data1[index].active}',
                                                    style: TextStyle(
                                                      fontFamily: 'Lora',
                                                      fontSize: 19.0,
                                                      color: Colors.yellow,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'Critical Cases:',
                                                    style: TextStyle(
                                                        fontFamily: 'Lora',
                                                        fontSize: 14.0,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    '${data1[index].critical}',
                                                    style: TextStyle(
                                                      fontFamily: 'Lora',
                                                      fontSize: 19.0,
                                                      color: Colors.red,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'Tests Done:',
                                                    style: TextStyle(
                                                        fontFamily: 'Lora',
                                                        fontSize: 14.0,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    '${data1[index].tests}',
                                                    style: TextStyle(
                                                      fontFamily: 'Lora',
                                                      fontSize: 19.0,
                                                      color: Colors.white,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                            },
                          )
                        : GridView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.all(30.0),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              childAspectRatio: 1.0,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                            ),
                            itemCount: alpha.length,
                            itemBuilder: (context, i) => SizedBox(
                              width: 100.0,
                              height: 100.0,
                              child: RaisedButton(
                                shape: CircleBorder(
                                    side: BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                )
                                    // borderRadius: BorderRadius.circular(7.0),
                                    ),
                                color: Colors.white,
                                child: Container(
                                  // padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    '${alpha[i]}',
                                    style: TextStyle(
                                        fontFamily: 'Lora',
                                        fontSize: 27.0,
                                        color: Colors.black),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AlphaWise(
                                                letter: alpha[i],
                                                alphaData: widget.countryData,
                                              )));
                                },
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
