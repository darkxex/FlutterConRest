/// Flutter code sample for Scaffold

// This example shows a [Scaffold] with an [AppBar], a [BottomAppBar] and a
// [FloatingActionButton]. The [body] is a [Text] placed in a [Center] in order
// to center the text within the [Scaffold]. The [FloatingActionButton] is
// centered and docked within the [BottomAppBar] using
// [FloatingActionButtonLocation.centerDocked]. The [FloatingActionButton] is
// connected to a callback that increments a counter.
//
// ![](https://flutter.github.io/assets-for-api-docs/assets/material/scaffold_bottom_app_bar.png)

import 'package:flutter/material.dart';


/// This is the main application widget.
class integran extends StatelessWidget {
  static const String _title = 'Graficador de Indicadores';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _count = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Integrantes'),
      ),
      body: Center(
        child: Text('Angel Toloza Gonzalez\n\nMauricio Alejandro Vargas Tamayo\n\nMathías Antonio Cáceres Bustamante'),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          Navigator.of(context, rootNavigator: true).pop(context);
        }),
        tooltip: 'Increment Counter',
        child: Icon(Icons.bar_chart),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
