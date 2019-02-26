import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scc_app/leader/leader_details.dart';
import 'package:flutter_scc_app/ride_description.dart';
import 'package:flutter_scc_app/leader/ride_leader_checklist.dart';
import 'package:flutter_scc_app/rider_counter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RideLeaderData extends InheritedWidget {
  final FirebaseUser user;
  final DocumentReference ride;

  RideLeaderData({
    Key key,
    @required this.user,
    @required this.ride,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(RideLeaderData oldWidget) =>
      oldWidget.ride != this.ride || oldWidget.user != this.user;

  static RideLeaderData of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(RideLeaderData);
}

class RideLeaderSection extends StatelessWidget {
  final FirebaseUser user;
  final DocumentReference ride;

  RideLeaderSection({@required this.user, @required this.ride});

  @override
  Widget build(BuildContext context) {
    return new RideLeaderData(
        user: this.user,
        ride: this.ride,
        child: new DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(tabs: [
                  Tab(icon: Icon(Icons.check)),
                  Tab(icon: Icon(Icons.person)),
                  Tab(icon: Icon(Icons.map)),
                  Tab(icon: Icon(Icons.details)),
                ]),
              ),
              body: TabBarView(
                children: [
                  RideLeaderChecklist(),
                  RiderCounter(),
                  RideDescription(),
                  RideLeaderDetails(),
                ],
              ),
            )));
  }
}
