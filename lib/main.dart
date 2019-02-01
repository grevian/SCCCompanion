import 'package:flutter/material.dart';
import 'package:flutter_scc_app/ride_leader.dart';
import 'package:flutter_scc_app/ride_leader_checklist.dart';
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.indigo,
      ),
      home: new RiderTypeSelection(),
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
