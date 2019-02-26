import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scc_app/leader/ride_leader.dart';


class RideDescription extends StatefulWidget {
  RideDescription({Key key}) : super(key: key);

  @override
  _RideDescription createState() => new _RideDescription();
}


class _RideDescription extends State<RideDescription> {
  final formController = TextEditingController();

  @override
  void dispose() {
    formController.dispose();
    super.dispose();
  }

  void _errorSaving() {

  }

  DocumentReference getRideLeaderCommentReference(DocumentReference ride, String rideLeaderID) {
    return Firestore.instance.collection('ride_comments').document("${ride.documentID}:$rideLeaderID");
  }

  void _saveDescription(BuildContext context, String description) {
    final RideLeaderData data = RideLeaderData.of(context);
    final DocumentReference rideLeaderComment = getRideLeaderCommentReference(data.ride, data.user.uid);

    data.ride.get().then((DocumentSnapshot ride) async {
      assert(ride.exists, "Attempting to add description to non-existent ride!");
      final WriteBatch batch = Firestore.instance.batch();
      batch.setData(rideLeaderComment, {'ride': ride.documentID, 'rider': data.user.uid, 'date': DateTime.now(), 'value': formController.text});
      await batch.commit();
    }, onError: _errorSaving);
  }

  @override
  Widget build(BuildContext context) {
    final RideLeaderData data = RideLeaderData.of(context);
    final DocumentReference rideLeaderComment = getRideLeaderCommentReference(data.ride, data.user.uid);
    Stream<DocumentSnapshot> commentLoadedStream = rideLeaderComment.get().asStream();

    return new StreamBuilder<DocumentSnapshot>(stream: commentLoadedStream, builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> comment) {
      // Basically, are we okay to populate the form text?
      if (comment.connectionState != ConnectionState.waiting && !comment.hasError && comment != null && comment.data.exists) {
        // This is kind of dangerous, if there's a lot of latency we'll end up blowing away anything the user types,
        // But if we use a loading icon instead, then users can't work offline at all
        formController.text = comment.data.data["value"];
      }

      return new Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: new Column(
            children: [
              Text("How did the ride go?", style: TextStyle(fontSize: 20.0)),
              TextField(controller: formController, maxLines: null),
              FlatButton(onPressed: () { _saveDescription(context, formController.text); }, child: Text("Save")),
            ],
          ),
        ),
      );

    });


  }
}