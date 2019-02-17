import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_scc_app/leader/create_ride.dart';
import 'package:flutter_scc_app/leader/ride_leader.dart';


class RideList extends StatefulWidget {
  final FirebaseUser user;
  RideList({Key key, @required this.user}) : super(key: key);

  @override
  _RideList createState() => new _RideList(this.user);
}

class _RideList extends State<RideList> {
  final FirebaseUser user;

  _RideList(this.user);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Pick a Ride to Lead"),
      ),
      persistentFooterButtons: <Widget>[
        FlatButton(child: Text("Create a new Ride"), onPressed: (){
          Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CreateRide(user: this.user),
              ));
        })
      ],
      body: Center(
        child: Column(
          children: <Widget>[
            new Expanded(child: buildRideList(context)),
          ],
        ),
      ),
    );
  }

  Widget buildRideList(BuildContext context) {
    Query q = Firestore.instance.collection('ride').orderBy('date', descending: true);
    return StreamBuilder<QuerySnapshot>(
      stream: q.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return new Text("Failed to load ride data: ${snapshot.error.toString()}");
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return Center(child: new CircularProgressIndicator());
          default:
            return new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                return new ListTile(
                  title: new Text("${document["title"]}"),
                  subtitle: new Text("${document["date"]}"),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RideLeaderSection(user: user, ride: document.reference),
                        ));
                  }
                );
              }).toList(),
            );
        }
      },
    );
  }
}
