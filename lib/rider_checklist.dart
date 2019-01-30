import 'package:flutter/material.dart';

class RiderChecklist extends StatefulWidget {
  RiderChecklist({Key key}) : super(key: key);

  @override
  _RiderChecklist createState() => new _RiderChecklist();
}

class _RiderChecklist extends State<RiderChecklist> {
  Map<String, bool> _checkList;

  _RiderChecklist() {
    _checkList = new Map<String,bool>();
    _checkList["Item 1"] = false;
    _checkList["Item 2"] = false;
    _checkList["Item 3"] = false;
  }

  void _toggleChecklist(String k) {
    setState(() {
      _checkList[k] = !_checkList[k];
    });
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> checkListBody = new List<Widget>();
    checkListBody.add(new Text('Rider Checklist'));

    _checkList.forEach((k, v){
      checkListBody.add(
        new CheckboxListTile(value: v, onChanged: (bool value) {
          _toggleChecklist(k);
        }, title: new Text(k)),
      );
    });

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Rider Checklist"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: checkListBody,
        ),
      ),
    );
  }
}
