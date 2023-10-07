import 'package:covid19app/Models/Country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class AlphaWise extends StatefulWidget {
  final String letter;
  final List<Country> alphaData;

  const AlphaWise({Key key, this.letter, this.alphaData}) : super(key: key);
  @override
  _AlphaWiseState createState() => _AlphaWiseState();
}

class _AlphaWiseState extends State<AlphaWise> {
  List<int> val = [];

  @override
  void initState() {
    super.initState();
    val = [];
    for (var i = 0; i < widget.alphaData.length; i++) {
      String value = widget.alphaData[i].countryName;
      if (value.startsWith(widget.letter)) {
        val.add(i);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Country from "${widget.letter}"',
      //     style: TextStyle(fontFamily: 'Lora'),
      //   ),
      //   centerTitle: true,
      // ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Color(0xFFDDFBFB),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(left: 20.0, top: 30.0, child: BackButton()),
          Column(
            children: <Widget>[
              SizedBox(height: 40.0),
              Text(
                'Countries from "${widget.letter}"',
                style: TextStyle(fontFamily: 'Lora', fontSize: 20.0),
              ),
              Container(
                // color: Colors.white,
                margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                height: MediaQuery.of(context).size.height / 1.15,
                // width: MediaQuery.of(context).size.width/1.1,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: val.length,
                  itemBuilder: (BuildContext context, index) {
                    return (index==0 || index==(val.length-1)) ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.black87,
                      ),
                      // height: 200.0,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                      padding: EdgeInsets.all(10.0),
                      child: RubberBand(
                        child: Column(
                          children: <Widget>[
                            Wrap(
                              alignment: WrapAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Image.network(
                                  '${widget.alphaData[val[index]].flag}',
                                  height: 50.0,
                                  width: 75.0,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10.0),
                                  padding: EdgeInsets.all(5.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // Row(
                                      //   children: <Widget>[
                                      //     Text(
                                      //       'Country Name:    ',
                                      //       style: TextStyle(
                                      //         fontFamily: 'Lora',
                                      //         fontSize: 15.0,
                                      //         fontStyle: FontStyle.italic,
                                      //         color: Colors.white,
                                      //       ),
                                      //     ),
                                      //     Text(
                                      //       '${widget.alphaData[index].countryName}',
                                      //       style: TextStyle(
                                      //         fontFamily: 'Lora',
                                      //         fontWeight: FontWeight.bold,
                                      //         fontSize: 17.0,
                                      //         color: Colors.white,
                                      //       ),
                                      //     ),
                                      //   ],
                                      // )
                                      Text(
                                        'Country Name:    ',
                                        style: TextStyle(
                                          fontFamily: 'Lora',
                                          fontSize: 15.0,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '${widget.alphaData[val[index]].countryName}',
                                        style: TextStyle(
                                          fontFamily: 'Lora',
                                          fontWeight: FontWeight.bold,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Total Cases:',
                                      style: TextStyle(
                                          fontFamily: 'Lora',
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '${widget.alphaData[val[index]].cases}',
                                      style: TextStyle(
                                        fontFamily: 'Lora',
                                        fontSize: 19.0,
                                        color: Colors.yellow,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Total Deaths:',
                                      style: TextStyle(
                                          fontFamily: 'Lora',
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '${widget.alphaData[val[index]].deaths}',
                                      style: TextStyle(
                                        fontFamily: 'Lora',
                                        fontSize: 19.0,
                                        color: Colors.red,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Total Recovered:',
                                      style: TextStyle(
                                          fontFamily: 'Lora',
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '${widget.alphaData[val[index]].recovered}',
                                      style: TextStyle(
                                        fontFamily: 'Lora',
                                        fontSize: 19.0,
                                        color: Colors.green,
                                        fontStyle: FontStyle.italic,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Todays Cases:',
                                      style: TextStyle(
                                          fontFamily: 'Lora',
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '${widget.alphaData[val[index]].todayCases}',
                                      style: TextStyle(
                                        fontFamily: 'Lora',
                                        fontSize: 19.0,
                                        color: Colors.yellow,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Todays Deaths:',
                                      style: TextStyle(
                                          fontFamily: 'Lora',
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '${widget.alphaData[val[index]].todayDeaths}',
                                      style: TextStyle(
                                        fontFamily: 'Lora',
                                        fontSize: 19.0,
                                        color: Colors.red,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Active Cases:',
                                      style: TextStyle(
                                          fontFamily: 'Lora',
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '${widget.alphaData[val[index]].active}',
                                      style: TextStyle(
                                        fontFamily: 'Lora',
                                        fontSize: 19.0,
                                        color: Colors.yellow,
                                        fontStyle: FontStyle.italic,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Critical Cases:',
                                      style: TextStyle(
                                          fontFamily: 'Lora',
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '${widget.alphaData[val[index]].critical}',
                                      style: TextStyle(
                                        fontFamily: 'Lora',
                                        fontSize: 19.0,
                                        color: Colors.red,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Tests Done:',
                                      style: TextStyle(
                                          fontFamily: 'Lora',
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '${widget.alphaData[val[index]].tests}',
                                      style: TextStyle(
                                        fontFamily: 'Lora',
                                        fontSize: 19.0,
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ) : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.black87,
                      ),
                      // height: 200.0,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Wrap(
                            alignment: WrapAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Image.network(
                                '${widget.alphaData[val[index]].flag}',
                                height: 50.0,
                                width: 75.0,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10.0),
                                padding: EdgeInsets.all(5.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // Row(
                                    //   children: <Widget>[
                                    //     Text(
                                    //       'Country Name:    ',
                                    //       style: TextStyle(
                                    //         fontFamily: 'Lora',
                                    //         fontSize: 15.0,
                                    //         fontStyle: FontStyle.italic,
                                    //         color: Colors.white,
                                    //       ),
                                    //     ),
                                    //     Text(
                                    //       '${widget.alphaData[index].countryName}',
                                    //       style: TextStyle(
                                    //         fontFamily: 'Lora',
                                    //         fontWeight: FontWeight.bold,
                                    //         fontSize: 17.0,
                                    //         color: Colors.white,
                                    //       ),
                                    //     ),
                                    //   ],
                                    // )
                                    Text(
                                      'Country Name:    ',
                                      style: TextStyle(
                                        fontFamily: 'Lora',
                                        fontSize: 15.0,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      '${widget.alphaData[val[index]].countryName}',
                                      style: TextStyle(
                                        fontFamily: 'Lora',
                                        fontWeight: FontWeight.bold,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Total Cases:',
                                    style: TextStyle(
                                        fontFamily: 'Lora',
                                        fontSize: 14.0,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    '${widget.alphaData[val[index]].cases}',
                                    style: TextStyle(
                                      fontFamily: 'Lora',
                                      fontSize: 19.0,
                                      color: Colors.yellow,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Total Deaths:',
                                    style: TextStyle(
                                        fontFamily: 'Lora',
                                        fontSize: 14.0,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    '${widget.alphaData[val[index]].deaths}',
                                    style: TextStyle(
                                      fontFamily: 'Lora',
                                      fontSize: 19.0,
                                      color: Colors.red,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Total Recovered:',
                                    style: TextStyle(
                                        fontFamily: 'Lora',
                                        fontSize: 14.0,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    '${widget.alphaData[val[index]].recovered}',
                                    style: TextStyle(
                                      fontFamily: 'Lora',
                                      fontSize: 19.0,
                                      color: Colors.green,
                                      fontStyle: FontStyle.italic,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Todays Cases:',
                                    style: TextStyle(
                                        fontFamily: 'Lora',
                                        fontSize: 14.0,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    '${widget.alphaData[val[index]].todayCases}',
                                    style: TextStyle(
                                      fontFamily: 'Lora',
                                      fontSize: 19.0,
                                      color: Colors.yellow,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Todays Deaths:',
                                    style: TextStyle(
                                        fontFamily: 'Lora',
                                        fontSize: 14.0,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    '${widget.alphaData[val[index]].todayDeaths}',
                                    style: TextStyle(
                                      fontFamily: 'Lora',
                                      fontSize: 19.0,
                                      color: Colors.red,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Active Cases:',
                                    style: TextStyle(
                                        fontFamily: 'Lora',
                                        fontSize: 14.0,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    '${widget.alphaData[val[index]].active}',
                                    style: TextStyle(
                                      fontFamily: 'Lora',
                                      fontSize: 19.0,
                                      color: Colors.yellow,
                                      fontStyle: FontStyle.italic,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Critical Cases:',
                                    style: TextStyle(
                                        fontFamily: 'Lora',
                                        fontSize: 14.0,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    '${widget.alphaData[val[index]].critical}',
                                    style: TextStyle(
                                      fontFamily: 'Lora',
                                      fontSize: 19.0,
                                      color: Colors.red,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Tests Done:',
                                    style: TextStyle(
                                        fontFamily: 'Lora',
                                        fontSize: 14.0,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    '${widget.alphaData[val[index]].tests}',
                                    style: TextStyle(
                                      fontFamily: 'Lora',
                                      fontSize: 19.0,
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
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
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
