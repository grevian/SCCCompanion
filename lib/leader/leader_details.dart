import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scc_app/auth.dart';
import 'package:flutter_scc_app/leader/ride_leader.dart';

class RideLeaderDetails extends StatefulWidget {
  RideLeaderDetails({Key key}) : super(key: key);

  @override
  _RideLeaderDetails createState() => new _RideLeaderDetails();
}


class _RideLeaderDetails extends State<RideLeaderDetails> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final RideLeaderData data = RideLeaderData.of(context);

    return new StreamBuilder<DocumentSnapshot>(
        stream: data.ride.get().asStream(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          return new Scaffold(
            body: new Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: new Column(
                    children: [
                      buildRideWidget(snapshot),
                      Text("Welcome ${data.user.displayName}"),
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
