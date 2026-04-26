import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(PicaApp());
}

class PicaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PICA APP',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: LoginPage(),
    );
  }
}
