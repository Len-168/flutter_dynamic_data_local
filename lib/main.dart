import 'package:cine_stream_ui/screen/multi_page.dart';
import 'package:cine_stream_ui/screen/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splasScreen(), // replace your screen
    );
  }
}
