import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_learn/cubits/counter_cubit.dart';
import 'package:login_learn/misc/app_router.dart';
import 'package:login_learn/pages/hello_page.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      lazy: false,
      child: MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primarySwatch: Colors.blue),
        home: HelloPage(),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: AppRouter.MAIN,
      ),
    );
  }
}
