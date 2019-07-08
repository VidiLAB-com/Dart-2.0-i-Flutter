import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;

import 'package:url_launcher/url_launcher.dart';



class Ocjena extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('VIDI Computer Publishing'),
          backgroundColor: Colors.green[700],
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[

            Container(
              margin: const EdgeInsets.all(20.0),
              child: Text('''
Ocijenite ocjenom od 1 do 5 
kako vam se dopao sadržaj zadnjeg broja časopisa VIDI
              ''', style: TextStyle(fontSize: 12),),
            ),

            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: ButtonTheme(
                height: 40.0,
                child: RaisedButton(
                  child: Text('Ocjena 1', style: TextStyle(fontSize: 12),),
                  color: Colors.red[900],
                  textColor: Colors.white,
                  splashColor: Colors.red[300],
                  onPressed: () {
                    _saveResult(context,'1');
                  },
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: ButtonTheme(
                height: 40.0,
                child: RaisedButton(
                  child: Text('Ocjena 2', style: TextStyle(fontSize: 12),),
                  color: Colors.green[900],
                  textColor: Colors.white,
                  splashColor: Colors.green[300],
                  onPressed: () {
                    _saveResult(context,'2');
                  },
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: ButtonTheme(
                height: 40.0,
                child: RaisedButton(
                  child: Text('Ocjena 3', style: TextStyle(fontSize: 12),),
                  color: Colors.green[800],
                  textColor: Colors.white,
                  splashColor: Colors.green[300],
                  onPressed: () {
                    _saveResult(context,'3');
                  },
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: ButtonTheme(
                height: 40.0,
                child: RaisedButton(
                  child: Text('Ocjena 4', style: TextStyle(fontSize: 12),),
                  color: Colors.green[700],
                  textColor: Colors.white,
                  splashColor: Colors.green[300],
                  onPressed: () {
                    _saveResult(context,'4');
                  },
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: ButtonTheme(
                height: 40.0,
                child: RaisedButton(
                  child: Text('Ocjena 5', style: TextStyle(fontSize: 12),),
                  color: Colors.green[600],
                  textColor: Colors.white,
                  splashColor: Colors.green[300],
                  onPressed: () {
                    _saveResult(context,'5');
                  },
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }

  _saveResult(BuildContext context, String result) async {
    print('Izabrana je ocjena: ' + result);
    Navigator.pop(context, result);
  }


}