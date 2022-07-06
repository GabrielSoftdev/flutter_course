import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  static const title = 'Flutter 3.0 Alura';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: title,
      theme: ThemeData(
          primaryColor: Colors.amber, secondaryHeaderColor: Colors.white),
      home: Scaffold(
          appBar: AppBar(
            title: const Center(
              key: Key('MeuCentro'),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            backgroundColor: Colors.blueAccent,
          ),
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Container(color: Colors.redAccent, height: 300, width: 300),
                Container(color: Colors.blueGrey, height: 75, width: 75),
                Container(color: Colors.black, width: 150, height: 150)
              ]))));
}
