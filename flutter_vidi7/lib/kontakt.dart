import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;

import 'package:url_launcher/url_launcher.dart';



class Kontakt extends StatelessWidget {
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
              margin: const EdgeInsets.only(top: 20.0),
              child: Text('''
Zagrebačka cesta 233
10000 Zagreb
Hrvatska
Tel: 01 3096 674; 01 3096 675
Fax: 01 3096 676
              ''', style: TextStyle(fontSize: 12),),
            ),

            Container(
              margin: const EdgeInsets.only(left: 30.0),
              child: ButtonTheme(
                minWidth: 300.0,
                height: 40.0,
                child: RaisedButton(
                  child: Text('Nazovite nas', style: TextStyle(fontSize: 12),),
                  color: Colors.green[700],
                  textColor: Colors.white,
                  splashColor: Colors.green[300],
                  onPressed: () {
                    _launchURL("tel:+01 3096 674");
                  },
                ),
              ),

            ),

            Container(
              margin: const EdgeInsets.only(left: 30.0),
              child: ButtonTheme(
                minWidth: 300.0,
                height: 40.0,
                child: RaisedButton(
                  child: Text('Pošaljite nam Email', style: TextStyle(fontSize: 12),),
                  color: Colors.green[700],
                  textColor: Colors.white,
                  splashColor: Colors.green[300],
                  onPressed: () {
                    _launchURL("mailto:vidi@vidi.hr");
                  },
                ),
              ),

            ),


            Container(
              margin: const EdgeInsets.only(left: 30.0),
              child: ButtonTheme(
                minWidth: 300.0,
                height: 40.0,
                child: RaisedButton(
                  child: Text('Gdje se nalazimo', style: TextStyle(fontSize: 12),),
                  color: Colors.green[700],
                  textColor: Colors.white,
                  splashColor: Colors.green[300],
                  onPressed: () {
                    _launchURL("https://www.google.com/maps/place/Zagreba%C4%8Dka+cesta+233,+10000,+Zagreb/@45.7967819,15.9074603,17z/data=!3m1!4b1!4m5!3m4!1s0x4765d14f8e090919:0xabcdf63d1048fd56!8m2!3d45.7967782!4d15.9096543");
                  },
                ),
              ),

            ),


            Container(
              margin: const EdgeInsets.only(left: 30.0),
              child: ButtonTheme(
                minWidth: 300.0,
                height: 40.0,
                child: RaisedButton(
                  child: Text('Početni zaslon', style: TextStyle(fontSize: 12),),
                  color: Colors.red[700],
                  textColor: Colors.white,
                  splashColor: Colors.red[300],
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

            ),

          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Nije moguće otvoriti web adresu $url';
    }
  }


}