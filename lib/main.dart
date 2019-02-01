import 'package:flutter/material.dart';
import 'package:flutter_scc_app/main_screen.dart';
import 'package:flutter_scc_app/ride_leader.dart';
import 'package:flutter_scc_app/rider_checklist.dart';
import 'package:flutter_scc_app/rider_type_selection.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sault Cycling Club Companion App',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: new MainScreen(),
      routes: <String, WidgetBuilder> {
        '/rideLeader': (BuildContext context) => new RideTypeSelection(rideLeader: true),
        '/rider': (BuildContext context) => new RideTypeSelection(rideLeader: false),
        '/rideLeader/road': (BuildContext context) => new RideLeaderSection(),
        '/rideLeader/mountain': (BuildContext context) => new RideLeaderSection(),
        '/rideLeader/tour': (BuildContext context) => new RideLeaderSection(),
        '/rider/road': (BuildContext context) => new RiderChecklist(),
        '/rider/mountain': (BuildContext context) => new RiderChecklist(),
        '/rider/tour': (BuildContext context) => new RiderChecklist(),
      },
    );
  }
}
