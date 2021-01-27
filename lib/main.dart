import 'package:flutter/material.dart';

import 'next_screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "簡単セルフチェック",
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
