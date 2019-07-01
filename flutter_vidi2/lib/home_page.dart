import 'package:flutter/material.dart';
import 'package:flutter_vidi2/theme_selector_page.dart';
import 'package:flutter_vidi2/themes.dart';

import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  final ThemeBloc themeBloc;

  HomePage({Key key, this.themeBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.list,
            ),
            tooltip: 'Odaberite temu',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ThemeSelectorPage(
                        themeBloc: themeBloc,
                      )));
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        },
        child: Icon(
          Icons.transit_enterexit,
        ),
      ),

      body: Center(
        child: Text(
          'Vidi Demo',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
