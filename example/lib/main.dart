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
        primarySwatch: Colors.red,
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

class Gallery extends StatelessWidget {
  const Gallery(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: FlutterImageVideoPicker(
            themeColor: Colors.red,
            title: "Gallery",
            onTap: (value) {
              Future.delayed(const Duration(milliseconds: 500), () {
                if (value != null) {
                  Navigator.pop(context, value);
                }
              });
            }));
  }
}
