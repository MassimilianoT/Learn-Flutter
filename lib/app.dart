import 'package:flutter/material.dart';
import 'package:login_learn/pages/my_home_page.dart';

class App extends StatelessWidget{
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}