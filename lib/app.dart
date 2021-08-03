import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_learn/blocs/authentication/authentication_cubit.dart';
import 'package:login_learn/blocs/form/form_bloc.dart';
import 'package:login_learn/blocs/login/login_bloc.dart';
import 'package:login_learn/pages/my_home_page.dart';
import 'package:login_learn/pages/welcome_page.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => FormBloc(),
        ),
        BlocProvider(
          create: (_) => AuthenticationCubit(),
        ),
        BlocProvider(
          //MI SERVE USARE IL CONTESTO GENERATO QUI: se no i BlocProvider non ci sarebbero ancora
            create: (context) => LoginBloc(context.read<AuthenticationCubit>())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocBuilder<AuthenticationCubit, AuthenticationState>(
          builder: (context, state) =>
              (state is Authenticated) ? WelcomePage() : LoginPage(),
        ),
      ),
    );
  }
}
