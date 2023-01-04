import 'package:flutter/material.dart';
import 'package:flutter_websocket/screens/homescreen.dart';
import 'package:flutter_websocket/screens/newscreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WEB Socket',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      //home: WebSocket(),
      // home: ChatApp(),
    );
  }
}


