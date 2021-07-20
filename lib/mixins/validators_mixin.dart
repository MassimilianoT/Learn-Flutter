import 'dart:async';

//I mixin sono un metodo per riusare codice in più classi diverse nella gerarchia
class ValidatorMixin{
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink) {
        if (RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email)) {
          sink.add(email);
        } else {
          sink.addError("Email non valida");
        }
      })
  ;

  //Transformer per validare lo stream della password
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
        if (password.length >= 6) {
          sink.add(password);
        } else {
          sink.addError("Password troppo corta");
        }
      })
  ;
}