import 'package:flutter/material.dart';
import 'package:flutterimagevideopicker/utils/flutterimagevideopicker.dart';

class Gallery extends StatelessWidget {
  const Gallery(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: FlutterImageVideoPicker(
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
