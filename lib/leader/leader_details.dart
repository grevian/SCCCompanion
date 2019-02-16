import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_scc_app/auth.dart';

class RideLeaderDetails extends StatefulWidget {
  final FirebaseUser _user;

  RideLeaderDetails({Key key, @required FirebaseUser user}) : _user = user, super(key: key);

  @override
  _RideLeaderDetails createState() => new _RideLeaderDetails(_user);
}


class _RideLeaderDetails extends State<RideLeaderDetails> {
  final FirebaseUser _user;

  _RideLeaderDetails(FirebaseUser user) : _user = user;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: new Column(
              children: [
                Text("Welcome ${_user.displayName}"),
                RaisedButton(child: Text("Sign Out"), onPressed: () {
                  handleSignOut();
                  Navigator.of(context).pop();
                }),
              ],
            ),
          )
      ),
    );
  }
}
