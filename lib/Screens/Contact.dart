import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
                  'Contact Information',
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
            Text(
              'Log on to public grievance platform to lodge grievances for quick redressal.',
              style: TextStyle(
                fontSize: 16.0,
                // fontWeight: FontWeight.bold,
                fontFamily: 'Lora',
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Text(
                  'URL: https://pgportal.gov.in/',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () async {
                  if (await canLaunch("https://pgportal.gov.in/")) {
                    await launch("https://pgportal.gov.in/");
                  } else {
                    throw 'Could not launch https://pgportal.gov.in/';
                  }
                },
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              'Queries Related to Contests/ Quizzes or for Engagement with MyGov',
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: 'Lora',
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      'e-Mail: connect@mygov.nic.in',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Lora',
                        decoration: TextDecoration.underline
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    onTap: () async {
                      const uri =
                          'mailto:connect@mygov.nic.in?subject=CoronaVirus&body=Hello%20World';
                      if (await canLaunch(uri)) {
                        await launch(uri);
                      } else {
                        throw 'Could not launch $uri';
                      }
                    },
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  GestureDetector(
                    child: Text(
                      'Phone: 011-24301812',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Lora',
                        decoration: TextDecoration.underline,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    onTap: () async {
                      const tel = 'tel:011-24301812';
                      if (await canLaunch(tel)) {
                        await launch(tel);
                      } else {
                        throw 'Could not launch $tel';
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              'Address: ',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lora',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Office of CEO, MyGov,\n3rd Floor ,Room no-3015,\nMinistry of Electronics and Information Technology(Government of India),\nElectronics Niketan, 6, CGO Complex,\nLodhi Road,\nNew Delhi - 110003,India.',
                style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'Lora',
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
