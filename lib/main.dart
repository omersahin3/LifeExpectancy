import 'package:flutter/material.dart';

import 'input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        //brightness: Brightness.dark,
        primaryColor: Colors.orange,
        accentColor: Colors.orange,//Button
        scaffoldBackgroundColor: Colors.black54,
      ),
      home: InputPage(),
    );
  }
}

