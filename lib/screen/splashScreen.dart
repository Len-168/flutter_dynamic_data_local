import 'dart:async';

import 'package:cine_stream_ui/constant/colors.dart';
import 'package:cine_stream_ui/screen/multi_page.dart';
import 'package:flutter/material.dart';
import '../constant/image.dart';

class splasScreen extends StatefulWidget {
  const splasScreen({super.key});

  @override
  State<splasScreen> createState() => _splasScreenState();
}

class _splasScreenState extends State<splasScreen> {
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MultiPage(),
          ),
          (route) => false),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: BackAppColors,
      ),
      child: Image.asset(ImagesplasScreen),
    );
  }
}
