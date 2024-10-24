import 'package:flutter/widgets.dart';
import '../../widgets/page_content.dart';

class AlbumPhotosPage extends StatelessWidget {
  final String albumId;
  final String albumName;

  const AlbumPhotosPage({
    super.key,
    required this.albumId,
    required this.albumName,
  });

  @override
  Widget build(BuildContext context) {
    return PageContent(
      name: albumName,
    );
  }
}