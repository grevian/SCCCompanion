import 'package:flutter/material.dart';


class RideDescription extends StatefulWidget {
  RideDescription({Key key}) : super(key: key);

  @override
  _RideDescription createState() => new _RideDescription();
}


class _RideDescription extends State<RideDescription> {
  int riderCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: new Column(
              children: [
                Text("How did the ride go?", style: TextStyle(fontSize: 20.0)),
                TextField(),
              ],
            ),
          ),
        )
    );
  }
}