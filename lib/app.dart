import 'package:flutter/material.dart';
import 'package:login_learn/pages/my_home_page.dart';
import 'package:login_learn/providers/login_service_provider.dart';
import 'package:login_learn/services/login_service.dart';

class App extends StatelessWidget{
  Widget build(BuildContext context) {
    return LoginServiceProvider(
      LoginService(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    );
  }
}