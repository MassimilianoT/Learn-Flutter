import 'dart:async';

import 'package:login_learn/mixins/validators_mixin.dart';
import 'package:rxdart/rxdart.dart';

//Classe che rappresenta il servizio che voglio distribuire sulla app
//NB espone i getter pubblici solo su proprietà che si vogliono mostrare, lo stream all'esterno infatti non è visibile ma solo quello trasformato
class LoginService with ValidatorMixin{
  //Utilizzo dei controller per catturare lo stream di informazioni dai TextField
  StreamController<String> _emailController = BehaviorSubject();
  StreamController<String> _passwordController = BehaviorSubject();

  //getter privati -> ottenuti tramite refactor
  Stream<String> get emailStream =>
      _emailController.stream.transform(validateEmail);

  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validatePassword);

  Stream<bool> get loginButtonStream =>
      Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);


  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;


  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}