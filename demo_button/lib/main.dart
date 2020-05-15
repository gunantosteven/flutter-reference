import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Demo'),
        ),
        body: Center(
            child: RawMaterialButton(
          fillColor: Colors.red,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
              constraints: BoxConstraints.tightFor(height: 50.0, width: 100.0),
        )),
      ),
    );
  }
}
