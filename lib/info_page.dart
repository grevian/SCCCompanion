import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info/package_info.dart';

class InfoPage extends StatefulWidget {
  InfoPage({Key key}) : super(key: key);

  @override
  _InfoPage createState() => new _InfoPage();
}

class _InfoPage extends State<InfoPage> {

  String appName = "";
  String version = "";
  String buildNumber = "";

  _InfoPage() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() {
        appName = packageInfo.appName;
        version = packageInfo.version;
        buildNumber = packageInfo.buildNumber;
      });
    });
  }

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
                RaisedButton(child: Text("View Privacy Policy"), onPressed: () { _launchURL("https://saultcyclingclub.ca/cycling-club-companion-app-privacy-policy/"); }),
                RaisedButton(child: Text("Send App Feedback"), onPressed: () { _launchURL("mailto:info@saultcyclingclub.ca?subject=Feedback on the Companion App"); }),
                Center(
                  child: Text("Application Version: $version, Dart Version: ${Platform.version}, Package Version: ${this.version}"),
                )
              ],
            ),
          )
      ),
    );
  }
}