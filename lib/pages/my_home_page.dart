import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_learn/blocs/form_bloc.dart' as B;
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
   //Struttura della app
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Login"),),
        body: BlocBuilder<B.FormBloc, B.FormState>(
          builder: (BuildContext context, state) => Column(
            children: [
              _email(context, state),
              _password(context, state),
              _loginButton(context, state),
            ],
          ),
        ));
  }

  //Uso dei metodi "staccati" in modo sia facile refactor modifica e comprensione di cosa fa cosa

  Widget _email(BuildContext context, B.FormState state) =>
      Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                onChanged: context.watch<B.FormBloc>().changeEmail,
                decoration: InputDecoration(
                  hintText: "Email",
                  labelText: "Email",
                  //ho dovuto inventarmi sta cosa
                  errorText:
                  !state.validEmail ? 'Email non valida' : null,
                ),
                keyboardType: TextInputType.emailAddress,
              ));

  Widget _password(BuildContext context, B.FormState state) =>Padding(
    padding: const EdgeInsets.all(12.0),
    child: TextField(
      onChanged:context.watch<B.FormBloc>().changePassword,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Password",
        labelText: "Password",
        errorText: !state.validPassword
            ? 'Password non valida'
            : null,
      ),
    ),
  );

  Widget _loginButton(BuildContext context, B.FormState state) =>TextButton(
      onPressed: state.validForm == true ? () {} : null,
      child: Text("Login"));


}
