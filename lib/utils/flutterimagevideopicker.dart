import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterimagevideopicker/utils/functions/permissions.dart';
import 'package:flutterimagevideopicker/utils/widgets/Albums.dart';
import 'package:photo_gallery/photo_gallery.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Photo gallery'),
        ),
        body: _loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Albums(albums: _albums),
      ),
    );
  }
}
