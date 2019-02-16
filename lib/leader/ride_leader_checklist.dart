import 'package:flutter/material.dart';

class RideLeaderChecklist extends StatefulWidget {
  RideLeaderChecklist({Key key}) : super(key: key);

  @override
  _RideLeaderChecklist createState() => new _RideLeaderChecklist();
}


class _RideLeaderChecklist extends State<RideLeaderChecklist> {
  Map<String, bool> _checkList;

  _RideLeaderChecklist() {
    _checkList = new Map<String,bool>();
    _checkList["Introduce yourself"] = false;
    _checkList["Confirm Memberships"] = false;
    _checkList["Outline route and expectations"] = false;
  }

  void _toggleChecklist(String k) {
    setState(() {
      _checkList[k] = !_checkList[k];
    });
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> checkListBody = new List<Widget>();
    checkListBody.add(new Text('Ride Leader Checklist'));

    _checkList.forEach((k, v){
      checkListBody.add(
        new CheckboxListTile(value: v, onChanged: (bool value) {
          _toggleChecklist(k);
        }, title: new Text(k)),
      );
    });

    return new Scaffold(
      body: new Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: new Column(
            children: checkListBody,
          ),
        )
      ),
    );
  }
}
