import 'package:flutter/material.dart';


class RiderCounter extends StatefulWidget {
  RiderCounter({Key key}) : super(key: key);

  @override
  _RiderCounter createState() => new _RiderCounter();
}


class _RiderCounter extends State<RiderCounter> {
  int riderCount = 0;

  incrementRiderCount() {
    setState(() {
      riderCount += 1;
    });
  }

  void decrementRiderCount() {
    if (riderCount > 0) {
      setState(() {
        riderCount -= 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: new Column(
            children: [
              Text("How many riders are present?", style: TextStyle(fontSize: 20.0)),
              Text(riderCount.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(icon: Icon(Icons.remove),
                      onPressed: ()
                      {
                        decrementRiderCount();
                      }),
                  IconButton(icon: Icon(Icons.add),
                      onPressed: ()
                      {
                        incrementRiderCount();
                      }),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}