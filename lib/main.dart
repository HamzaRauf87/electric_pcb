import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/homepage.dart';
import 'Screens/item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Electric PCB',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Devices(),
    );
  }
}