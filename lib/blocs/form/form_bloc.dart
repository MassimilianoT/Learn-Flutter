import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormState> {
  FormBloc() : super(FormState());

  @override
  Stream<FormState> mapEventToState(
    FormEvent event,
  ) async* {
    if(event is EmailChangedEvent){
      yield FormState(
        email: event.email,
        password: state.password,
      );}
      else if(event is PasswordChangedEvent){
        yield FormState(
          email: state.email,
          password: event.password,
        );
    }
  }
  void changeEmail(String email) => add(EmailChangedEvent(email));
  void changePassword(String password) => add(PasswordChangedEvent(password));

}
