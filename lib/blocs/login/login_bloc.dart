import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_learn/blocs/authentication/authentication_cubit.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final AuthenticationCubit authenticationCubit;

  LoginBloc(this.authenticationCubit) : super(LoginInitial());

   @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
      if(event is PerformLogin){
        yield PerformingLogin();

        print("Login con ${event.email}");
        print("Login con ${event.password}");

        await Future.delayed(Duration(seconds: 3), (){});

        yield PerformedLogin();
        this.authenticationCubit.setAuthenticated();
      }
  }

  void performLogin(String? email, String? password) => add(PerformLogin(email, password));

}
