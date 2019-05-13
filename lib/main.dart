import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import "package:intl/intl.dart";
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';
import 'dart:io';



void main() {
  runApp(
    MaterialApp(
      title: 'Reading and Writing Files',
      home: FlutterFile(fo: FileOperation()),
    ),
  );
}



class FileOperation  {
  Future<String> get currentDir async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> get systemFile async {
    final path = await currentDir;
    return File('$path/system.txt');
  }

  Future<File> get currentFile async {
    final path = await currentDir;
    return File('$path/data.txt');
  }

  Future<String> readMessageFile() async {
    try {
      final file = await currentFile;
      String message = await file.readAsString();

      return (message);

    } catch (e) {
      return "readMessageFile: " + e.toString();
    }
  }

  Future<String> readMessagePreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = 'last_message';
      final message = prefs.getString(key) ?? "";

      return (message);

    } catch (e) {
      return "readMessagePreferences: " + e.toString();
    }
  }

  Future<String> writeMessage(String message) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = 'last_message';
      prefs.setString(key, message);

      final file = await currentFile;
      file.writeAsString('$message');

      return "";

    } catch (e) {
      return "writeMessage: " + e.toString();
    }
  }

  Future<String> initSystem() async {
    try {
      final file = await systemFile;
      String sysMessage = "Aplikacija je pokrenuta: " + DateFormat('dd.MM.yyyy kk:mm:ss').format(DateTime.now());
      file.writeAsString(sysMessage);

      return "";

    } catch (e) {
      return "initSystem: " + e.toString();
    }
  }

  Future<String> readSystem() async {
    try {
      final file = await systemFile;
      String sysMessage = await file.readAsString();

      return (sysMessage);

    } catch (e) {
      return "readSystem: " + e.toString();
    }
  }

}



class FlutterFile extends StatefulWidget {
  final FileOperation fo;
  FlutterFile({Key key, @required this.fo}) : super(key: key);
  @override
  _FlutterFile createState() => _FlutterFile();
}

class _FlutterFile extends State<FlutterFile> {
  String sysdata = "";
  String data = "";

  @override
  void initState() {
    super.initState();
    widget.fo.initSystem();
  }

  void testRW() {
    widget.fo.writeMessage("Nova poruka je zapisana u " + DateFormat('dd.MM.yyyy kk:mm:ss').format(DateTime.now()));

    //    widget.fo.readMessageFile().then((String value) {
    widget.fo.readMessagePreferences().then((String value) {
      setState(() {
        data = value;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
      widget.fo.readSystem().then((String value) {
        setState(() {
          sysdata = value;
        });
      });

    return Scaffold(
      appBar: AppBar(title: Text('VIDI Demo - rad s datotekama')),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(sysdata),
              Text(data),
            ],
          ),
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: testRW,
        tooltip: 'Zapis nove poruke u datoteku',
        child: Icon(Icons.add),
      ),
    );
  }
}