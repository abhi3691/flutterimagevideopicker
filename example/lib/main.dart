import 'package:example/src/screens/Gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutterimagevideopicker/flutterimagevideopicker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Gallery(context),
                    fullscreenDialog: true,
                  ));
              print("result is ==== $result");
            },
            child: Text("Open Gallery")),
      ),
    );
  }
}
