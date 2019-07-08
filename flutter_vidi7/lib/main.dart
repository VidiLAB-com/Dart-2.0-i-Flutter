import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;

import 'package:flutter_vidi7/ocjena.dart';
import 'package:flutter_vidi7/kontakt.dart';




void main() {
  runApp(MaterialApp(
    title: 'VIDI Test application',
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Pocetna(),
      '/ocjena': (context) => Ocjena(),
      '/kontakt': (context) => Kontakt(),
    },
  ));
}



class Pocetna extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('VIDI Test application'),
          backgroundColor: Colors.green[700],
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Image.asset(
              'assets/Naslovnica.png',
            ),

            ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RaisedButton(
                  child: Text('Ocjena', style: TextStyle(fontSize: 12),),
                  color: Colors.green[700],
                  textColor: Colors.white,
                  splashColor: Colors.green[300],
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Ocjena()),
                      );
                    },
                ),
                RaisedButton(
                  child: Text('Kontakt', style: TextStyle(fontSize: 12),),
                  color: Colors.green[700],
                  textColor: Colors.white,
                  splashColor: Colors.green[300],
                  onPressed: () {
                    Navigator.pushNamed(context, '/kontakt');
                  },
                ),
                RaisedButton(
                  child: Text('Izlaz', style: TextStyle(fontSize: 12),),
                  color: Colors.red[700],
                  textColor: Colors.white,
                  splashColor: Colors.red[300],
                  onPressed: () {
                    if (Platform.isAndroid) {
                      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                    }
                  },
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

}