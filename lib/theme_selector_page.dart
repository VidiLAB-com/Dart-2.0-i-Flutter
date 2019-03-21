import 'package:flutter/material.dart';
import 'package:flutter_vidi2/themes.dart';

class ThemeSelectorPage extends StatelessWidget {
  final ThemeBloc themeBloc;

  ThemeSelectorPage({Key key, this.themeBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Odabir teme',
        ),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () =>
                    themeBloc.selectedTheme.add(_buildLightTheme()),
                child: Text(
                  'Svijetla tema',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: RaisedButton(
                  onPressed: () =>
                      themeBloc.selectedTheme.add(_buildMildTheme()),
                  child: Text(
                    'Srednja tema',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: RaisedButton(
                  onPressed: () =>
                      themeBloc.selectedTheme.add(_buildDarkTheme()),
                  child: Text(
                    'Tamna tema',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  DemoTheme _buildLightTheme() {
    return DemoTheme(
        'svijetla',
        ThemeData(
          brightness: Brightness.light,
          accentColor: Colors.yellowAccent,
          primaryColor: Colors.yellowAccent,
        ));
  }

  DemoTheme _buildMildTheme() {
    return DemoTheme(
        'srednja',
        ThemeData(
          brightness: Brightness.light,
          accentColor: Colors.grey,
          primaryColor: Colors.grey,
        ));
  }

  DemoTheme _buildDarkTheme() {
    return DemoTheme(
        'tamna',
        ThemeData(
          brightness: Brightness.dark,
          accentColor: Colors.blueGrey,
          primaryColor: Colors.blueGrey,
        ));
  }
}
