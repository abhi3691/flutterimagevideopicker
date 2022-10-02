import 'package:flutter/material.dart';
import 'package:flutterimagevideopicker/utils/widgets/AlbumImage.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

class Albums extends StatelessWidget {
  const Albums({
    Key? key,
    required List<Album>? albums,
  })  : _albums = albums,
        super(key: key);

  final List<Album>? _albums;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double gridWidth = (constraints.maxWidth - 20) / 3;
        double gridHeight = gridWidth + 33;
        double ratio = gridWidth / gridHeight;
        return Container(
          padding: const EdgeInsets.all(5),
          child: GridView.count(
            childAspectRatio: ratio,
            crossAxisCount: 3,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            children: <Widget>[
              ...?_albums?.map(
                (album) => GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AlbumPage(album))),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Container(
                          color: Colors.grey[300],
                          height: gridWidth,
                          width: gridWidth,
                          child: FadeInImage(
                            fit: BoxFit.cover,
                            placeholder: MemoryImage(kTransparentImage),
                            image: AlbumThumbnailProvider(
                              albumId: album.id,
                              mediumType: album.mediumType,
                              highQuality: true,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Text(
                          album.name ?? "Unnamed Album",
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            height: 1.2,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Text(
                          album.count.toString(),
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            height: 1.2,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
