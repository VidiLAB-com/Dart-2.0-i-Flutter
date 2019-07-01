import 'package:flutter/material.dart';
import 'package:flutter_vidi2/home_page.dart';
import 'package:flutter_vidi2/themes.dart';

void main() => runApp(new ThemeSwitcherApp());

class ThemeSwitcherApp extends StatefulWidget {
  @override
  _ThemeSwitcherAppState createState() => _ThemeSwitcherAppState();
}

class _ThemeSwitcherAppState extends State<ThemeSwitcherApp> {
  ThemeBloc _themeBloc;

  @override
  void initState() {
    super.initState();
    _themeBloc = ThemeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeData>(
      initialData: _themeBloc.initialTheme().data,
      stream: _themeBloc.themeDataStream,
      builder: (BuildContext context, AsyncSnapshot<ThemeData> snapshot) {
        return MaterialApp(
          title: 'Vidi2 Demo',
          theme: snapshot.data,
          home: HomePage(
            themeBloc: _themeBloc,
          ),
        );
      },
    );
  }
}



































// https://flutter.io/docs/cookbook/forms/validation

//import 'package:flutter/material.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final appTitle = 'Form Validation Demo';
//
//    return MaterialApp(
//      title: appTitle,
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text(appTitle),
//        ),
//        body: MyCustomForm(),
//      ),
//    );
//  }
//}
//
//// Create a Form Widget
//class MyCustomForm extends StatefulWidget {
//  @override
//  MyCustomFormState createState() {
//    return MyCustomFormState();
//  }
//}
//
//// Create a corresponding State class. This class will hold the data related to
//// the form.
//class MyCustomFormState extends State<MyCustomForm> {
//  // Create a global key that will uniquely identify the Form widget and allow
//  // us to validate the form
//  //
//  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
//  final _formKey = GlobalKey<FormState>();
//
//  @override
//  Widget build(BuildContext context) {
//    // Build a Form widget using the _formKey we created above
//    return Form(
//      key: _formKey,
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          TextFormField(
//            validator: (value) {
//              if (value.isEmpty) {
//                return 'Please enter some text';
//              }
//            },
//          ),
//          Padding(
//            padding: const EdgeInsets.symmetric(vertical: 16.0),
//            child: RaisedButton(
//              onPressed: () {
//                // Validate will return true if the form is valid, or false if
//                // the form is invalid.
//                if (_formKey.currentState.validate()) {
//                  // If the form is valid, we want to show a Snackbar
//                  Scaffold.of(context)
//                      .showSnackBar(SnackBar(content: Text('Processing Data')));
//                }
//              },
//              child: Text('Submit'),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}







////https://flutter.io/docs/cookbook/forms/retrieve-input
//
//
//import 'package:flutter/material.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Retrieve Text Input',
//      home: MyCustomForm(),
//    );
//  }
//}
//
//// Define a Custom Form Widget
//class MyCustomForm extends StatefulWidget {
//  @override
//  _MyCustomFormState createState() => _MyCustomFormState();
//}
//
//// Define a corresponding State class. This class will hold the data related to
//// our Form.
//class _MyCustomFormState extends State<MyCustomForm> {
//  // Create a text controller. We will use it to retrieve the current value
//  // of the TextField!
//  final myController = TextEditingController();
//
//  @override
//  void dispose() {
//    // Clean up the controller when the Widget is disposed
//    myController.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Retrieve Text Input'),
//      ),
//      body: Padding(
//        padding: const EdgeInsets.all(16.0),
//        child: TextField(
//          controller: myController,
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        // When the user presses the button, show an alert dialog with the
//        // text the user has typed into our text field.
//        onPressed: () {
//          return showDialog(
//            context: context,
//            builder: (context) {
//              return AlertDialog(
//                // Retrieve the text the user has typed in using our
//                // TextEditingController
//                content: Text(myController.text),
//              );
//            },
//          );
//        },
//        tooltip: 'Show me the value!',
//        child: Icon(Icons.text_fields),
//      ),
//    );
//  }
//}