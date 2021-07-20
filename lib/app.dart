import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_learn/blocs/form_bloc.dart';
import 'package:login_learn/pages/my_home_page.dart';

class App extends StatelessWidget{
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> FormBloc(),
      lazy: false, //Inizializzato subito
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