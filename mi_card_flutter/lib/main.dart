import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100.0,
                height: double.infinity,
                color: Colors.red,
                child: Text('Container 1'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100.0,
                    width: 100.0,
                    color: Colors.yellow,
                    child: Text('Container2'),
                  ),
                  Container(
                    height: 100.0,
                    width: 100.0,
                    color: Colors.green,
                    child: Text('Container4'),
                  ),
                ],
              ),
              Container(
                width: 100.0,
                height: double.infinity,
                color: Colors.blue,
                child: Text('Container3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
