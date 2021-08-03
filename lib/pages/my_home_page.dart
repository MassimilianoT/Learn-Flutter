import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:login_learn/blocs/form/form_bloc.dart' as B;
import 'package:login_learn/blocs/login/login_bloc.dart';

class LoginPage extends StatelessWidget {
  //Struttura della app
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: BlocBuilder<B.FormBloc, B.FormState>(
          builder: (BuildContext context, state) =>
              BlocBuilder<LoginBloc, LoginState>(
            builder: (context, loginState) {
              return Column(
                children: [
                  _email(context, state, loginState),
                  _password(context, state, loginState),
                  _loginButton(context, state, loginState),
                  if (loginState is PerformingLogin) _circularProgressBar(),
                ],
              );
            },
          ),
        ));
  }

  //Uso dei metodi "staccati" in modo sia facile refactor modifica e comprensione di cosa fa cosa

  Widget _email(
          BuildContext context, B.FormState state, LoginState loginState) =>
      Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            enabled: loginState is! PerformingLogin,
            onChanged: context.watch<B.FormBloc>().changeEmail,
            decoration: InputDecoration(
              hintText: "Email",
              labelText: "Email",
              //ho dovuto inventarmi sta cosa
              errorText: !state.validEmail ? 'Email non valida' : null,
            ),
            keyboardType: TextInputType.emailAddress,
          ));

  Widget _password(
          BuildContext context, B.FormState state, LoginState loginState) =>
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          enabled: loginState is! PerformingLogin,
          onChanged: context.watch<B.FormBloc>().changePassword,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Password",
            labelText: "Password",
            errorText: !state.validPassword ? 'Password non valida' : null,
          ),
        ),
      );

  Widget _loginButton(
          BuildContext context, B.FormState state, LoginState loginState) =>
      TextButton(
          onPressed: state.validForm == true && loginState is! PerformingLogin
              ? () => context
                  .read<LoginBloc>()
                  .performLogin(state.email, state.password)
              : null,
          child: Text("Login"));

  Widget _circularProgressBar() => CircularProgressIndicator();
}
