import 'package:flutter/material.dart';

import 'burc_listesi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Burç Uygulaması',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: BurcListesi(),
    );
  }
}