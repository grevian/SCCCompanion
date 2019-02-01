import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatelessWidget {

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
            child: new ListView(
              children: [
                RaisedButton(child: Text("Check out the Website"), onPressed: () { _launchURL("https://saultcyclingclub.ca"); }),
                RaisedButton(child: Text("Join the Club"), onPressed: () { _launchURL("https://saultcyclingclub.ca/about-sault-cycling/join-our-club/"); }),
                RaisedButton(child: Text("Local Maps on Trailforks"), onPressed: () { _launchURL("https://www.trailforks.com/region/sault-ste-marie/"); }),
                RaisedButton(child: Text("Local Maps on MTBProject"), onPressed: () { _launchURL("https://www.mtbproject.com/directory/8006724/sault-ste-marie"); }),
                RaisedButton(child: Text("Send App Feedback"), onPressed: () { _launchURL("mailto:info@saultcyclingclub.ca?subject=Feedback on the Companion App"); }),
              ],
            ),
          )
      ),
    );
  }
}