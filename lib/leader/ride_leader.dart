import 'package:flutter/material.dart';
import 'package:flutter_scc_app/leader/leader_details.dart';
import 'package:flutter_scc_app/ride_description.dart';
import 'package:flutter_scc_app/leader/ride_leader_checklist.dart';
import 'package:flutter_scc_app/rider_counter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RideLeaderSection extends StatefulWidget {
  final FirebaseUser _user;

  RideLeaderSection({Key key, @required FirebaseUser user}) : _user = user, super(key: key);

  @override
  _RideLeaderSection createState() => new _RideLeaderSection(_user);
}


class _RideLeaderSection extends State<RideLeaderSection> {
  final FirebaseUser _user;

  _RideLeaderSection(FirebaseUser user) : _user = user;

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
                  RideLeaderDetails(user: _user),
                ],
              ),
        ));
  }
}