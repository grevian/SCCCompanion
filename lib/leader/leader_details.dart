import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_scc_app/auth.dart';

class RideLeaderDetails extends StatefulWidget {
  final FirebaseUser user;
  final DocumentReference ride;

  RideLeaderDetails({Key key, @required this.user, @required this.ride}) : super(key: key);

  @override
  _RideLeaderDetails createState() => new _RideLeaderDetails();
}


class _RideLeaderDetails extends State<RideLeaderDetails> with AutomaticKeepAliveClientMixin {
  Stream<DocumentSnapshot> rideStream;

  @override
  initState() {
    super.initState();
    this.rideStream = widget.ride.get().asStream();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<DocumentSnapshot>(
        stream: rideStream,
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          return new Scaffold(
            body: new Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: new Column(
                    children: [
                      buildRideWidget(snapshot),
                      Text("Welcome ${widget.user.displayName}"),
                      RaisedButton(child: Text("Sign Out"), onPressed: () {
                        handleSignOut();
                        Navigator.of(context).pop();
                      }),
                    ],
                  ),
                )
            ),
          );
        });
  }

  Widget buildRideWidget(AsyncSnapshot<DocumentSnapshot> ride) {
    if (ride == null || ride.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    }
    if (ride.hasError) {
      return Text("Error loading ride: ${ride.error.toString()}");
    }

    return Text("Ride: ${ride.data['title']}");
  }
}
