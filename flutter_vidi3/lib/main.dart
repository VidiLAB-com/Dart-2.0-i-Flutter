import 'package:flutter/material.dart';
import "package:intl/intl.dart";


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new ChatItemScreen(),
    );
  }
}

class ChatItemScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("VIDI Chat Application"),
        backgroundColor: Colors.blueAccent,
      ),
      body: new OneChatItem(),
    );
  }
}

class OneChatItem extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        height: 110.0,
        child: Column(
          children: <Widget>[
            startMessage,
            leftMessage,
            rightMessage,
          ],
        ),
      ),
    );
  }

  final startMessage = new Expanded(
    child: new Container(
      padding: new EdgeInsets.only(left: 40.0),
      child: new Row(
        children: <Widget>[
          new Text("Ova diskusija je kriptirana i nije vidljiva drugima.", style: new TextStyle(color: Colors.red , fontWeight: FontWeight.w600, fontSize: 8.0),),
        ],
      )

    ),
  );


  final leftMessage = new Expanded(
    child: new Container(
      padding: new EdgeInsets.all(5.0),

      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new CircleAvatar(
            backgroundColor: Colors.blueAccent,
            radius: 15.0,
            child: Text('NC'),
          ),
          new Padding (
            padding: const EdgeInsets.only(left: 10.0, top: 5.0),
            child: Text("Ima li nešto zanimljivo u novom VIDI-u? ",
              style: new TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                fontSize: 12.0,
              ),),
          ),
          new Padding (
            padding: const EdgeInsets.only(left: 2.0, top: 5.0),
            child: new Text(DateFormat('kk:mm').format(DateTime.now()),
              style: new TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 12.0,
              ),),
          ),

        ],
      ),

    ),
  );


  final rightMessage = new Expanded(
    child: new Container(
      padding: new EdgeInsets.all(5.0),

      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Padding (
            padding: const EdgeInsets.only(left: 40.0, top: 8.0),
            child: new Text("Kao i obično - obavezno kupi.",
              style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 12.0,
              ),),
          ),
          new Padding (
            padding: const EdgeInsets.only(left: 2.0, top: 8.0, right: 10.0),
            child: new Text(DateFormat('kk:mm').format(DateTime.now()),
              style: new TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 12.0,
              ),),
          ),

          new CircleAvatar(
            backgroundColor: Colors.black,
            radius: 15.0,
            child: Text('Ja'),
          ),
        ],
      ),

    ),
  );


}

