import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterimagevideopicker/utils/functions/permissions.dart';
import 'package:flutterimagevideopicker/utils/widgets/Albums.dart';
import 'package:photo_gallery/photo_gallery.dart';

class FlutterImageVideoPicker extends StatefulWidget {
  final String title;
  final MaterialColor themeColor;

  const FlutterImageVideoPicker({
    super.key,
    required this.onTap,
    required this.title,
    required this.themeColor,
  });

  final Function onTap;

  @override
  _FlutterImageVideoPickerState createState() =>
      _FlutterImageVideoPickerState();
}

class _FlutterImageVideoPickerState extends State<FlutterImageVideoPicker> {
  List<Album>? _albums;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loading = true;
    initAsync();
  }

  Future<void> initAsync() async {
    if (await promptPermissionSetting()) {
      List<Album> imageAlbums = await PhotoGallery.listAlbums(
        mediumType: MediumType.image,
      );
      List<Album> videoAlbums =
          await PhotoGallery.listAlbums(mediumType: MediumType.video);
      setState(() {
        _albums = [
          ...imageAlbums,
          ...videoAlbums,
        ];
        _loading = false;
      });
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: widget.themeColor),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Albums(
                themeColor: widget.themeColor,
                albums: _albums,
                onTap: widget.onTap,
              ),
      ),
    );
  }
}
