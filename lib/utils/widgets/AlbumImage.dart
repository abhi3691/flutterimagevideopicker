import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key, required this.album, required this.onTap});

  final Album album;
  final Function onTap;

  @override
  State<StatefulWidget> createState() => AlbumPageState();
}

class AlbumPageState extends State<AlbumPage> {
  List<Medium>? _media;

  @override
  void initState() {
    super.initState();
    initAsync();
  }

  void initAsync() async {
    MediaPage mediaPage = await widget.album.listMedia(newest: true);
    setState(() {
      _media = mediaPage.items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(widget.album.name ?? "Unnamed Album"),
        ),
        body: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          children: <Widget>[
            ...?_media?.map(
              (medium) => GestureDetector(
                onTap: (() async {
                  final File file = await medium.getFile();
                  widget.onTap(file.path);
                  int count = 0;
                  Future.delayed(const Duration(milliseconds: 500), () {
                    Navigator.of(context).popUntil((_) => count++ >= 2);
                  });
                }),
                child: Container(
                  color: Colors.grey[300],
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: MemoryImage(kTransparentImage),
                    image: ThumbnailProvider(
                      mediumId: medium.id,
                      mediumType: medium.mediumType,
                      highQuality: true,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
