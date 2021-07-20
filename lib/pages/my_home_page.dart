import 'dart:async';
import 'package:login_learn/providers/login_service_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
   //Struttura della app
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Login"),),
        body: Column(
          children: [
            _email(context),
            _password(context),
            _loginButton(context),
          ],
        ));
  }

  //Uso dei metodi "staccati" in modo sia facile refactor modifica e comprensione di cosa fa cosa

  Widget _email(BuildContext context) =>
      StreamBuilder<String>(
        stream: LoginServiceProvider.of(context).loginService.emailStream,
        builder: (context, snapshot) {
          return Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                onChanged: LoginServiceProvider.of(context).loginService.changeEmail,
                decoration: InputDecoration(
                  hintText: "Email",
                  labelText: "Email",
                  //ho dovuto inventarmi sta cosa
                  errorText:
                  snapshot.hasError ? snapshot.error.toString() : null,
                ),
                keyboardType: TextInputType.emailAddress,
              ));
        },
      );

  Widget _password(BuildContext context) =>
      StreamBuilder(
          stream: LoginServiceProvider.of(context).loginService.passwordStream,
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                onChanged: LoginServiceProvider.of(context).loginService.changePassword,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  errorText: snapshot.hasError
                      ? snapshot.error.toString()
                      : null,
                ),
              ),
            );
          });

  Widget _loginButton(BuildContext context) =>
      StreamBuilder(
          stream: LoginServiceProvider.of(context).loginService.loginButtonStream,
          builder: (context, snapshot) {
            return TextButton(
                onPressed: snapshot.data == true ? () {} : null,
                child: Text("Login"));
          });


}
