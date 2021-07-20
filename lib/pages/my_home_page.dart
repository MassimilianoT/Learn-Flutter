import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  StreamController<String> _emailController = BehaviorSubject();
  StreamController<String> _passwordController = BehaviorSubject();

  final _validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError("Email non valida");
    }
  });
  final _validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 6) {
      sink.add(password);
    } else {
      sink.addError("Password troppo corta");
    }
  });

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            _email(),
            _password(),
            _loginButton(),
          ],
        ));
  }

  Widget _email() => StreamBuilder<String>(
        stream: _emailStream,
        builder: (context, snapshot) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: _emailController.sink.add,
                decoration: InputDecoration(
                  hintText: "Email",
                  labelText: "Email",
                  errorText: snapshot.hasError ? snapshot.error.toString() : null,
                ),
                keyboardType: TextInputType.emailAddress,
              ));
        },
      );

  Widget _password() => StreamBuilder(
      stream: _passwordStream,
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: _passwordController.sink.add,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
              labelText: "Password",
              errorText: snapshot.hasError ? snapshot.error.toString() : null,
            ),
          ),
        );
      });

  Stream<String> get _emailStream =>
      _emailController.stream.transform(_validateEmail);

  Stream<String> get _passwordStream =>
      _passwordController.stream.transform(_validatePassword);

  Stream<bool> get _loginButtonStream =>
      Rx.combineLatest2(_emailStream, _passwordStream, (a, b) => true);

  Widget _loginButton() => StreamBuilder(
      stream: _loginButtonStream,
      builder: (context, snapshot) {
        return TextButton(
            onPressed: snapshot.data == true ? () {} : null,
            child: Text("Login"));
      });
}
