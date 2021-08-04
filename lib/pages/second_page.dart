import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String name;

  const SecondPage({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second page"),),
      body: Center(
        child: Column(
          children: [
            Text("Hello $name"),
            TextButton(onPressed: ()=>Navigator.pop(context), child: Text("Esci"))
          ],
        ),
      ),
    );
  }
}
