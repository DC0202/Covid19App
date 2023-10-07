import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Symptoms extends StatefulWidget {
  @override
  _SymptomsState createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  List<String> testData = [];
  DatabaseReference _databaseReference=FirebaseDatabase.instance.reference();

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      this.getData();
    });
  }

  getData() async{
    _databaseReference.child('question5').onValue.listen((event) {
      // List linksall = event.snapshot.value;
      for (var i1 = 0; i1 < 5; i1++) {
        setState(() {
          testData.add(event.snapshot.value[i1]);
        });
      }
    });
  }
  //   'The most common symptoms of COVID-19 are fever, dry cough, and tiredness. Other symptoms that are less common and may affect some patients include aches and pains, nasal congestion, headache, conjunctivitis, sore throat, diarrhea, loss of taste or smell or a rash on skin or discoloration of fingers or toes.',
  //   'These symptoms are usually mild and begin gradually. Some people become infected but only have very mild symptoms.',
  //   'Most people (about 80%) recover from the disease without needing hospital treatment. Around 1 out of every 5 people who gets COVID-19 becomes seriously ill and develops difficulty breathing. Older people, and those with underlying medical problems like high blood pressure, heart and lung problems, diabetes, or cancer, are at higher risk of developing serious illness.',
  //   'Less common symptoms: aches and pains, sore throat, diarrhoea, conjunctivitis, headache, loss of taste or smell, a rash on skin, or discolouration of fingers or toes.',
  //   'Serious symptoms: difficulty breathing or shortness of breath, chest pain or pressure, loss of speech or movement.',
  //   'Seek immediate medical attention if you have serious symptoms. Always call before visiting your doctor or health facility. People with mild symptoms who are otherwise healthy should manage their symptoms at home. On average it takes 5–6 days from when someone is infected with the virus for symptoms to show, however it can take up to 14 days.',
  // ];
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(25.0),
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Center(
                  child: Text(
                    'Symptoms & Preventions',
                    style: TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Courgette',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(3.0),
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: Center(
                        child: Text(
                          'What are the Symptoms of COVID-19?',
                          style: TextStyle(
                            fontFamily: 'Lora',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      height: 350.0,
                      child: testData.isEmpty ? Center(child: CircularProgressIndicator(),) : ListView.builder(
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
                  ],
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
                  image: AssetImage('images/IMG5.PNG'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
