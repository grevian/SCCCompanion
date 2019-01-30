import 'package:flutter/material.dart';

class RiderTypeSelection extends StatelessWidget {
  final String JoinOurClubURL = "https://saultcyclingclub.ca/about-sault-cycling/join-our-club/";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Who are you?"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new RaisedButton.icon(icon: new Icon(Icons.person), onPressed: (){
              Navigator.of(context).pushNamed("/rideLeader");
            }, label: const Text("I am a Ride Leader")),
            new RaisedButton.icon(icon: new Icon(Icons.people), onPressed: () {
              Navigator.of(context).pushNamed("/rider");
            }, label: const Text("I am a Rider")),
            new RaisedButton.icon(icon: new Icon(Icons.new_releases), onPressed: async () {
              if (await canLaunch(JoinOurClubURL)) {
                await launch(JoinOurClubURL);
              } else {
                throw 'Could not launch $JoinOurClubURL';
              }
            }, label: const Text("I am not a club member")),

          ],
        ),
      ),
    );
  }
}

class RideTypeSelection extends StatelessWidget {
  final bool _rideLeader;

  RideTypeSelection({bool rideLeader}) : _rideLeader = rideLeader;

  @override
  Widget build(BuildContext context) {
    String route = "";
    if (_rideLeader) {
      route += "/rideLeader";
    } else {
      route += "/rider";
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("What kind of ride are you on?"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new RaisedButton.icon(icon: new Icon(Icons.streetview), onPressed: (){
              Navigator.of(context).pushNamed("$route/road");
            }, label: const Text("Road")),
            new RaisedButton.icon(icon: new Icon(Icons.terrain), onPressed: () {
              Navigator.of(context).pushNamed("$route/mountain");
            }, label: const Text("Mountain")),
            new RaisedButton.icon(icon: new Icon(Icons.map), onPressed: () {
              Navigator.of(context).pushNamed("$route/tour");
            }, label: const Text("Touring")),
          ],
        ),
      ),
    );
  }
}
