import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_scc_app/leader/ride_leader.dart';
import 'package:flutter_scc_app/auth.dart';

class RiderTypeSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new RaisedButton.icon(
                icon: new Icon(Icons.person),
                onPressed: () {
                  handleSignIn().then((FirebaseUser user) {
                    if (user == null) {

                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RideLeaderSection(user: user),
                          ));
                    }
                  }, onError: (e) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: new Text("Sign-in Failed!"),
                            content: new Text(e.toString()),
                            actions: <Widget>[
                              new FlatButton(
                                child: new Text("Close"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              new FlatButton(
                                child: new Text("Sign in Again"),
                                onPressed: () {
                                  handleSignOut();
                                  handleSignIn().then((FirebaseUser user) {
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RideLeaderSection(user: user),
                                        ));
                                  });
                                },
                              )
                            ],
                          );
                        });
                  });
                },
                label: const Text("I am a Ride Leader")),
            new RaisedButton.icon(
                icon: new Icon(Icons.people),
                onPressed: () {
                  Navigator.of(context).pushNamed("/rider");
                },
                label: const Text("I am a Rider")),
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
            new RaisedButton.icon(
                icon: new Icon(Icons.streetview),
                onPressed: () {
                  Navigator.of(context).pushNamed("$route/road");
                },
                label: const Text("Road")),
            new RaisedButton.icon(
                icon: new Icon(Icons.terrain),
                onPressed: () {
                  Navigator.of(context).pushNamed("$route/mountain");
                },
                label: const Text("Mountain")),
            new RaisedButton.icon(
                icon: new Icon(Icons.map),
                onPressed: () {
                  Navigator.of(context).pushNamed("$route/tour");
                },
                label: const Text("Touring")),
          ],
        ),
      ),
    );
  }
}
