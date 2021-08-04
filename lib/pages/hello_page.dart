import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_learn/cubits/counter_cubit.dart';
import 'package:login_learn/pages/second_page.dart';

class HelloPage extends StatelessWidget {
  const HelloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, int>(
      builder: (context, counter) => Scaffold(
          appBar: AppBar(
            title: Text("Hello Cubit"),
          ),
          body: Center(
            child: Text("$counter"),
          ),
          floatingActionButton: FloatingActionButton(
            //Approccio standard con le route create sul momento
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => SecondPage(name: "Massi"),
              ),
            ),
            //onPressed: () => context.read<CounterCubit>().increment(),
          )),
    );
  }
}
