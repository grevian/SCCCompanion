import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BecomeARideLeader extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: new Column(
              children: [
                Text(
                    "Sorry but that account isn't a registered ride leader, If you're interested in becoming a club ride leader let us know!"),
                RaisedButton(
                    child: Text("Become a Ride Leader"), onPressed: () {
                  _launchURL(
                      "mailto:info@saultcyclingclub.ca?subject=I want to become a ride leader!");
                }),
                RaisedButton(child: Text("Sign Out"), onPressed: () {
                  _auth.signOut().then(
                      (v) { Navigator.of(context).pop(); }
                  );
                }),
              ],
            ),
          )
      ),
    );
  }
}
