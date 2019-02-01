import 'package:flutter/material.dart';
import 'package:flutter_scc_app/ride_description.dart';
import 'package:flutter_scc_app/ride_leader_checklist.dart';
import 'package:flutter_scc_app/rider_counter.dart';

class RideLeaderSection extends StatefulWidget {
  RideLeaderSection({Key key}) : super(key: key);

  @override
  _RideLeaderSection createState() => new _RideLeaderSection();
}


class _RideLeaderSection extends State<RideLeaderSection> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(tabs: [
                Tab(icon: Icon(Icons.check)),
                Tab(icon: Icon(Icons.person)),
                Tab(icon: Icon(Icons.map)),
              ]),
            ),
              body: TabBarView(
                children: [
                  RideLeaderChecklist(),
                  RiderCounter(),
                  RideDescription(),
                ],
              ),
        ));
  }
}