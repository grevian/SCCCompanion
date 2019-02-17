import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scc_app/leader/leader_details.dart';
import 'package:flutter_scc_app/ride_description.dart';
import 'package:flutter_scc_app/leader/ride_leader_checklist.dart';
import 'package:flutter_scc_app/rider_counter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RideLeaderSection extends StatefulWidget {
  final FirebaseUser _user;
  final DocumentReference _ride;

  RideLeaderSection({Key key, @required FirebaseUser user, @required DocumentReference ride}) : _user = user, _ride = ride, super(key: key);

  @override
  _RideLeaderSection createState() => new _RideLeaderSection(_user, _ride);
}


class _RideLeaderSection extends State<RideLeaderSection> {
  final FirebaseUser _user;
  final DocumentReference _ride;

  _RideLeaderSection(FirebaseUser user, DocumentReference ride) : _user = user, _ride = ride;

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
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
                  RideLeaderDetails(user: _user, ride: _ride),
                ],
              ),
        ));
  }
}