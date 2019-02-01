import 'package:flutter/material.dart';
import 'package:flutter_scc_app/info_page.dart';
import 'package:flutter_scc_app/rider_type_selection.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Row(children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Image.asset("assets/icon/icon.png"),
              ),
              Text("Club Companion"),
            ]),
            bottom: TabBar(tabs: [
              Tab(icon: Icon(Icons.directions_bike),text: "Let's Ride!"),
              Tab(icon: Icon(Icons.book), text: "Information"),
            ]),
          ),
          body: TabBarView(
            children: [
              RiderTypeSelection(),
              InfoPage(),
            ],
          ),
        ));
  }
}